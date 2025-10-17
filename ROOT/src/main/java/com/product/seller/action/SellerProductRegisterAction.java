package com.product.seller.action;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.Action;
import com.ActionForward;
import com.product.seller.db.ProductRegisterRequestBean;
import com.product.seller.db.ProductRegisterRequestDAO;

public class SellerProductRegisterAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.setCharacterEncoding("UTF-8");
        int userIndex = (int) request.getSession().getAttribute("userIndex");

        ProductRegisterRequestBean reqBean = new ProductRegisterRequestBean();
        reqBean.setUserIndex(userIndex);

        // 업로드 경로 설정
        String uploadPath = request.getServletContext().getRealPath("/uploads/" + userIndex);
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        // multipart 체크
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (!isMultipart) throw new Exception("Form must be multipart/form-data.");

        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("UTF-8");

        List<String> imageList = new ArrayList<>();
        List<String> detailList = new ArrayList<>();
        List<Map<String, Object>> options = new ArrayList<>();

        List<FileItem> formItems = upload.parseRequest(request);
        for (FileItem item : formItems) {
            if (item.isFormField()) {
                String fieldName = item.getFieldName();
                String value = item.getString("UTF-8");

                // 옵션 처리
                if (fieldName.startsWith("option_name_")) {
                    int idx = Integer.parseInt(fieldName.split("_")[2]);
                    while (options.size() <= idx) options.add(new HashMap<>());
                    options.get(idx).put("option_name", value);
                } else if (fieldName.startsWith("option_detail_")) {
                    int idx = Integer.parseInt(fieldName.split("_")[2]);
                    while (options.size() <= idx) options.add(new HashMap<>());
                    options.get(idx).put("option_detail", value);
                } else if (fieldName.startsWith("option_price_")) {
                    int idx = Integer.parseInt(fieldName.split("_")[2]);
                    while (options.size() <= idx) options.add(new HashMap<>());
                    options.get(idx).put("priceOfOption", parseIntSafe(value));
                } else if (fieldName.startsWith("option_qty_")) {
                    int idx = Integer.parseInt(fieldName.split("_")[2]);
                    while (options.size() <= idx) options.add(new HashMap<>());
                    options.get(idx).put("quantity", parseIntSafe(value));
                } else {
                    // 일반 필드
                    switch (fieldName) {
                        case "productName": reqBean.setProductName(value); break;
                        case "storageType": reqBean.setStorageType(value); break;
                        case "saleTag": reqBean.setSaleTag(value); break;
                        case "productForm": reqBean.setProductForm(value); break;
                        case "deliveryFee": reqBean.setDeliveryFee(parseIntSafe(value)); break;
                        case "allowedMemberLv": reqBean.setAllowedMemberLv(parseIntSafe(value)); break;
                        case "price": reqBean.setPrice(parseIntSafe(value)); break;
                        case "unitPrice": reqBean.setUnitPrice(parseIntSafe(value)); break;
                        case "sellerNote": reqBean.setSellerNote(value); break;
                        case "categoryName": reqBean.setCategoryName(value); break;
                        case "detailCategoryName": reqBean.setDetailCategoryName(value); break;
                        case "cautionsText": reqBean.setCautionsText(value); break;
                    }
                }

            } else {
                // 파일 처리
                String fileName = new File(item.getName()).getName();
                if (fileName == null || fileName.isEmpty()) continue;
                String filePath = uploadPath + File.separator + fileName;
                File storeFile = new File(filePath);
                item.write(storeFile);

                String dbPath = "/uploads/" + userIndex + "/" + fileName;
                if (fileName.toLowerCase().matches(".*\\.(jpg|png|jpeg)$")) {
                    imageList.add("{\"dir\":\"" + dbPath + "\"}");
                } else {
                    detailList.add("{\"dir\":\"" + dbPath + "\"}");
                }
            }
        }

        // JSON 변환
        reqBean.setProductImagesJson("[" + String.join(",", imageList) + "]");
        reqBean.setProductDetailsJson("[" + String.join(",", detailList) + "]");

        StringBuilder optionJson = new StringBuilder("[");
        for (int i = 0; i < options.size(); i++) {
            Map<String, Object> opt = options.get(i);
            if (opt.isEmpty()) continue;
            if (optionJson.length() > 1) optionJson.append(",");
            optionJson.append("{\"option_name\":\"").append(opt.get("option_name"))
                      .append("\",\"option_detail\":\"").append(opt.get("option_detail"))
                      .append("\",\"priceOfOption\":").append(opt.get("priceOfOption"))
                      .append(",\"quantity\":").append(opt.get("quantity")).append("}");
        }
        optionJson.append("]");
        reqBean.setProductOptionsJson(optionJson.toString());

        // 날짜 설정
        reqBean.setReceivedDate(new Timestamp(System.currentTimeMillis()));
        reqBean.setExpireDate(new Timestamp(System.currentTimeMillis() + 7L*24*60*60*1000));

        // DB 저장
        ProductRegisterRequestDAO dao = new ProductRegisterRequestDAO();
        dao.insertRequest(reqBean);

        // 이동
        ActionForward forward = new ActionForward();
        forward.setPath("seller_dashboard.jsp?success=1");
        forward.setRedirect(true);
        return forward;
    }

    // 안전한 Integer 변환
    private int parseIntSafe(String s) {
        try {
            return Integer.parseInt(s);
        } catch (Exception e) {
            return 0;
        }
    }
}
