package com.order.controller;

import com.ActionForward;
import com.cart.db.CartItem;
import com.product.db.ProductDAO;
import com.product.db.ProductDetailBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class OrderController extends HttpServlet {

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String command = request.getServletPath();
        ActionForward forward = null;


        System.out.println("========== OrderController 진입 ==========");
        System.out.println("요청된 Command: " + command);

        System.out.println("OrderController - 요청된 Command: " + command); 
        
        // "productId" 라는 이름으로 넘어온 모든 값을 배열로 받습니다.
        String[] productIds = request.getParameterValues("productId");
        String[] op = request.getParameterValues("optionId");
        // 배열이 null이 아니고 비어있지 않은지 확인 후 콘솔에 출력합니다.
        if (productIds != null && productIds.length > 0) {
            System.out.println("✅ 체크박스 값 받음: " + java.util.Arrays.toString(productIds));
        } else {
            System.out.println("❌ 체크박스 값 없음");
        }
        if (op != null && op.length > 0) {
            System.out.println("✅ 체크박스 값 받음: " + java.util.Arrays.toString(op));
        } else {
            System.out.println("❌ 체크박스 값 없음");
        }


        try {
            if (command.equals("/order.do")) {
                HttpSession session = request.getSession();
                List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartList");
                String userName = (String) session.getAttribute("user_name");
                String userPhone = (String) session.getAttribute("user_phone");

                // 1. 세션에서 cartList 확인
                if (cartItems == null || cartItems.isEmpty()) {
                    System.out.println("[DEBUG] 세션에 'cartList'가 없거나 비어있습니다.");
                } else {
                    System.out.println("[DEBUG] 세션에서 'cartList'를 찾았습니다. 항목 수: " + cartItems.size());
                }

                List<ProductDetailBean> orderProducts = new ArrayList<>();
                ProductDAO productDAO = new ProductDAO();

                if (cartItems != null && !cartItems.isEmpty()) {
                    for (CartItem item : cartItems) {
                        System.out.println("[DEBUG] 장바구니 항목 처리 중... ProductId: " + item.getProductId());
                        ProductDetailBean product = productDAO.getProductDetail(item.getProductId());
                        
                        // 2. DB 조회 결과 확인
                        if (product != null) {
                            System.out.println("[DEBUG] ProductId " + item.getProductId() + "에 대한 상품 정보를 DB에서 찾았습니다. 상품명: " + product.getName());
                            orderProducts.add(product);
                        } else {
                            System.out.println("[DEBUG] ProductId " + item.getProductId() + "에 대한 상품 정보를 DB에서 찾지 못했습니다.");
                        }
                    }
                }

                // 3. 최종 데이터 확인
                System.out.println("[DEBUG] 최종 orderProducts 리스트 크기: " + orderProducts.size());

                request.setAttribute("order_product_list", orderProducts);
                request.setAttribute("cart_list", cartItems);
                request.setAttribute("user_name", userName);
                request.setAttribute("user_phone", userPhone);

                forward = new ActionForward();
                forward.setPath("/order/orderPage.jsp");
                forward.setRedirect(false);

            } else if (command.equals("/buyNow.do")) {
                System.out.println("[DEBUG] /buyNow.do 로직 실행");

                HttpSession session = request.getSession();

                // 1. 로그인 확인
                Integer userIndex = (Integer) session.getAttribute("userIndex");
                if (userIndex == null) {
                    response.setContentType("text/html; charset=UTF-8");
                    java.io.PrintWriter out = response.getWriter();
                    out.println("<script>");
                    out.println("alert('로그인이 필요합니다.');");
                    out.println("location.href='/login.do';"); // 로그인 페이지 경로
                    out.println("</script>");
                    out.close();
                    return; // 컨트롤러 로직 중단
                }

                // 2. 파라미터 가져오기
                int productId = Integer.parseInt(request.getParameter("productSeq"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int optionId = Integer.parseInt(request.getParameter("optionId"));
                String userName = (String) session.getAttribute("user_name");
                String userPhone = (String) session.getAttribute("user_phone");

                // 3. 바로 구매할 상품만 포함하는 임시 장바구니 리스트 생성
                List<CartItem> buyNowCartList = new ArrayList<>();
                buyNowCartList.add(new CartItem(userIndex, productId, optionId, quantity));

                // 4. 상품 상세 정보 조회
                List<ProductDetailBean> orderProducts = new ArrayList<>();
                ProductDAO productDAO = new ProductDAO();
                ProductDetailBean product = productDAO.getProductDetail(productId);
                if (product != null) {
                    orderProducts.add(product);
                }

                // 5. request에 데이터 저장
                request.setAttribute("order_product_list", orderProducts);
                request.setAttribute("cart_list", buyNowCartList); // 수량 정보를 위해 임시 리스트 전달
                request.setAttribute("user_name", userName);
                request.setAttribute("user_phone", userPhone);

                forward = new ActionForward();
                forward.setPath("/order/orderPage.jsp");
                forward.setRedirect(false);
            }

            if (forward != null) {
                if (forward.isRedirect()) {
                    response.sendRedirect(forward.getPath());
                } else {
                    RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
                    dispatcher.forward(request, response);
                }
            }
        } catch (Exception e) {
            System.out.println("[ERROR] OrderController에서 예외 발생");
            e.printStackTrace();
        }
        System.out.println("========== OrderController 종료 ==========");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }
}
