package com.product.db;

import java.sql.SQLException;
import java.util.List;

public interface ProductInterface {
	/**
	 * @param brandNumber
	 * @param storageType
	 * @param saleTag
	 * @param productForm
	 * @param allowedMemberLv
	 * @param categoryName
	 * @param detailCategoryName
	 * @param offset
	 * @param limit
	 * @return
	 * @throws ProductException
	 * 
	 * 카테고리에 따른 상품 리스트 출력
	 */
    List<ProductBean> selectProducts(
        String brandNumber,
        String storageType,
        String saleTag,
        String productForm,
        Integer allowedMemberLv,
        String categoryName,
        String detailCategoryName,
        int offset,
        int limit
    ) throws ProductException;

	List<CategoryBean> getCategoriesByParent(
		Integer parentId
	) throws SQLException;

	/**
	 * 특정 상품의 모든 상세 정보를 조회하는 메소드.
	 * @param productId 조회할 상품의 ID (product_id)
	 * @return 상품의 모든 상세 정보가 담긴 ProductDetailBean 객체
	 */
	ProductDetailBean getProductDetail(int productId);

	/**
	 * 특정 카테고리 ID에 해당하는 상품 목록과 각 상품의 대표 이미지를 조회하는 메소드.
	 * @param categoryId 조회할 상세 카테고리의 ID (detail_category_id)
	 * @param offset 조회를 시작할 위치
	 * @param limit 조회할 상품의 개수
	 * @return 해당 카테고리의 상품 리스트 (List<ProductBean>)
	 */
	List<ProductBean> getProductsByCategory(
			int categoryId, int offset, int limit
	);
    List<ProductOptionBean> selectProductsOptionsDetail(
        	int product_index
    ) throws ProductException;
}
