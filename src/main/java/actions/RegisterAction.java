package actions;

import com.opensymphony.xwork2.ActionSupport;
import dao.UserDAO;
import entity.User;

public class RegisterAction extends ActionSupport {
    private String username;
    private String email;
    private String password;
    private String confirm_password; // Match form field name

    private final UserDAO userDAO = new UserDAO();

    @Override
    public String execute() {
        if (isBlank(username) || isBlank(email) || isBlank(password) || isBlank(confirm_password)) {
            addActionError("Vui lòng điền đầy đủ thông tin.");
            return INPUT;
        }
        if (!password.equals(confirm_password)) {
            addActionError("Mật khẩu xác nhận không khớp.");
            return INPUT;
        }
        // Original insecure logic: store plain password
        User newUser = new User(username, email, password);
        boolean ok = userDAO.registerUser(newUser);
        if (ok) {
            addActionMessage("Đăng ký thành công! Vui lòng đăng nhập.");
            return SUCCESS;
        }
        addActionError("Tên đăng nhập hoặc Email đã được sử dụng.");
        return INPUT;
    }

    private boolean isBlank(String s){ return s==null || s.trim().isEmpty(); }

    // getters/setters
    public String getUsername(){ return username; }
    public void setUsername(String username){ this.username = username; }
    public String getEmail(){ return email; }
    public void setEmail(String email){ this.email = email; }
    public String getPassword(){ return password; }
    public void setPassword(String password){ this.password = password; }
    public String getConfirm_password(){ return confirm_password; }
    public void setConfirm_password(String confirm_password){ this.confirm_password = confirm_password; }
}