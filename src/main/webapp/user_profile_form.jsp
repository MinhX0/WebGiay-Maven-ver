<%-- File: user_profile_form.jsp (Dùng chung cho cả Admin và Khách hàng) --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="entity.User" %>

<% 
    User user = (User) request.getAttribute("userProfile"); 
    String statusMessage = (String) session.getAttribute("statusMessage");

    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa Thông tin Cá nhân</title>
    <style>
        body { font-family: sans-serif; background-color: #f4f4f4; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .profile-card { width: 90%; max-width: 450px; background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); text-align: center; }
        .profile-card h2 { font-size: 1.8rem; color: #4CAF50; margin-bottom: 25px; }
        .form-group { margin-bottom: 20px; text-align: left; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; font-size: 0.9rem; }
        .form-group input { width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 4px; font-size: 1rem; }
        .submit-btn { width: 100%; padding: 12px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; font-size: 1.1rem; font-weight: bold; cursor: pointer; transition: background-color 0.3s; margin-top: 10px; }
        .submit-btn:hover { background-color: #45a049; }
        .back-link { margin-top: 15px; display: block; color: #333; text-decoration: none; }
        .role { color: #f44336; font-weight: bold; }
    </style>
</head>
<body>

<div class="profile-card">
    <h2>HỒ SƠ CÁ NHÂN</h2>
    <p style="color: gray; margin-bottom: 20px;">
        Tài khoản: **<%= user.getUsername() %>** (<span class="role"><%= user.getIsAdmin() == 1 ? "ADMIN" : "Khách hàng" %></span>)
    </p>
    
    <%-- Hiển thị thông báo trạng thái --%>
    <% if(statusMessage != null) { 
        session.removeAttribute("statusMessage");
        out.print("<p style='color: green; font-weight: bold; margin-bottom: 15px;'>" + statusMessage + "</p>");
    } %>

    <form action="<%= request.getContextPath() %>/profile-save" method="POST">

        <div class="form-group">
            <label for="username">Tên đăng nhập:</label>
            <input type="text" id="username" name="username" value="<%= user.getUsername() %>" required>
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required>
        </div>
        
        <div class="form-group">
            <label for="newPassword">Mật khẩu mới (Để trống nếu không đổi):</label>
            <input type="password" id="newPassword" name="newPassword">
        </div>

        <button type="submit" class="submit-btn">Lưu Thay Đổi</button>
        
    </form>
    
    <a href="Home.jsp" class="back-link">Quay lại Trang chủ</a>
</div>

</body>
</html>
