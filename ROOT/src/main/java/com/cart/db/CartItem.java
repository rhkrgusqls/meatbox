package com.cart.db;

public class CartItem {
    private int userIndex;
    private int productId;
    private int optionId;
    private int quantity;

    public CartItem(int userIndex, int productId, int optionId, int quantity) {
        this.userIndex = userIndex;
        this.productId = productId;
        this.optionId = optionId;
        this.quantity = quantity;
    }

    // getters & setters
    public int getUserIndex() { return userIndex; }
    public int getProductId() { return productId; }
    public int getOptionId() { return optionId; }
    public int getQuantity() { return quantity; }

    public void setQuantity(int quantity) { this.quantity = quantity; }
}
