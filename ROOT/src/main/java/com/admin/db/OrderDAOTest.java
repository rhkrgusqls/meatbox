package com.admin.db;

import java.util.List;
import com.product.db.ProductDetailBean;

public class OrderDAOTest {
    public static void main(String[] args) {
        OrderDAO orderDAO = new OrderDAO();

        // 모든 주문 + 상품 조회
        List<JoinedOrderData> orders = orderDAO.getAllOrdersWithProducts();

        // 결과 출력
        for (JoinedOrderData order : orders) {
            System.out.println("===== Order ID: " + order.getOrderId() + " =====");
            System.out.println("User Index: " + order.getUserIndex());
            System.out.println("Payment Method ID: " + order.getPaymentMethodId());
            System.out.println("Discount Amount: " + order.getDiscountAmount());
            System.out.println("Shipping Fee: " + order.getShippingFee());
            System.out.println("Used Deposit: " + order.getUsedDeposit());
            System.out.println("Used Points: " + order.getUsedPoints());
            System.out.println("Order Date: " + order.getOrderDate());
            System.out.println("Delivery Status: " + order.getDeliveryStatus());

            List<ProductDetailBean> products = order.getProductList();
            System.out.println("---- Products ----");
            for (ProductDetailBean product : products) {
                System.out.println("Product ID: " + product.getProduct_id());
                System.out.println("Name: " + product.getName());
                System.out.println("Price: " + product.getPrice());
                System.out.println("Seller Note: " + product.getSeller_note());
                System.out.println("Delivery Fee: " + product.getDelivery_fee());
                System.out.println("Quantity: " + product.getQuantity());

                // 옵션 출력
                if (product.getOptionList() != null) {
                    System.out.println("Options:");
                    product.getOptionList().forEach(option -> {
                        System.out.println("  Option Name: " + option.getOption_name());
                        System.out.println("  Option Detail: " + option.getOption_detail());
                        System.out.println("  Price of Option: " + option.getPrice_of_option());
                        System.out.println("  Quantity: " + option.getQuantity());
                    });
                }

                // 이미지 출력
                if (product.getImageList() != null) {
                    System.out.println("Images:");
                    product.getImageList().forEach(img -> {
                        System.out.println("  Image ID: " + img.getProduct_image_id());
                        System.out.println("  Dir: " + img.getDir());
                    });
                }

                // 상세설명
                System.out.println("Detail Dir: " + product.getDetailDir());
                System.out.println("-----------------");
            }
            System.out.println("==============================\n");
        }
    }
}
