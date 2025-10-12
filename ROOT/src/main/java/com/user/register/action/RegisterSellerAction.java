package com.user.register.action;

import com.Action;
import com.ActionForward;
import com.user.register.db.RegisterDAO;
import com.user.register.db.RegisterException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

public class RegisterSellerAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // --- 2단계 폼 (personalInfoPage.html)에서 넘어온 모든 정보 ---
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String businessNumber = request.getParameter("businessNumber");
        String companyName = request.getParameter("companyName");
        String ceoName = request.getParameter("ceoName");
        String businessType = request.getParameter("businessType");
        String businessItem = request.getParameter("businessItem");
        String phoneNumber = request.getParameter("phoneNumber");
        String storeType = request.getParameter("storeType");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String neighborhood = request.getParameter("neighborhood");
        String detailAddress = request.getParameter("detailAddress");

        RegisterDAO dao = new RegisterDAO();
        ActionForward forward = new ActionForward();

        try {
            dao.register_selleruser(id, password, name, businessNumber, companyName,
                    ceoName, businessType, businessItem, phoneNumber,
                    storeType, city, district, neighborhood, detailAddress);

            // 성공 시 로그인 페이지로 리다이렉트
            forward.setRedirect(true);
            forward.setPath(request.getContextPath() + "/login.do");

        } catch (RegisterException e) {
            e.printStackTrace();

            // 실패 시: 1단계 페이지로 에러 메시지와 함께 리다이렉트
            String errorMessage = URLEncoder.encode(e.getMessage(), "UTF-8");
            String redirectUrl = request.getContextPath() + "/register/businessInfoPage.html?error=" + errorMessage;
            response.sendRedirect(redirectUrl);

            return null; // 컨트롤러에서 추가 이동을 막기 위해 null 반환
        }

        return forward;
    }
}

