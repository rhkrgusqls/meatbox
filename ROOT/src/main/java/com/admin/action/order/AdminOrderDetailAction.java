package com.admin.action.order; // 실제 Action 클래스들이 위치한 패키지로 변경해주세요.

import java.util.ArrayList;
// ArrayList import는 이제 필요 없습니다.
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.admin.db.JoinedOrderData; // JoinedOrderData 경로 확인
import com.admin.db.OrderDAO;      // OrderDAO 경로 확인
import com.product.db.ProductDAO;
import com.product.db.ProductDetailBean;
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

        // 3. 주문 상세 정보 조회
        JoinedOrderData orderDetail = odao.getOrderDetailsById(orderId);

        // 3-1. 주문 정보 없을 시 처리
        if (orderDetail == null) {
            System.err.println("E: orderId=" + orderId + "에 해당하는 주문 정보를 찾을 수 없습니다.");
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "해당 주문 정보를 찾을 수 없습니다.");
            return null;
        }

     // 4. 선택된 옵션 목록 조회
        List<ProductOptionBean> selectedOptionList = odao.getSelectedOptionsForOrder(orderId);
        System.out.println(" C: 조회된 상품(옵션) 개수: " + (selectedOptionList != null ? selectedOptionList.size() : 0));

        // 5. 구매자 이름 조회
        String userName = ldao.getUserName(orderDetail.getUserIndex());
        System.out.println(" C: 구매자 이름: " + userName);

        // ✅ 6. 상품 상세 정보 목록 조회 (옵션 리스트 이용)
        List<ProductDetailBean> productDetailList = new ArrayList<>(); // 상품 상세 정보 담을 리스트
        ProductDAO pdao = new ProductDAO(); // ProductDAO 객체 생성
        if (selectedOptionList != null && !selectedOptionList.isEmpty()) {
            for (ProductOptionBean option : selectedOptionList) {
                // 각 옵션의 productId를 사용하여 상품 상세 정보 조회
                ProductDetailBean product = pdao.getProductDetail(option.getProduct_id()); 
                if (product != null) {
                    productDetailList.add(product);
                } else {
                     System.out.println(" C: productId=" + option.getProduct_id() + " 에 대한 상품 상세 정보 없음");
                }
            }
        }
        System.out.println(" C: 조회된 상품 상세 정보 개수: " + productDetailList.size());


        // 6-1. 배송지 정보 조회 (DAO가 AddressDTO 하나를 반환)
        AddressDTO addressInfo = adao.getAddressByUserIndex(orderDetail.getUserIndex());
        String totalAddress = ""; // 주소 문자열 초기화

        // addressInfo가 null이 아닌지 확인
        if (addressInfo != null) {
            String city = addressInfo.getCity() != null ? addressInfo.getCity() : "";
            String detailAddress = addressInfo.getDetailAddress() != null ? addressInfo.getDetailAddress() : "";
            String district = addressInfo.getDistrict() != null ? addressInfo.getDistrict() : "";
            String neighborhood = addressInfo.getNeighborhood() != null ? addressInfo.getNeighborhood() : "";

            // 공백 포함하여 주소 조합
            totalAddress = city + " " + district + " " + neighborhood + " " + detailAddress;
            totalAddress = totalAddress.trim(); // 혹시 모를 앞뒤 공백 제거

            System.out.println(" C: 배송지 정보 조회 완료: " + totalAddress);
        } else {
            System.out.println(" C: userIndex=" + orderDetail.getUserIndex() + " 에 대한 주소 정보 없음");
        }


        // 7. request 영역에 데이터 저장
        request.setAttribute("orderDetail", orderDetail);
        request.setAttribute("selectedOptionList", selectedOptionList);
        request.setAttribute("userName", userName);
        request.setAttribute("shippingAddress", addressInfo); // JSP에서 shippingAddress 사용
        // ✅ 조회한 상품 상세 정보 리스트 추가
        request.setAttribute("productDetailList", productDetailList); 
        request.setAttribute("pageNum", pageNum);

        System.out.println(" C: 주문 상세 정보 request 저장 완료");

        // 8. 페이지 이동 설정
        ActionForward forward = new ActionForward();
        forward.setPath("./admin/adminOrderDetail.jsp"); // 최종 상세 페이지 JSP 경로
        forward.setRedirect(false);

        return forward;
    }
}