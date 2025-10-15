package com.product.db;

/**
 * 상품 옵션 정보(product_option 테이블)를 담는 Bean 클래스.
 */
public class ProductOptionBean {
    private int option_id;
    private int product_id;
    private String option_name;
    private String option_detail;
    private int price_of_option;
    private int quantity;

    // --- Getters and Setters ---

    public int getOption_id() {
        return option_id;
    }
    public void setOption_id(int option_id) {
        this.option_id = option_id;
    }
    public int getProduct_id() {
        return product_id;
    }
    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }
    public String getOption_name() {
        return option_name;
    }
    public void setOption_name(String option_name) {
        this.option_name = option_name;
    }
    public String getOption_detail() {
        return option_detail;
    }
    public void setOption_detail(String option_detail) {
        this.option_detail = option_detail;
    }
    public int getPrice_of_option() {
        return price_of_option;
    }
    public void setPrice_of_option(int price_of_option) {
        this.price_of_option = price_of_option;
    }    
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}