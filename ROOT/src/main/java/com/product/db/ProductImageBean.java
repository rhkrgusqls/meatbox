package com.product.db;

/**
 * 상품 이미지 정보(product_image 테이블)를 담는 Bean 클래스.
 */
public class ProductImageBean {
    private int product_image_id;
    private int product_id;
    private String dir;

    // --- Getters and Setters ---
    
    public int getProduct_image_id() {
        return product_image_id;
    }
    public void setProduct_image_id(int product_image_id) {
        this.product_image_id = product_image_id;
    }
    public int getProduct_id() {
        return product_id;
    }
    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }
    public String getDir() {
        return dir;
    }
    public void setDir(String dir) {
        this.dir = dir;
    }
}