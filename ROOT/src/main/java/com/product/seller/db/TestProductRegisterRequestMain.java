package com.product.seller.db;

import java.sql.Timestamp;

public class TestProductRegisterRequestMain {

    public static void main(String[] args) {

        try {
            ProductRegisterRequestDAO requestDAO = new ProductRegisterRequestDAO();

            // 상품 요청 데이터 생성
            ProductRegisterRequestBean request = new ProductRegisterRequestBean();
            request.setUserIndex(1); // 샘플 판매자
            request.setProductName("테스트 소고기 요청");
            request.setReceivedDate(new Timestamp(System.currentTimeMillis()));
            request.setExpireDate(new Timestamp(System.currentTimeMillis() + 7L*24*60*60*1000)); // 7일 후
            request.setStorageType("REFRIGERATED");
            request.setSaleTag("신상품");
            request.setProductForm("CHOPPED");
            request.setDeliveryFee(3000);
            request.setAllowedMemberLv(1);
            request.setPrice(15000);
            request.setUnitPrice(15000);
            request.setSellerNote("신선한 상품입니다.");
            request.setCategoryName("소고기");
            request.setDetailCategoryName("한우");
            request.setCautionsText("개봉 후 냉장 보관");
            request.setProductOptionsJson("[{\"option_name\":\"사이즈\",\"option_detail\":\"L\",\"priceOfOption\":0,\"quantity\":10}]");
            request.setProductImagesJson("[{\"dir\":\"/images/product1.jpg\"}]");
            request.setProductDetailsJson("[{\"dir\":\"/details/product1.pdf\"}]");


            // 요청 생성
            requestDAO.insertRequest(request);
            System.out.println("✅ 상품 등록 요청 생성 완료, request_id=");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("⚠️ 상품 등록 요청 생성 중 오류 발생!");
        }
    }
}
