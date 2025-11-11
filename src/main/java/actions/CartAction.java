package actions;

import com.opensymphony.xwork2.ActionSupport;

public class CartAction extends ActionSupport {
    @Override
    public String execute() {
        return SUCCESS; // Struts result maps to cart.jsp
    }
}

