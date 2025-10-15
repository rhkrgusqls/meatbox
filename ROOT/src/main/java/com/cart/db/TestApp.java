package com.cart.db;

import java.util.List;
import java.util.Map;

import com.product.db.ProductDAO;
import com.product.db.ProductDetailBean;
import com.product.db.ProductOptionBean;

public class TestApp {
    public static void main(String[] args) throws Exception {
        ProductDAO productDAO = new ProductDAO();
        ProductDetailBean pd = productDAO.getProductDetail(18); // 테스트 product_id

        if(pd != null){
            System.out.println("상품명: " + pd.getName());
            System.out.println("종합 수량: " + pd.getQuantity());
            System.out.println("옵션 리스트:");
            for(ProductOptionBean opt : pd.getOptionList()){
                System.out.println(" - " + opt.getOption_name() + " : " + opt.getQuantity() + "개");
            }
        } else {
            System.out.println("상품 정보 없음");
        }

        // 장바구니 테스트
        CartDAO cartDAO = new CartDAO();
        cartDAO.addCart(4, 18, 15, 2);
        List<CartItem> cartList = cartDAO.getCartList(4);
        System.out.println("장바구니:");
        for(CartItem row : cartList){
            System.out.println(row.getProductId());
            System.out.println(row.getOptionId());
        }
        cartDAO.deleteAllCart(4);
    }
}