package com.product.db;

public class ProductBean {
    private int productId;
    private String productName;
    private String brandNumber;
    private String brandName;
    private String storageType;
    private String saleTag;
    private String productForm;
    private int allowedMemberLv;
    private int quantity;
    private String expireDate;
    private int deliveryFee;
    private int price;
    private int unitPrice;
    private String sellerNote;
    private String categoryName;
    private String detailCategoryName;
    private String productImage;
    private String productDetail;
    private String cautionsText;

    // --- Getter / Setter ---
    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public String getBrandNumber() { return brandNumber; }
    public void setBrandNumber(String brandNumber) { this.brandNumber = brandNumber; }

    public String getBrandName() { return brandName; }
    public void setBrandName(String brandName) { this.brandName = brandName; }

    public String get_product_name() { return product_name; }

    public void set_product_name(String product_name) { this.product_name = product_name; }
    
    public String getStorageType() { return storageType; }
    public void setStorageType(String storageType) { this.storageType = storageType; }

    public String getSaleTag() { return saleTag; }
    public void setSaleTag(String saleTag) { this.saleTag = saleTag; }

    public String getProductForm() { return productForm; }
    public void setProductForm(String productForm) { this.productForm = productForm; }

    public int getAllowedMemberLv() { return allowedMemberLv; }
    public void setAllowedMemberLv(int allowedMemberLv) { this.allowedMemberLv = allowedMemberLv; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public String getExpireDate() { return expireDate; }
    public void setExpireDate(String expireDate) { this.expireDate = expireDate; }

    public int getDeliveryFee() { return deliveryFee; }
    public void setDeliveryFee(int deliveryFee) { this.deliveryFee = deliveryFee; }

    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }

    public int getUnitPrice() { return unitPrice; }
    public void setUnitPrice(int unitPrice) { this.unitPrice = unitPrice; }

    public String getSellerNote() { return sellerNote; }
    public void setSellerNote(String sellerNote) { this.sellerNote = sellerNote; }

    public String getCategoryName() { return categoryName; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }

    public String getDetailCategoryName() { return detailCategoryName; }
    public void setDetailCategoryName(String detailCategoryName) { this.detailCategoryName = detailCategoryName; }

    public String getProductImage() { return productImage; }
    public void setProductImage(String productImage) { this.productImage = productImage; }

    public String getProductDetail() { return productDetail; }
    public void setProductDetail(String productDetail) { this.productDetail = productDetail; }

    public String getCautionsText() { return cautionsText; }
    public void setCautionsText(String cautionsText) { this.cautionsText = cautionsText; }
    
	public String getProductName() { return productName; }
	public void setProductName(String productName) { this.productName = productName; }
}
