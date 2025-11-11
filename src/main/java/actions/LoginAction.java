package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.UserDAO;
import entity.User;
import java.util.Map;

public class LoginAction extends ActionSupport {
    private String username;
    private String password;
    private final UserDAO userDAO = new UserDAO();

    @Override
    public String execute() {
        if (isBlank(username) || isBlank(password)) {
            addActionError("Tên đăng nhập và mật khẩu không được để trống.");
            return INPUT;
        }
        User user = userDAO.getUserByUsername(username);
        if (user != null && password.equals(user.getPasswordHash())) { // Plain comparison kept
            Map<String,Object> session = ActionContext.getContext().getSession();
            session.put("loggedInUser", user);
            return SUCCESS;
        }
        addActionError("Tên đăng nhập hoặc mật khẩu không đúng.");
        return INPUT;
    }

    private boolean isBlank(String s) { return s == null || s.trim().isEmpty(); }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}