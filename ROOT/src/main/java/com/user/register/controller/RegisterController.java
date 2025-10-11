package com.user.register.controller;

import com.user.register.action.RegisterAction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register.do")
public class RegisterController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");

        RegisterAction registerAction = new RegisterAction();
        boolean isSuccess = registerAction.execute(id, password, name);

        if (isSuccess) {
            response.sendRedirect("/registerSuccess.jsp");
        } else {
            String errorMessage = registerAction.getErrorMessage();
            response.sendRedirect("/register.jsp?error=" + errorMessage);
        }
    }
}