package dao; // PACKAGE ĐÃ ĐƯỢC CHỈNH SỬA

import entity.User; // GỌI LỚP USER TỪ PACKAGE ENTITY
import java.sql.*;

public class UserDAO {
    
    // Khởi tạo DBContext ngay trong DAO vì chúng cùng package
    private DBContext dbContext = new DBContext(); 
    
    private static final String INSERT_USER_SQL = "INSERT INTO User (username, email, passwordHash, isSeller, isAdmin) VALUES (?, ?, ?, 0, 0)";
    private static final String SELECT_USER_BY_USERNAME = "SELECT * FROM User WHERE username = ?";
    private static final String UPDATE_USER_SQL = 
        "UPDATE User SET username = ?, email = ?, passwordHash = ? WHERE id = ?";

    // 1. ĐĂNG KÝ (Thêm người dùng mới)
    public boolean registerUser(User user) {
        try (Connection connection = dbContext.getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {
            
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPasswordHash()); 
            
            int result = preparedStatement.executeUpdate();
            return result > 0;

        } catch (SQLException e) {
            System.err.println("Lỗi khi đăng ký người dùng: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // 2. ĐĂNG NHẬP (Tìm người dùng theo Tên đăng nhập)
    public User getUserByUsername(String username) {
        User user = null;
        try (Connection connection = dbContext.getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_USERNAME)) {
            
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPasswordHash(rs.getString("passwordHash")); 
                user.setIsSeller(rs.getInt("isSeller"));
                user.setIsAdmin(rs.getInt("isAdmin"));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi tìm kiếm người dùng: " + e.getMessage());
            e.printStackTrace();
        }
        return user;
    }
    public boolean updateUser(User user) {
        try (Connection connection = dbContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_SQL)) {
            
            // 1. Username mới
            preparedStatement.setString(1, user.getUsername());
            // 2. Email mới
            preparedStatement.setString(2, user.getEmail());
            // 3. Mật khẩu mới (Đã được xử lý hash/plain text ở tầng Servlet)
            preparedStatement.setString(3, user.getPasswordHash()); 
            // 4. ID (Điều kiện WHERE)
            preparedStatement.setInt(4, user.getId());
            
            return preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Lỗi SQL khi cập nhật thông tin người dùng ID " + user.getId() + ": " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}