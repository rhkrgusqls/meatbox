package com.product.bo.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.product.bo.db.ProductRegisterApproveDAO;
import com.product.seller.db.ProductRegisterRequestBean;

public class RequestListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        JSONArray arr = new JSONArray();
        System.out.print("Test3");
        try {
            // ✅ DB 조회
            ProductRegisterApproveDAO requestDAO = new ProductRegisterApproveDAO();
            List<ProductRegisterRequestBean> allRequests = requestDAO.getAllRequests();
            System.out.print("Test1");
            // ✅ 결과를 JSON 변환
            for (ProductRegisterRequestBean req : allRequests) {
                JSONObject obj = new JSONObject();
                System.out.print("Test2");
                obj.put("userIndex", req.getUserIndex());
                obj.put("productName", req.getProductName());
                obj.put("receivedDate", String.valueOf(req.getReceivedDate()));
                obj.put("expireDate", String.valueOf(req.getExpireDate()));
                obj.put("storageType", req.getStorageType());
                obj.put("saleTag", req.getSaleTag());
                obj.put("productForm", req.getProductForm());
                obj.put("deliveryFee", req.getDeliveryFee());
                obj.put("allowedMemberLv", req.getAllowedMemberLv());
                obj.put("price", req.getPrice());
                obj.put("unitPrice", req.getUnitPrice());
                obj.put("sellerNote", req.getSellerNote());
                obj.put("categoryName", req.getCategoryName());
                obj.put("detailCategoryName", req.getDetailCategoryName());
                obj.put("categoryCode", req.getCategoryCode());
                obj.put("eventId", req.getEventId());
                obj.put("cautionsText", req.getCautionsText());

                // ✅ JSON 문자열 필드는 그대로 JSON으로 변환
                try {
                    if (req.getProductOptionsJson() != null && !req.getProductOptionsJson().isEmpty())
                        obj.put("productOptionsJson", new JSONArray(req.getProductOptionsJson()));
                    else
                        obj.put("productOptionsJson", new JSONArray());
                } catch (Exception e) {
                    obj.put("productOptionsJson", new JSONArray());
                }

                try {
                    if (req.getProductImagesJson() != null && !req.getProductImagesJson().isEmpty())
                        obj.put("productImagesJson", new JSONArray(req.getProductImagesJson()));
                    else
                        obj.put("productImagesJson", new JSONArray());
                } catch (Exception e) {
                    obj.put("productImagesJson", new JSONArray());
                }

                try {
                    if (req.getProductDetailsJson() != null && !req.getProductDetailsJson().isEmpty())
                        obj.put("productDetailsJson", new JSONArray(req.getProductDetailsJson()));
                    else
                        obj.put("productDetailsJson", new JSONArray());
                } catch (Exception e) {
                    obj.put("productDetailsJson", new JSONArray());
                }

                arr.put(obj);
            }

        } catch (Exception e) {
            e.printStackTrace();
            JSONObject err = new JSONObject();
            err.put("error", e.getMessage());
            arr.put(err);
        }

        // ✅ 최종 JSON 출력
        out.print(arr.toString());
        out.flush();
    }
}


