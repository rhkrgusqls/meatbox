package com.product.db;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import jdbc.db.connection.DBConnectionManager;

// ProductInterface를 구현하고 있으므로, ProductInterface에도 getProductDetail 메소드 선언이 필요할 수 있습니다.
public class ProductDAO implements ProductInterface {

    @Override
    public List<ProductBean> selectProducts(String brandNumber, String storageType, String saleTag,
                                            String productForm, Integer allowedMemberLv,
                                            String categoryName, String detailCategoryName,
                                            int offset, int limit) throws ProductException {
        List<ProductBean> resultList = new ArrayList<>();

        String sql = "SELECT * FROM view_product_full_info WHERE 1=1"
                + " AND (? IS NULL OR brand_number = ?)"
                + " AND (? IS NULL OR storage_type = ?)"
                + " AND (? IS NULL OR sale_tag = ?)"
                + " AND (? IS NULL OR product_form = ?)"
                + " AND (? IS NULL OR allowed_member_lv = ?)"
                + " AND (? IS NULL OR category_name = ?)"
                + " AND (? IS NULL OR detail_category_name = ?)"
                + " LIMIT ? OFFSET ?";

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, brandNumber);
            stmt.setString(2, brandNumber);

            stmt.setString(3, storageType);
            stmt.setString(4, storageType);

            stmt.setString(5, saleTag);
            stmt.setString(6, saleTag);

            stmt.setString(7, productForm);
            stmt.setString(8, productForm);

            if (allowedMemberLv != null) {
                stmt.setInt(9, allowedMemberLv);
                stmt.setInt(10, allowedMemberLv);
            } else {
                stmt.setNull(9, Types.INTEGER);
                stmt.setNull(10, Types.INTEGER);
            }

            stmt.setString(11, categoryName);
            stmt.setString(12, categoryName);

            stmt.setString(13, detailCategoryName);
            stmt.setString(14, detailCategoryName);

            stmt.setInt(15, limit);
            stmt.setInt(16, offset);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ProductBean p = new ProductBean();
                    p.setProductId(rs.getInt("product_id"));
                    p.setProductName(rs.getString("product_name"));
                    p.setBrandNumber(rs.getString("brand_number"));
                    p.setBrandName(rs.getString("brand_name"));
                    p.setStorageType(rs.getString("storage_type"));
                    p.setSaleTag(rs.getString("sale_tag"));
                    p.setProductForm(rs.getString("product_form"));
                    p.setAllowedMemberLv(rs.getInt("allowed_member_lv"));
                    p.setQuantity(rs.getInt("quantity"));
                    p.setExpireDate(rs.getString("expire_date"));
                    p.setDeliveryFee(rs.getInt("delivery_fee"));
                    p.setPrice(rs.getInt("price"));
                    p.setUnitPrice(rs.getInt("unit_price"));
                    p.setSellerNote(rs.getString("seller_note"));
                    p.setCategoryName(rs.getString("category_name"));
                    p.setDetailCategoryName(rs.getString("detail_category_name"));
                    p.setProductImage(rs.getString("product_image"));
                    p.setProductDetail(rs.getString("product_detail"));
                    p.setCautionsText(rs.getString("cautions_text"));

