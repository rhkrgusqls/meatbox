package com.product.db;

import java.util.List;

/**
 * 상품 상세 페이지에 필요한 모든 데이터를 담는 종합 Bean 클래스.
 * 상품 기본 정보, 이미지 리스트, 옵션 리스트, 상세설명 경로를 포함합니다.
 */
public class ProductDetailBean {

    // 1. 상품 기본 정보 (product table)
    private int product_id;
    private String name;
    private int price;
    private int quantity;
    private String seller_note;
    private int delivery_fee;
    // ... product 테이블의 다른 필요한 컬럼들을 여기에 추가할 수 있습니다.

    // 2. 상품 이미지 리스트 (product_image table)
    private List<ProductImageBean> imageList;

    // 3. 상품 옵션 리스트 (product_option table)
    private List<ProductOptionBean> optionList;
    
    // 4. 상품 상세설명 (product_detail table)
    private String detailDir; // 상세설명 이미지/파일 경로

    // --- Getters and Setters ---

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public String getSeller_note() {
        return seller_note;
    }

    public void setSeller_note(String seller_note) {
        this.seller_note = seller_note;
    }

    public int getDelivery_fee() {
        return delivery_fee;
    }

    public void setDelivery_fee(int delivery_fee) {
        this.delivery_fee = delivery_fee;
    }

    public List<ProductImageBean> getImageList() {
        return imageList;
    }

    public void setImageList(List<ProductImageBean> imageList) {
        this.imageList = imageList;
    }

    public List<ProductOptionBean> getOptionList() {
        return optionList;
    }

    public void setOptionList(List<ProductOptionBean> optionList) {
        this.optionList = optionList;
    }
    
    public String getDetailDir() {
        return detailDir;
    }

    public void setDetailDir(String detailDir) {
        this.detailDir = detailDir;
    }
}