package com.product.db;

import java.sql.*;

/**
   	@int product_id; 상품 고유아이디
	@int user_index; 상품등록자 seller_user(상업자용 유저)아이디
	@int quantity; 남은 재고수량
	@Timestamp received_date; 입고일
	@Timestamp expire_date; 유통기한
	@StorageType storage_type; 냉장 냉동상품 타입
	@String sale_tag; 
	@ProductForm product_form;
	@int delivery_fee;
	@int allowed_member_lv;
	@int price;
	@int unit_price;
	@String seller_note;
	@int review_preview_1_id;
	@int review_preview_2_id;
	@int review_preview_3_id; 
 */
public class ProductBean {
	int product_id;
	int user_index; 
	int quantity;
	Timestamp received_date;
	Timestamp expire_date;
	StorageType storage_type;
	String sale_tag;
	ProductForm product_form;
	int delivery_fee;
	int allowed_member_lv;
	int price;
	int unit_price;
	String seller_note;
	int review_preview_1_id;
	int review_preview_2_id;
	int review_preview_3_id;
	
	public int get_product_id() {
        return product_id;
    }

    public void set_product_id(int product_id) {
        this.product_id = product_id;
    }

    public int get_user_index() {
        return user_index;
    }

    public void set_user_index(int user_index) {
        this.user_index = user_index;
    }

    public int get_quantity() {
        return quantity;
    }

    public void set_quantity(int quantity) {
        this.quantity = quantity;
    }

    public Timestamp get_received_date() {
        return received_date;
    }

    public void set_received_date(Timestamp received_date) {
        this.received_date = received_date;
    }

    public Timestamp get_expire_date() {
        return expire_date;
    }

    public void set_expire_date(Timestamp expire_date) {
        this.expire_date = expire_date;
    }

    public StorageType get_storage_type() {
        return storage_type;
    }

    public void set_storage_type(StorageType storage_type) {
        this.storage_type = storage_type;
    }

    public String get_sale_tag() {
        return sale_tag;
    }

    public void set_sale_tag(String sale_tag) {
        this.sale_tag = sale_tag;
    }

    public ProductForm get_product_form() {
        return product_form;
    }

    public void set_product_form(ProductForm product_form) {
        this.product_form = product_form;
    }

    public int get_delivery_fee() {
        return delivery_fee;
    }

    public void set_delivery_fee(int delivery_fee) {
        this.delivery_fee = delivery_fee;
    }

    public int get_allowed_member_lv() {
        return allowed_member_lv;
    }

    public void set_allowed_member_lv(int allowed_member_lv) {
        this.allowed_member_lv = allowed_member_lv;
    }

    public int get_price() {
        return price;
    }

    public void set_price(int price) {
        this.price = price;
    }

    public int get_unit_price() {
        return unit_price;
    }

    public void set_unit_price(int unit_price) {
        this.unit_price = unit_price;
    }

    public String get_seller_note() {
        return seller_note;
    }

    public void set_seller_note(String seller_note) {
        this.seller_note = seller_note;
    }

    public int get_review_preview_1_id() {
        return review_preview_1_id;
    }

    public void set_review_preview_1_id(int review_preview_1_id) {
        this.review_preview_1_id = review_preview_1_id;
    }

    public int get_review_preview_2_id() {
        return review_preview_2_id;
    }

    public void set_review_preview_2_id(int review_preview_2_id) {
        this.review_preview_2_id = review_preview_2_id;
    }

    public int get_review_preview_3_id() {
        return review_preview_3_id;
    }

    public void set_review_preview_3_id(int review_preview_3_id) {
        this.review_preview_3_id = review_preview_3_id;
    }
}