                    resultList.add(p);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ProductException("상품 목록 조회 중 오류가 발생했습니다.");
        }

        return resultList;
    }
    
    @Override
    public List<CategoryBean> getCategoriesByParent(Integer parentId) throws SQLException {
        List<CategoryBean> list = new ArrayList<>();

        String sql;
        if (parentId == null)
            sql = "SELECT category_id, category_name, level FROM v_category WHERE parent_category_id IS NULL ORDER BY category_id";
        else
            sql = "SELECT category_id, category_name, level FROM v_category WHERE parent_category_id = ? ORDER BY category_id";

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (parentId != null)
                ps.setInt(1, parentId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CategoryBean bean = new CategoryBean();
                    bean.setCategoryId(rs.getInt("category_id"));
                    bean.setCategoryName(rs.getString("category_name"));
                    bean.setLevel(rs.getInt("level"));
                    list.add(bean);
                }
            }
        }
        return list;
    }

    // ========================================================================
    // ================      상품 상세 페이지를 위한 메소드 추가      ================
    // ========================================================================
    /**
     * 특정 상품의 모든 상세 정보를 조회하는 메소드.
     * @param productId 조회할 상품의 ID (product_id)
     * @return 상품의 모든 상세 정보가 담긴 ProductDetailBean 객체
     */
    @Override
    public ProductDetailBean getProductDetail(int productId) {
        ProductDetailBean productDetail = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnectionManager.getConnection();

            // 1. 상품 기본 정보 조회 (수량 제외)
            String productSQL = "SELECT product_id, product_name, price, seller_note, delivery_fee " +
                                "FROM product WHERE product_id = ?";
            pstmt = conn.prepareStatement(productSQL);
            pstmt.setInt(1, productId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                productDetail = new ProductDetailBean();
                productDetail.setProduct_id(rs.getInt("product_id"));
                productDetail.setName(rs.getString("product_name"));
                productDetail.setPrice(rs.getInt("price"));
                productDetail.setSeller_note(rs.getString("seller_note"));
                productDetail.setDelivery_fee(rs.getInt("delivery_fee"));
            } else {
                System.err.println("ProductDAO: " + productId + "에 해당하는 상품이 없습니다.");
                return null;
            }
            rs.close();
            pstmt.close();

            // 2. 옵션에서 종합 수량 조회
            String quantitySQL = "SELECT SUM(quantity) AS total_quantity FROM product_option WHERE product_id = ?";
            pstmt = conn.prepareStatement(quantitySQL);
            pstmt.setInt(1, productId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                productDetail.setQuantity(rs.getInt("total_quantity")); // 종합 수량
            }
            rs.close();
            pstmt.close();

            // 3. 상품 이미지 리스트 조회
            String imageSQL = "SELECT * FROM product_image WHERE product_id = ?";
            pstmt = conn.prepareStatement(imageSQL);
            pstmt.setInt(1, productId);
            rs = pstmt.executeQuery();

            List<ProductImageBean> imageList = new ArrayList<>();
            while(rs.next()){
                ProductImageBean imageBean = new ProductImageBean();
                imageBean.setProduct_image_id(rs.getInt("product_image_id"));
                imageBean.setProduct_id(rs.getInt("product_id"));
                imageBean.setDir(rs.getString("dir"));
                imageList.add(imageBean);
            }
            productDetail.setImageList(imageList);
            rs.close();
            pstmt.close();

            // 4. 상품 옵션 리스트 조회
            String optionSQL = "SELECT * FROM product_option WHERE product_id = ?";
            pstmt = conn.prepareStatement(optionSQL);
            pstmt.setInt(1, productId);
            rs = pstmt.executeQuery();

            List<ProductOptionBean> optionList = new ArrayList<>();
            while(rs.next()){
                ProductOptionBean optionBean = new ProductOptionBean();
                optionBean.setOption_id(rs.getInt("option_id"));
                optionBean.setProduct_id(rs.getInt("product_id"));
                optionBean.setOption_name(rs.getString("option_name"));
                optionBean.setOption_detail(rs.getString("option_detail"));
                optionBean.setPrice_of_option(rs.getInt("price_of_option"));
                optionBean.setQuantity(rs.getInt("quantity")); // 옵션별 수량
                optionList.add(optionBean);
            }
            productDetail.setOptionList(optionList);
            rs.close();
            pstmt.close();

            // 5. 상품 상세설명 조회
            String detailSQL = "SELECT dir FROM product_detail WHERE product_id = ?";
            pstmt = conn.prepareStatement(detailSQL);
            pstmt.setInt(1, productId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                productDetail.setDetailDir(rs.getString("dir"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return productDetail;
    }
    
    /**
     * 특정 카테고리 ID에 해당하는 상품 목록과 각 상품의 대표 이미지를 조회하는 메소드.
     * @param categoryId 조회할 상세 카테고리의 ID (detail_category_id)
     * @param offset 조회를 시작할 위치
     * @param limit 조회할 상품의 개수
     * @return 해당 카테고리의 상품 리스트 (List<ProductBean>)
     */

    @Override
    public List<ProductBean> getProductsByCategory(int categoryId, int offset, int limit) {
        List<ProductBean> productList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // product 테이블과 product_of_detail_category를 조인하고,
        // 서브쿼리를 이용해 첫 번째 이미지 경로와 옵션 수량 합계를 가져옵니다.
        String sql = "SELECT p.*, " +
                     " (SELECT dir FROM product_image pi WHERE pi.product_id = p.product_id LIMIT 1) AS productImage, " +
                     " (SELECT SUM(quantity) FROM product_option po WHERE po.product_id = p.product_id) AS totalQuantity " +
                     "FROM product p " +
                     "JOIN product_of_detail_category podc ON p.product_id = podc.product_id " +
                     "WHERE podc.detail_category_id = ? " +
                     "ORDER BY p.created_at DESC " +
                     "LIMIT ? OFFSET ?";

        try {
            conn = DBConnectionManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, categoryId);
            pstmt.setInt(2, limit);
            pstmt.setInt(3, offset);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                ProductBean p = new ProductBean();
                p.setProductId(rs.getInt("product_id"));
                p.setProductName(rs.getString("product_name"));
                
                // 옵션에서 합산된 수량 사용
                p.setQuantity(rs.getInt("totalQuantity"));
                
                p.setPrice(rs.getInt("price"));
                p.setSellerNote(rs.getString("seller_note"));
                p.setProductImage(rs.getString("productImage"));

                // 필요하다면 나머지 setter 추가

                productList.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return productList;
    }


    @Override
    public List<ProductOptionBean> selectProductsOptionsDetail(int product_id) throws ProductException {
        List<ProductOptionBean> options = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM product_option WHERE product_id = ?";

        try {
            conn = DBConnectionManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, product_id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                ProductOptionBean option = new ProductOptionBean();
                option.setOption_id(rs.getInt("option_id"));
                option.setProduct_id(rs.getInt("product_id"));
                option.setOption_name(rs.getString("option_name"));
                option.setOption_detail(rs.getString("option_detail"));
                option.setPrice_of_option(rs.getInt("price_of_option"));
                option.setQuantity(rs.getInt("quantity"));
                options.add(option);
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new ProductException("상품 옵션 조회 실패", e);
        } finally {
            try { if (rs != null) rs.close(); if (pstmt != null) pstmt.close(); if (conn != null) conn.close(); } catch (Exception e) {}
        }

        return options;
    }
    
    
}