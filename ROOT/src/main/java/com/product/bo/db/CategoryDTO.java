package com.product.bo.db;

/**
 * 카테고리 메뉴 표시에 필요한 데이터를 전달하는 DTO 클래스.
 * isLeaf 필드를 통해 마지막 카테고리 여부를 판별합니다.
 */
public class CategoryDTO {
    private int categoryId;
    private String categoryName;
    private int level;
    private boolean isLeaf; // true이면 마지막 카테고리

    // Getters and Setters
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public boolean isLeaf() {
        return isLeaf;
    }

    public void setLeaf(boolean leaf) {
        isLeaf = leaf;
    }
}