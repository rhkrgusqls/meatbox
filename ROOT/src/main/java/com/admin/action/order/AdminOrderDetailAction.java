package com.admin.action.order; // 실제 Action 클래스들이 위치한 패키지로 변경해주세요.

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.admin.db.JoinedOrderData; // JoinedOrderData 경로 확인
import com.admin.db.OrderDAO;      // OrderDAO 경로 확인
import com.product.db.ProductDAO;      // ProductDAO import 추가
import com.product.db.ProductDetailBean; // ProductDetailBean import 추가
import com.product.db.ProductOptionBean; // ProductOptionBean 경로 확인
import com.user.login.db.LoginDAO;        // UserDAO 경로 확인
import com.user.db.AddressDAO;     // AddressDAO 경로 확인
import com.user.db.AddressDTO;     // AddressDTO 경로 확인

public class AdminOrderDetailAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        System.out.println("C: AdminOrderDetailAction.execute() 호출");

        // 1. 파라미터 가져오기
        int orderId = 0;
        try {
            orderId = Integer.parseInt(request.getParameter("orderId"));
        } catch (NumberFormatException e) {
             System.err.println("E: 잘못된 orderId 파라미터입니다.");
             response.sendError(HttpServletResponse.SC_BAD_REQUEST, "잘못된 주문 ID 입니다.");
             return null;
        }
        String pageNum = request.getParameter("pageNum");

        System.out.println(" C: 조회할 orderId = " + orderId + ", 목록 pageNum = " + pageNum);

        // 2. DAO 객체 생성
        OrderDAO odao = new OrderDAO();
        LoginDAO ldao = new LoginDAO();
        AddressDAO adao = new AddressDAO();
        ProductDAO pdao = new ProductDAO(); // ✅ ProductDAO 객체 생성 (상품 정보 조회용)

        // 3. 주문 상세 정보 조회
        JoinedOrderData orderDetail = odao.getOrderDetailsById(orderId);

        // 3-1. 주문 정보 없을 시 처리
        if (orderDetail == null) {
            System.err.println("E: orderId=" + orderId + "에 해당하는 주문 정보를 찾을 수 없습니다.");
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "해당 주문 정보를 찾을 수 없습니다.");
            return null;
        }

        // 4. 전체 주문 목록에서 현재 주문에 해당하는 상품 리스트 조회 (우회 로직)
        List<JoinedOrderData> allOrders = odao.getAllOrdersWithProducts();
        List<ProductDetailBean> productDetailList = new ArrayList<>();
        List<ProductOptionBean> selectedOptionList = new ArrayList<>(); // JSP 호환성을 위해 초기화

        for (JoinedOrderData order : allOrders) {
            if (order.getOrderId() == orderId) {
                productDetailList = order.getProductList();
                // Note: This workaround does not populate selectedOptionList as the original method did.
                // The primary goal is to get the product details for display.
                break;
            }
        }
        System.out.println(" C: 조회된 상품 상세 정보 개수: " + productDetailList.size());

        // 5. 구매자 이름 조회
        String userName = ldao.getUserName(orderDetail.getUserIndex());
        System.out.println(" C: 구매자 이름: " + userName);

        // 7. request 영역에 데이터 저장
        request.setAttribute("orderDetail", orderDetail);
        request.setAttribute("selectedOptionList", selectedOptionList);
        request.setAttribute("userName", userName);
 
        // ✅ 조회한 상품 상세 정보 리스트(productDetailList)를 request에 추가
        request.setAttribute("productDetailList", productDetailList);
        request.setAttribute("pageNum", pageNum);

        System.out.println(" C: 주문 상세 정보 request 저장 완료");

        // 8. 페이지 이동 설정 (절대 경로 사용하여 중첩 방지)
        ActionForward forward = new ActionForward();
        forward.setPath("/admin/adminOrderDetail.jsp"); // 최종 상세 페이지 JSP 경로
        forward.setRedirect(false);

        return forward;
    }
}