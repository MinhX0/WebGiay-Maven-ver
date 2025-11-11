package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Map;

public class LogoutAction extends ActionSupport {
    @Override
    public String execute() {
        Map<String,Object> session = ActionContext.getContext().getSession();
        session.remove("loggedInUser");
        session.remove("cart");
        return SUCCESS;
    }
}
