package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.UserDAO;
import entity.User;

public class ProfileAction extends ActionSupport {
    private final UserDAO userDAO = new UserDAO();

    // Form fields
    private String username;
    private String email;
    private String newPassword;

    // Show form
    @Override
    public String execute() {
        User logged = (User) ActionContext.getContext().getSession().get("loggedInUser");
        if (logged == null) {
            return "login"; // redirect to login
        }
        ActionContext.getContext().put("userProfile", logged);
        return SUCCESS; // user_profile_form.jsp
    }

    public String save() {
        User logged = (User) ActionContext.getContext().getSession().get("loggedInUser");
        if (logged == null) {
            return "login";
        }
        if (username != null && !username.trim().isEmpty()) logged.setUsername(username.trim());
        if (email != null && !email.trim().isEmpty()) logged.setEmail(email.trim());
        if (newPassword != null && !newPassword.trim().isEmpty()) logged.setPasswordHash(newPassword.trim());
        boolean ok = userDAO.updateUser(logged);
        ActionContext.getContext().getSession().put("statusMessage", ok ? "Cập nhật thông tin thành công!" : "Lỗi: Username hoặc Email đã tồn tại.");
        return ok ? SUCCESS : INPUT;
    }

    // Getters/Setters
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getNewPassword() { return newPassword; }
    public void setNewPassword(String newPassword) { this.newPassword = newPassword; }
}
