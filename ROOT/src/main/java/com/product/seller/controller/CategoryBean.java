package com.product.seller.controller;

public class CategoryBean {
    private int categoryId;
    private String categoryName;

    public CategoryBean(int categoryId, String categoryName) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
    }

    public int getCategoryId() { return categoryId; }
    public String getCategoryName() { return categoryName; }
}
