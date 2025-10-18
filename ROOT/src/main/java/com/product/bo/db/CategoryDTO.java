// com/product/bo/db/CategoryDTO.java (최종 수정본)

package com.product.bo.db;

import java.util.ArrayList;
import java.util.List;

public class CategoryDTO {

    // --- 모든 곳에서 공통으로 사용될 필드 ---
    private int categoryId;
    private String categoryName;
    
    // --- 상단 네비게이션 메뉴에서 사용 ---
    private int level;
    private boolean isLeaf;

    // --- 관리자 페이지 및 데이터 구조화에 사용 ---
    private Integer parentCategoryId; 
    private String parentCategoryName; // 이전 목록 방식에서 사용
    private List<CategoryDTO> children = new ArrayList<>(); // 새 목록 방식에서 사용

    // --- 모든 필드에 대한 Getter & Setter ---

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

    public void setLeaf(boolean isLeaf) {
        this.isLeaf = isLeaf;
    }

    public Integer getParentCategoryId() {
        return parentCategoryId;
    }

    public void setParentCategoryId(Integer parentCategoryId) {
        this.parentCategoryId = parentCategoryId;
    }

    public String getParentCategoryName() {
        return parentCategoryName;
    }

    public void setParentCategoryName(String parentCategoryName) {
        this.parentCategoryName = parentCategoryName;
    }

    public List<CategoryDTO> getChildren() {
        return children;
    }

    public void setChildren(List<CategoryDTO> children) {
        this.children = children;
    }
}