package com.admin.db;

import java.sql.Timestamp;
import java.util.List;
import com.product.db.ProductDetailBean;

public class JoinedOrderData {
    private int orderId;
    private int userIndex;
    private Integer paymentMethodId; // null 허용
    private int discountAmount;
    private int shippingFee;
    private int finalPrice;
	private int usedDeposit;
    private int usedPoints;
    private Timestamp orderDate;
    private String deliveryStatus;

    private List<ProductDetailBean> productList;

    // Getter & Setter
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public int getUserIndex() { return userIndex; }
    public void setUserIndex(int userIndex) { this.userIndex = userIndex; }

    public Integer getPaymentMethodId() { return paymentMethodId; }
    public void setPaymentMethodId(Integer paymentMethodId) { this.paymentMethodId = paymentMethodId; }

    public int getDiscountAmount() { return discountAmount; }
    public void setDiscountAmount(int discountAmount) { this.discountAmount = discountAmount; }

    public int getShippingFee() { return shippingFee; }
    public void setShippingFee(int shippingFee) { this.shippingFee = shippingFee; }
    
    public int getFinalPrice() { return finalPrice; }
	public void setFinalPrice(int finalPrice) { this.finalPrice = finalPrice; }

    public int getUsedDeposit() { return usedDeposit; }
    public void setUsedDeposit(int usedDeposit) { this.usedDeposit = usedDeposit; }

    public int getUsedPoints() { return usedPoints; }
    public void setUsedPoints(int usedPoints) { this.usedPoints = usedPoints; }

    public Timestamp getOrderDate() { return orderDate; }
    public void setOrderDate(Timestamp orderDate) { this.orderDate = orderDate; }

    public String getDeliveryStatus() { return deliveryStatus; }
    public void setDeliveryStatus(String deliveryStatus) { this.deliveryStatus = deliveryStatus; }

    public List<ProductDetailBean> getProductList() { return productList; }
    public void setProductList(List<ProductDetailBean> productList) { this.productList = productList; }
}
