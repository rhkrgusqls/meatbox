package com.product.seller.db;

import java.sql.Timestamp;

public class ProductRegisterRequestBean {

    private int userIndex;
    private String productName;
    private Timestamp receivedDate;
    private Timestamp expireDate;
    private String storageType;
    private String saleTag;
    private String productForm;
    private int deliveryFee;
    private int allowedMemberLv;
    private int price;
    private String unitPrice;
    private String sellerNote;
    private Integer reviewPreview1Id;
    private Integer reviewPreview2Id;
    private Integer reviewPreview3Id;
    private String categoryName;
    private String detailCategoryName;
    private String categoryCode;
    private Integer eventId;
    private String cautionsText;
    private String productOptionsJson;
    private String productImagesJson;
    private String productDetailsJson;
    private int requestId;

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }
    // ====== getters & setters ======
    public int getUserIndex() { return userIndex; }
    public void setUserIndex(int userIndex) { this.userIndex = userIndex; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public Timestamp getReceivedDate() { return receivedDate; }
    public void setReceivedDate(Timestamp receivedDate) { this.receivedDate = receivedDate; }

    public Timestamp getExpireDate() { return expireDate; }
    public void setExpireDate(Timestamp expireDate) { this.expireDate = expireDate; }

    public String getStorageType() { return storageType; }
    public void setStorageType(String storageType) { this.storageType = storageType; }

    public String getSaleTag() { return saleTag; }
    public void setSaleTag(String saleTag) { this.saleTag = saleTag; }

    public String getProductForm() { return productForm; }
    public void setProductForm(String productForm) { this.productForm = productForm; }

    public int getDeliveryFee() { return deliveryFee; }
    public void setDeliveryFee(int deliveryFee) { this.deliveryFee = deliveryFee; }

    public int getAllowedMemberLv() { return allowedMemberLv; }
    public void setAllowedMemberLv(int allowedMemberLv) { this.allowedMemberLv = allowedMemberLv; }

    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }

    public String getUnitPrice() { return unitPrice; }
    public void setUnitPrice(String unitPrice) { this.unitPrice = unitPrice; }

    public String getSellerNote() { return sellerNote; }
    public void setSellerNote(String sellerNote) { this.sellerNote = sellerNote; }

    public Integer getReviewPreview1Id() { return reviewPreview1Id; }
    public void setReviewPreview1Id(Integer reviewPreview1Id) { this.reviewPreview1Id = reviewPreview1Id; }

    public Integer getReviewPreview2Id() { return reviewPreview2Id; }
    public void setReviewPreview2Id(Integer reviewPreview2Id) { this.reviewPreview2Id = reviewPreview2Id; }

    public Integer getReviewPreview3Id() { return reviewPreview3Id; }
    public void setReviewPreview3Id(Integer reviewPreview3Id) { this.reviewPreview3Id = reviewPreview3Id; }

    public String getCategoryName() { return categoryName; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }

    public String getDetailCategoryName() { return detailCategoryName; }
    public void setDetailCategoryName(String detailCategoryName) { this.detailCategoryName = detailCategoryName; }

    public String getCategoryCode() { return categoryCode; }
    public void setCategoryCode(String categoryCode) { this.categoryCode = categoryCode; }

    public Integer getEventId() { return eventId; }
    public void setEventId(Integer eventId) { this.eventId = eventId; }

    public String getCautionsText() { return cautionsText; }
    public void setCautionsText(String cautionsText) { this.cautionsText = cautionsText; }

    public String getProductOptionsJson() { return productOptionsJson; }
    public void setProductOptionsJson(String productOptionsJson) { this.productOptionsJson = productOptionsJson; }

    public String getProductImagesJson() { return productImagesJson; }
    public void setProductImagesJson(String productImagesJson) { this.productImagesJson = productImagesJson; }

    public String getProductDetailsJson() { return productDetailsJson; }
    public void setProductDetailsJson(String productDetailsJson) { this.productDetailsJson = productDetailsJson; }
}
