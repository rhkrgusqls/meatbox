package com.admin.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.product.db.ProductDAO;
import com.product.db.ProductDetailBean;
import com.product.db.ProductOptionBean;

import jdbc.db.connection.DBConnectionManager;

public class OrderDAO {

    // --- 기존 getAllOrdersWithProducts() 메서드 ---
    public List<JoinedOrderData> getAllOrdersWithProducts() {
        // ... (기존 코드 유지) ...
        List<JoinedOrderData> resultList = new ArrayList<>();
	    Connection conn = null;
	    PreparedStatement pstmtOrder = null;
	    PreparedStatement pstmtProductIds = null;
	    ResultSet rsOrder = null;
	    ResultSet rsProductIds = null;
	    ProductDAO pDAO = new ProductDAO(); // com.product.db.ProductDAO 경로 확인
	    try {
	        conn = DBConnectionManager.getConnection(); // jdbc.db.connection.DBConnectionManager 경로 확인

	        // 1. _order 테이블에서 모든 주문 조회
	        String orderSQL = "SELECT * FROM _order";
	        pstmtOrder = conn.prepareStatement(orderSQL);
	        rsOrder = pstmtOrder.executeQuery();

	        while (rsOrder.next()) {
	            JoinedOrderData joinedOrder = new JoinedOrderData();
	            joinedOrder.setOrderId(rsOrder.getInt("order_id"));
	            joinedOrder.setUserIndex(rsOrder.getInt("user_index"));
	            joinedOrder.setPaymentMethodId(rsOrder.getInt("payment_method_id"));
	            joinedOrder.setDiscountAmount(rsOrder.getInt("discount_amount"));
	            joinedOrder.setShippingFee(rsOrder.getInt("shipping_fee"));
	            joinedOrder.setUsedDeposit(rsOrder.getInt("used_deposit"));
	            joinedOrder.setUsedPoints(rsOrder.getInt("used_points"));
	            joinedOrder.setOrderDate(rsOrder.getTimestamp("order_date"));
	            joinedOrder.setDeliveryStatus(rsOrder.getString("delivery_status"));
	            joinedOrder.setFinalPrice(rsOrder.getInt("final_price")); // final_price 추가됨

	            // 2. 해당 order_id의 order_product에서 product_id 조회
	            String productIdsSQL = "SELECT product_id FROM order_product WHERE order_id = ?";
	            pstmtProductIds = conn.prepareStatement(productIdsSQL);
	            pstmtProductIds.setInt(1, joinedOrder.getOrderId());
	            rsProductIds = pstmtProductIds.executeQuery();

	            List<ProductDetailBean> productList = new ArrayList<>();
	            while (rsProductIds.next()) {
	                int productId = rsProductIds.getInt("product_id");

	                // 3. product_id로 상품 상세 정보 조회 (N+1 문제 발생 지점)
	                ProductDetailBean productDetail = pDAO.getProductDetail(productId);
	                if (productDetail != null) {
	                    productList.add(productDetail);
	                }
	            }
	            joinedOrder.setProductList(productList);

	            resultList.add(joinedOrder);

	            // 리소스 해제 위치 수정: 루프 안에서 닫으면 다음 반복 시 문제 발생
                // rsProductIds.close();
	            // pstmtProductIds.close();
                if (rsProductIds != null) rsProductIds.close();
                if (pstmtProductIds != null) pstmtProductIds.close();
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // 자원 해제 순서 및 null 체크 강화
            closeDB(null, pstmtProductIds, rsProductIds); // 위에서 이미 닫았으므로 rs, pstmt는 null일 것임
            closeDB(conn, pstmtOrder, rsOrder);
	    }

	    return resultList;
    }

    // ✅ [추가] 주문 ID로 주문 기본 정보 조회
    public JoinedOrderData getOrderDetailsById(int orderId) {
        JoinedOrderData orderDetail = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM _order WHERE order_id = ?"; // 실제 주문 테이블명 확인

        try {
            conn = DBConnectionManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, orderId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                orderDetail = new JoinedOrderData();
                orderDetail.setOrderId(rs.getInt("order_id"));
                orderDetail.setUserIndex(rs.getInt("user_index"));
                orderDetail.setPaymentMethodId(rs.getInt("payment_method_id"));
                orderDetail.setDiscountAmount(rs.getInt("discount_amount"));
                orderDetail.setShippingFee(rs.getInt("shipping_fee"));
                orderDetail.setUsedDeposit(rs.getInt("used_deposit"));
                orderDetail.setUsedPoints(rs.getInt("used_points"));
                orderDetail.setOrderDate(rs.getTimestamp("order_date"));
                orderDetail.setDeliveryStatus(rs.getString("delivery_status"));
                orderDetail.setFinalPrice(rs.getInt("final_price")); // final_price 컬럼 추가
                // 필요하다면 Address ID 등 추가 정보 조회
                // orderDetail.setAddressId(rs.getInt("address_id"));
            }
        } catch (Exception e) {
            System.err.println("getOrderDetailsById() 에러: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeDB(conn, pstmt, rs);
        }
        return orderDetail;
    }

    // ✅ [추가] 주문 ID로 선택된 옵션 목록 (+상품명) 조회
    public List<ProductOptionBean> getSelectedOptionsForOrder(int orderId) {
        List<ProductOptionBean> selectedOptions = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        // order_product 테이블과 product_option, product 테이블을 JOIN하여 필요한 정보 조회
        String sql = "SELECT op.*, p.name as product_name, opd.quantity " + // 수량(quantity) 추가
                     "FROM order_product opd " +
                     "JOIN product_option op ON opd.product_option_id = op.product_option_id " +
                     "JOIN product p ON op.product_id = p.product_id " + // product 테이블 JOIN 추가
                     "WHERE opd.order_id = ?";
        
        // ProductOptionBean에 product_name, quantity 필드와 getter/setter가 있다고 가정

        try {
            conn = DBConnectionManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, orderId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                ProductOptionBean option = new ProductOptionBean();

                option.setOption_id(rs.getInt("product_option_id"));
                option.setProduct_id(rs.getInt("product_id"));
                option.setOption_name(rs.getString("option_name"));
                option.setPrice_of_option(rs.getInt("option_price"));
                
                // JOIN으로 가져온 상품명과 수량 설정
                option.setQuantity(rs.getInt("quantity"));         // ProductOptionBean에 setQuantity 가정
                option.setProduct_id(rs.getInt("product_id"));         // ProductOptionBean에 setQuantity 가정

                selectedOptions.add(option);
            }
        } catch (Exception e) {
            System.err.println("getSelectedOptionsForOrder() 에러: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeDB(conn, pstmt, rs);
        }
        return selectedOptions;
    }

    // ✅ [추가] 자원 해제 헬퍼 메서드
    private void closeDB(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    /**
     * 총 매출액 계산 (DELIVERED 상태 기준)
     * @return 총 매출액
     */
    public int getTotalSales() {
        int totalSales = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT SUM(final_price) AS total_sales FROM _order WHERE delivery_status = 'DELIVERED'";

        try {
            // 수정된 부분: getInstance() 제거하고 getConnection() 직접 호출
            conn = DBConnectionManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                totalSales = rs.getInt("total_sales");
            }
        } catch (SQLException e) {
            System.err.println("getTotalSales SQL Error: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) { // DBConnectionManager.getConnection() 예외 처리 추가
            System.err.println("DB Connection Error in getTotalSales: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // 자원 해제 (기존과 동일)
             try {
                 if (rs != null) rs.close();
                 if (pstmt != null) pstmt.close();
                 if (conn != null) conn.close();
             } catch (SQLException e) {
                 e.printStackTrace();
             }
        }
        return totalSales;
    }

     /**
     * 특정 상태별 주문 건수 계산
     * @param status 조회할 배송 상태 (e.g., 'PENDING', 'SHIPPED', 'DELIVERED', 'CANCELLED')
     * @return 해당 상태의 주문 건수
     */
    public int getOrderStatusCount(String status) {
        int count = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

         if (!"PENDING".equals(status) && !"SHIPPED".equals(status) &&
             !"DELIVERED".equals(status) && !"CANCELLED".equals(status)) {
             System.err.println("Invalid delivery status: " + status);
             return 0;
         }

        String sql = "SELECT COUNT(*) AS status_count FROM _order WHERE delivery_status = ?";

        try {
            // 수정된 부분: getInstance() 제거하고 getConnection() 직접 호출
            conn = DBConnectionManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, status);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt("status_count");
            }
        } catch (SQLException e) {
            System.err.println("getOrderStatusCount SQL Error: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) { // DBConnectionManager.getConnection() 예외 처리 추가
            System.err.println("DB Connection Error in getOrderStatusCount: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // 자원 해제 (기존과 동일)
             try {
                 if (rs != null) rs.close();
                 if (pstmt != null) pstmt.close();
                 if (conn != null) conn.close();
             } catch (SQLException e) {
                 e.printStackTrace();
             }
        }
        return count;
    }
    
    /**
     * 최근 주문 5개를 조회하는 메서드 (주문일시 내림차순)
     * @return 최근 주문 5개 목록
     */
    public List<JoinedOrderData> getRecentOrders(int limit) {
        List<JoinedOrderData> recentOrders = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM _order ORDER BY order_date DESC LIMIT ?";

        try {
            conn = DBConnectionManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, limit);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                JoinedOrderData order = new JoinedOrderData();
                order.setOrderId(rs.getInt("order_id"));
                order.setUserIndex(rs.getInt("user_index"));
                order.setPaymentMethodId(rs.getInt("payment_method_id"));
                order.setDiscountAmount(rs.getInt("discount_amount"));
                order.setShippingFee(rs.getInt("shipping_fee"));
                order.setUsedDeposit(rs.getInt("used_deposit"));
                order.setUsedPoints(rs.getInt("used_points"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setDeliveryStatus(rs.getString("delivery_status"));
                order.setFinalPrice(rs.getInt("final_price"));
                
                recentOrders.add(order);
            }
        } catch (SQLException e) {
            System.err.println("getRecentOrders SQL Error: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("DB Connection Error in getRecentOrders: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeDB(conn, pstmt, rs);
        }
        
        return recentOrders;
    }
    
    // -- 페이징 관련 메서드 추가 (필요 시 이전 답변 참고) --
    // public int getTotalOrderCount() { ... }
    // public List<JoinedOrderData> getOrdersWithProductsPaginated(int startRow, int pageSize) { ... }
}