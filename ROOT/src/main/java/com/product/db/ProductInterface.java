package com.product.db;

import java.util.List;

public interface ProductInterface {
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
}
