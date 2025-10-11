package com.product.bo.db;

public class CategoryBean {
    private String childCode;
    private String parentCode;

    public CategoryBean() {}

    public CategoryBean(String childCode, String parentCode) {
        this.childCode = childCode;
        this.parentCode = parentCode;
    }

    public String getChildCode() { return childCode; }
    public void setChildCode(String childCode) { this.childCode = childCode; }

    public String getParentCode() { return parentCode; }
    public void setParentCode(String parentCode) { this.parentCode = parentCode; }
}
