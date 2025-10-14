package com.product.db;

// Category data transfer object
public class CategoryBean {
    private int categoryId;       // category_id
    private String categoryName;  // category_name
    private int level;            // category level

    // Getters & Setters
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

    @Override
    public String toString() {
        return "CategoryBean{" +
                "categoryId=" + categoryId +
                ", categoryName='" + categoryName + '\'' +
                ", level=" + level +
                '}';
    }
}
