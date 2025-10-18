package com.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ActionForward;
import com.order.db.PaymentMethodDAO;

// web.xml에 서블릿을 등록했다면 @WebServlet 애너테이션은 필요 없습니다.
// 만약 사용한다면, urlPatterns를 "/payment/*" 등으로 설정하여 이 컨트롤러가 관련 요청을 모두 받도록 할 수 있습니다.
// @WebServlet("/payment/*") 
public class PaymentMethodController extends HttpServlet {

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String command = request.getServletPath();
        ActionForward forward = null;
        
        System.out.println("========== PaymentMethodController 진입 ==========");
        System.out.println("요청된 Command: " + command);

        // --- 1. 결제수단 등록 페이지로 이동하는 요청 처리 ---
        if (command.equals("/payment/register.do")) {
            // 특별한 비즈니스 로직 없이 JSP 페이지만 보여주면 되므로 간단히 포워딩합니다.
            forward = new ActionForward();
            forward.setPath("/payment/paymentMethodRegister.jsp");
            forward.setRedirect(false); // request에 담긴 returnUrl 파라미터를 JSP로 전달해야 하므로 false

        // --- 2. 결제수단 등록 '실행' 요청 처리 ---
        } else if (command.equals("/payment/registerAction.do")) {
            HttpSession session = request.getSession();
            Integer userIndex = (Integer) session.getAttribute("userIndex");
            
            // 로그인 상태가 아니면, 로그인 페이지로 보냅니다.
            if (userIndex == null) {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인이 필요합니다.'); location.href='/login.do';</script>");
                out.close();
                return;
            }

            String provider = request.getParameter("provider");
            // [핵심] JSP 폼에 숨겨져 있던 '돌아갈 주소' 파라미터를 받습니다.
            String returnUrl = request.getParameter("returnUrl");

            // 필수 값들이 제대로 들어왔는지 확인합니다.
            if (provider != null && !provider.trim().isEmpty()) {
                PaymentMethodDAO dao = new PaymentMethodDAO();
                boolean isSuccess = dao.addPaymentMethod(userIndex, provider);
                
                if(isSuccess) {
                    System.out.println("DB 등록 성공. returnUrl로 리다이렉트합니다.");
                    
                    // [핵심] 돌아갈 주소(returnUrl)가 있는지 확인하고 분기 처리합니다.
                    if (returnUrl != null && !returnUrl.isEmpty()) {
                        // '바로 구매' 중이었다면, 상품 정보가 담긴 원래의 주문 페이지로 돌아갑니다.
                        response.sendRedirect(returnUrl);
                    } else {
                        // '바로 구매'가 아니었다면(예: 마이페이지에서 등록), 기본 경로로 돌아갑니다.
                        response.sendRedirect("/order.do"); 
                    }
                    return; // 리다이렉트 후에는 다른 포워드 로직이 실행되지 않도록 반드시 return 합니다.
                } else {
                    // DB 등록 실패 시 처리
                    response.setContentType("text/html; charset=UTF-8");
                    PrintWriter out = response.getWriter();
                    out.println("<script>alert('결제수단 등록에 실패했습니다.'); history.back();</script>");
                    out.close();
                    return;
                }
            } else {
                // provider 값이 비어있을 경우 처리
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('결제 제공사 이름을 입력해주세요.'); history.back();</script>");
                out.close();
                return;
            }
        }

        // --- 3. 포워딩 처리 ---
        if (forward != null) {
            if (forward.isRedirect()) {
                response.sendRedirect(forward.getPath());
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
                dispatcher.forward(request, response);
            }
        }
        System.out.println("========== PaymentMethodController 종료 ==========");
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