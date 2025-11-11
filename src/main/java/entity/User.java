package entity; 

// Entity của bạn (không thay đổi logic)
public class User {
    private int id;
    private String username;
    private String email;
    private String passwordHash; 
    private int isSeller; 
    private int isAdmin; 

    // Constructor mặc định
    public User() {
    }

    // Constructor cho Đăng ký (chưa biết ID)
    public User(String username, String email, String passwordHash) {
        this.username = username;
        this.email = email;
        this.passwordHash = passwordHash;
        this.isSeller = 0;
        this.isAdmin = 0;
    }
    
    // Getters và Setters (được lược bỏ để tiết kiệm không gian)
    // ...
    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPasswordHash() { return passwordHash; }
    public void setPasswordHash(String passwordHash) { this.passwordHash = passwordHash; }
    public int getIsSeller() { return isSeller; }
    public void setIsSeller(int isSeller) { this.isSeller = isSeller; }
    public int getIsAdmin() { return isAdmin; }
    public void setIsAdmin(int isAdmin) { this.isAdmin = isAdmin; }
}