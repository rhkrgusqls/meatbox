package com.product.seller.db;

import java.util.List;

import com.product.bo.db.ProductRegisterApproveDAO;
public class TestProductRequestListMain {

    public static void main(String[] args) {
        ProductRegisterApproveDAO requestDAO = new ProductRegisterApproveDAO();

        try {
            // 전체 요청 조회 (status = null)
            List<ProductRegisterRequestBean> allRequests = requestDAO.getAllRequests();

            System.out.println("==== 전체 요청 목록 ====");
            for (ProductRegisterRequestBean req : allRequests) {
                System.out.println("UserIndex: " + req.getUserIndex());
                System.out.println("ProductName: " + req.getProductName());
                System.out.println("ReceivedDate: " + req.getReceivedDate());
                System.out.println("ExpireDate: " + req.getExpireDate());
                System.out.println("StorageType: " + req.getStorageType());
                System.out.println("SaleTag: " + req.getSaleTag());
                System.out.println("ProductForm: " + req.getProductForm());
                System.out.println("DeliveryFee: " + req.getDeliveryFee());
                System.out.println("AllowedMemberLv: " + req.getAllowedMemberLv());
                System.out.println("Price: " + req.getPrice());
                System.out.println("UnitPrice: " + req.getUnitPrice());
                System.out.println("SellerNote: " + req.getSellerNote());
                System.out.println("ReviewPreviews: [" 
                    + req.getReviewPreview1Id() + ", "
                    + req.getReviewPreview2Id() + ", "
                    + req.getReviewPreview3Id() + "]");
                System.out.println("Category: " + req.getCategoryName() 
                    + " / Detail: " + req.getDetailCategoryName() 
                    + " / Code: " + req.getCategoryCode());
                System.out.println("EventId: " + req.getEventId());
                System.out.println("Cautions: " + req.getCautionsText());
                System.out.println("OptionsJson: " + req.getProductOptionsJson());
                System.out.println("ImagesJson: " + req.getProductImagesJson());
                System.out.println("DetailsJson: " + req.getProductDetailsJson());
                System.out.println("----------------------------------------");
            }

            System.out.println("총 요청 수: " + allRequests.size());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
