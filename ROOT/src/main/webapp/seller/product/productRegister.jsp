<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.product.seller.db.*" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<%@ page import="java.io.*, java.util.*" %>

<%
    request.setCharacterEncoding("UTF-8");
    int userIndex = (int) session.getAttribute("userIndex"); // 세션에서 유저 인덱스 가져옴

    String uploadPath = application.getRealPath("/uploads/" + userIndex);
    File uploadDir = new File(uploadPath);
    if (!uploadDir.exists()) uploadDir.mkdirs();

    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (isMultipart) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("UTF-8");

        try {
            List<FileItem> formItems = upload.parseRequest(request);
            ProductRegisterRequestBean reqBean = new ProductRegisterRequestBean();
            reqBean.setUserIndex(userIndex);

            List<String> imageList = new ArrayList<>();
            List<String> detailList = new ArrayList<>();
            List<Map<String, Object>> options = new ArrayList<>();

            for (FileItem item : formItems) {
                if (item.isFormField()) {
                    String fieldName = item.getFieldName();
                    String value = item.getString("UTF-8");

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
                        options.get(idx).put("priceOfOption", Integer.parseInt(value));
                    } else if (fieldName.startsWith("option_qty_")) {
                        int idx = Integer.parseInt(fieldName.split("_")[2]);
                        while (options.size() <= idx) options.add(new HashMap<>());
                        options.get(idx).put("quantity", Integer.parseInt(value));
                    } else {
                        // 기존 폼 필드
                        switch (fieldName) {
                            case "productName": reqBean.setProductName(value); break;
                            case "storageType": reqBean.setStorageType(value); break;
                            case "saleTag": reqBean.setSaleTag(value); break;
                            case "productForm": reqBean.setProductForm(value); break;
                            case "deliveryFee": reqBean.setDeliveryFee(Integer.parseInt(value)); break;
                            case "allowedMemberLv": reqBean.setAllowedMemberLv(Integer.parseInt(value)); break;
                            case "price": reqBean.setPrice(Integer.parseInt(value)); break;
                            case "unitPrice": reqBean.setUnitPrice(Integer.parseInt(value)); break;
                            case "sellerNote": reqBean.setSellerNote(value); break;
                            case "categoryName": reqBean.setCategoryName(value); break;
                            case "detailCategoryName": reqBean.setDetailCategoryName(value); break;
                            case "cautionsText": reqBean.setCautionsText(value); break;
                        }
                    }
                } else {
                    String fileName = new File(item.getName()).getName();
                    String filePath = uploadPath + File.separator + fileName;
                    File storeFile = new File(filePath);
                    item.write(storeFile);

                    String dbPath = "/uploads/" + userIndex + "/" + fileName;
                    if (fileName.endsWith(".jpg") || fileName.endsWith(".png"))
                        imageList.add("{\"dir\":\"" + dbPath + "\"}");
                    else
                        detailList.add("{\"dir\":\"" + dbPath + "\"}");
                }
            }

            reqBean.setProductImagesJson("[" + String.join(",", imageList) + "]");
            reqBean.setProductDetailsJson("[" + String.join(",", detailList) + "]");
            reqBean.setReceivedDate(new Timestamp(System.currentTimeMillis()));
            reqBean.setExpireDate(new Timestamp(System.currentTimeMillis() + 7L*24*60*60*1000));

            // 옵션 JSON 변환
            StringBuilder optionJson = new StringBuilder();
            optionJson.append("[");
            for (int i = 0; i < options.size(); i++) {
                Map<String, Object> opt = options.get(i);
                if (opt.isEmpty()) continue;
                if (i > 0) optionJson.append(",");
                optionJson.append("{\"option_name\":\"").append(opt.get("option_name"))
                          .append("\",\"option_detail\":\"").append(opt.get("option_detail"))
                          .append("\",\"priceOfOption\":").append(opt.get("priceOfOption"))
                          .append(",\"quantity\":").append(opt.get("quantity")).append("}");
            }
            optionJson.append("]");
            reqBean.setProductOptionsJson(optionJson.toString());

            ProductRegisterRequestDAO dao = new ProductRegisterRequestDAO();
            dao.insertRequest(reqBean);

            out.println("<script>alert('✅ 상품 요청이 성공적으로 등록되었습니다!'); location.href='seller_dashboard.jsp';</script>");

        } catch (Exception ex) {
            ex.printStackTrace();
            out.println("<script>alert('⚠️ 상품 요청 중 오류 발생!'); history.back();</script>");
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 요청</title>
<style>
    body { font-family: 'Segoe UI', sans-serif; background-color:#fff5f5; color:#4d0000; }
    h2 { background:#b30000; color:#fff; text-align:center; padding:15px 0; margin:0 0 20px 0; border-radius:6px;}
    form { max-width:700px; margin:0 auto; padding:30px; background:#ffe6e6; border-radius:10px; box-shadow:0 4px 10px rgba(0,0,0,0.15);}
    label { display:block; margin-top:15px; font-weight:bold;}
    input, textarea, select { width:100%; padding:8px 10px; margin-top:5px; border:1px solid #cc0000; border-radius:5px; box-sizing:border-box;}
    input[type="submit"] { margin-top:20px; background:#b30000; color:#fff; padding:12px 20px; border:none; border-radius:8px; cursor:pointer; font-size:16px; transition:0.3s;}
    input[type="submit"]:hover { background:#800000;}
    .option-row { display:flex; gap:10px; margin-top:10px;}
    .option-row input { flex:1; }
    .add-option { margin-top:10px; background:#ff6666; color:#fff; border:none; padding:5px 10px; cursor:pointer; border-radius:5px;}
    .add-option:hover { background:#cc0000; }
</style>
<script>
let optionCount = 0;
function addOptionRow() {
    const container = document.getElementById('option-container');
    const row = document.createElement('div');
    row.className = 'option-row';
    row.innerHTML = `
        <input type="text" name="option_name_${optionCount}" placeholder="옵션명" required>
        <input type="text" name="option_detail_${optionCount}" placeholder="옵션 상세" required>
        <input type="number" name="option_price_${optionCount}" placeholder="가격" min="0" required>
        <input type="number" name="option_qty_${optionCount}" placeholder="수량" min="0" required>
        <button type="button" onclick="this.parentElement.remove()">삭제</button>
    `;
    container.appendChild(row);
    optionCount++;
}
</script>
</head>
<body>
<h2>상품 등록 요청</h2>
<form action="sellerProductRegister.do" method="post" enctype="multipart/form-data">
    <label>상품명:</label> <input type="text" name="productName" required>
    <label>저장방식:</label> 
    <select name="storageType">
        <option value="REFRIGERATED">냉장</option>
        <option value="FROZEN">냉동</option>
    </select>
    <label>판매태그:</label> <input type="text" name="saleTag">
    <label>형태:</label>
    <select name="productForm">
        <option value="CHOPPED">다진</option>
        <option value="WHOLE">전체</option>
        <option value="INDIVIDUAL">개별포장</option>
        <option value="PROCESSED_MEAT">가공육</option>
    </select>
    <label>배송비:</label> <input type="number" name="deliveryFee" min="0">
    <label>허용 등급:</label> <input type="number" name="allowedMemberLv" min="1">
    <label>규격당 가격:</label> <input type="number" name="price" min="0">
    <label>규격:</label> <input type="number" name="unitPrice" min="0">
    <label>판매자 메모:</label> <input type="text" name="sellerNote">
    <label>카테고리:</label> <input type="text" name="categoryName">
    <label>세부 항목:</label> <input type="text" name="detailCategoryName">
    <label>주의사항:</label> <input type="text" name="cautionsText">

    <label>옵션:</label>
    <div id="option-container"></div>
    <button type="button" class="add-option" onclick="addOptionRow()">옵션 추가</button>

    <label>이미지 업로드:</label> <input type="file" name="file" multiple accept=".jpg,.png,.jpeg"><br><br>
    <input type="submit" value="요청 등록">
</form>
</body>
</html>
