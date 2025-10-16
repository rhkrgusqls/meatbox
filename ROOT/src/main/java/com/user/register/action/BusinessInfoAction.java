package com.user.register.action;

import com.Action;
import com.ActionForward;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

public class BusinessInfoAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String businessNumber = request.getParameter("businessNumber");
        String companyName = request.getParameter("companyName");
        String ceoName = request.getParameter("ceoName");
        String businessType = request.getParameter("businessType");
        String businessItem = request.getParameter("businessItem");
        String phoneNumber = request.getParameter("phoneNumber");
        // 
        String storeType = request.getParameter("storeType"); // 사업장 형태
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String neighborhood = request.getParameter("neighborhood");
        String detailAddress = request.getParameter("detailAddress");


        // 2. URL 파라미터로 만들 쿼리 스트링을 생성합니다. (한글 등 특수문자 깨짐 방지)
        StringBuilder query = new StringBuilder();
        query.append("?businessNumber=").append(URLEncoder.encode(businessNumber, "UTF-8"));
        query.append("&companyName=").append(URLEncoder.encode(companyName, "UTF-8"));
        query.append("&ceoName=").append(URLEncoder.encode(ceoName, "UTF-8"));
        query.append("&businessType=").append(URLEncoder.encode(businessType, "UTF-8"));
        query.append("&businessItem=").append(URLEncoder.encode(businessItem, "UTF-8"));
        query.append("&phoneNumber=").append(URLEncoder.encode(phoneNumber, "UTF-8"));
        query.append("&storeType=").append(URLEncoder.encode(storeType != null ? storeType : "", "UTF-8"));
        query.append("&city=").append(URLEncoder.encode(city != null ? city : "", "UTF-8"));
        query.append("&district=").append(URLEncoder.encode(district != null ? district : "", "UTF-8"));
        query.append("&neighborhood=").append(URLEncoder.encode(neighborhood != null ? neighborhood : "", "UTF-8"));
        query.append("&detailAddress=").append(URLEncoder.encode(detailAddress != null ? detailAddress : "", "UTF-8"));


        // 3. 2단계(개인 정보 입력) 페이지로 리다이렉트시킵니다.
        ActionForward forward = new ActionForward();
        forward.setRedirect(true); // 브라우저의 URL이 바뀌어야 하므로 Redirect 방식
        forward.setPath("./register/personalInfoPage.jsp" + query.toString()); 

        return forward;
    }
}

