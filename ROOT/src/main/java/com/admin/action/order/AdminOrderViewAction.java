package com.admin.action.order;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.admin.db.JoinedOrderData;
import com.admin.db.OrderDAO;
import com.user.login.db.LoginDAO;

public class AdminOrderViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("C: AdminOrderViewAction.execute() 호출");
		
		// TODO: 전체 주문 목록을 조회하는 비즈니스 로직 구현
		
		//1. AdminOrderDAO 객체 생성
		OrderDAO odao = new OrderDAO();
		LoginDAO ldao = new LoginDAO();
		
		//2. DAO를 통해 전체 주문 목록과 관련 상품 정보 조회
		List<JoinedOrderData> orderList = odao.getAllOrdersWithProducts();
		// 3. 사용자 이름 목록 생성
		List<String> userNameList = new ArrayList<>();
		if (orderList != null) {
		    System.out.println("C: 조회된 주문 수: " + orderList.size()); // 주문 수 로그
		    for (JoinedOrderData order : orderList) {
		        String userName = ldao.getUserName(order.getUserIndex());
		        // ✅ 이름 조회 결과 로그 추가
		        System.out.println("C: userIndex=" + order.getUserIndex() + " -> userName=" + userName); 
		        userNameList.add(userName != null ? userName : "Unknown"); 
		    }
		    // ✅ 생성된 이름 리스트 크기 로그 추가
		    System.out.println("C: 생성된 userNameList 크기: " + userNameList.size()); 
		} else {
		    System.out.println("C: orderList가 null입니다.");
		}


		// 4. request 영역에 저장
		request.setAttribute("orderList", orderList);
		request.setAttribute("userNameList", userNameList); 
		System.out.println("C: request에 orderList와 userNameList 저장 완료.");
		
		//4. 페이지 이동 설정
		ActionForward forward = new ActionForward();
		forward.setPath("./adminHome.jsp?page=orders");
		forward.setRedirect(false);
		
		return forward;
	}
}
