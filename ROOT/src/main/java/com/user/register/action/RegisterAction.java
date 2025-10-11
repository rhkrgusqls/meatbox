package com.user.register.action;

import com.user.register.db.RegisterDAO;
import com.user.register.db.RegisterException;

public class RegisterAction {

    private String errorMessage;

    public boolean execute(String id, String password, String name) {
        RegisterDAO dao = new RegisterDAO();

        try {
            dao.register_normaluser(id, password, name);
            return true;

        } catch (RegisterException e) {
            this.errorMessage = e.getMessage();
            e.printStackTrace();
            return false;
        }
    }

    public String getErrorMessage() {
        return errorMessage;
    }
}
