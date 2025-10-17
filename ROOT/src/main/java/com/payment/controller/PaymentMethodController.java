package com.payment.controller;

import com.ActionForward;
import com.order.db.PaymentMethodDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class PaymentMethodController extends HttpServlet {

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String command = request.getServletPath();
        ActionForward forward = null;

        if (command.equals("/payment/register.do")) {
            forward = new ActionForward();
            forward.setPath("/payment/paymentMethodRegister.jsp");
            forward.setRedirect(false);
        } else if (command.equals("/payment/registerAction.do")) {
            HttpSession session = request.getSession();
            Integer userIndex = (Integer) session.getAttribute("userIndex");
            Integer userRole = (Integer) session.getAttribute("role");

            if (userIndex == null) {
                response.sendRedirect("/login.do");
                return;
            }

            // Assuming 1 is the role for NORMAL user
            if (userRole == null || userRole != 1) {
                response.setContentType("text/html; charset=UTF-8");
                java.io.PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('판매자는 결제수단을 등록할 수 없습니다.');");
                out.println("history.back();");
                out.println("</script>");
                out.close();
                return;
            }

            String provider = request.getParameter("provider");
            System.out.println("Registering payment method for userIndex: " + userIndex + ", provider: " + provider);

            if (provider == null || provider.trim().isEmpty()) {
                response.setContentType("text/html; charset=UTF-8");
                java.io.PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('결제 제공사 이름을 입력해주세요.');");
                out.println("history.back();");
                out.println("</script>");
                out.close();
                return;
            }

            PaymentMethodDAO dao = new PaymentMethodDAO();
            boolean success = dao.addPaymentMethod(userIndex, provider);

            response.setContentType("text/html; charset=UTF-8");
            java.io.PrintWriter out = response.getWriter();
            out.println("<script>");
            if (success) {
                out.println("alert('결제수단이 등록되었습니다.');");
                out.println("location.href='/order.do';");
            } else {
                out.println("alert('결제수단 등록에 실패했습니다.');");
                out.println("history.back();");
            }
            out.println("</script>");
            out.close();
            return;
        }

        if (forward != null) {
            if (forward.isRedirect()) {
                response.sendRedirect(forward.getPath());
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
                dispatcher.forward(request, response);
            }
        }
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
