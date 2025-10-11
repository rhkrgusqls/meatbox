package com.user.register.action;

import com.Action;
import com.ActionForward;
import com.user.register.db.RegisterDAO;
import com.user.register.db.RegisterException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterNormalAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        
        RegisterDAO dao = new RegisterDAO();
        ActionForward forward = new ActionForward();

        try {
            dao.register_normaluser(id, password, name);
            
            forward.setRedirect(true); 
            forward.setPath(request.getContextPath() + "/register/registerSuccess.jsp");

        } catch (RegisterException e) {
            e.printStackTrace();
            
            request.setAttribute("errorMessage", e.getMessage());
            forward.setRedirect(false); 
            forward.setPath("./register/registerNormalForm.jsp");
        }
        
        return forward;
    }
}