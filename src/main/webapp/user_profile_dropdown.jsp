<%-- 
    File: user_profile_dropdown.jsp
    Hiển thị tên người dùng đã đăng nhập và menu Đăng xuất/Sửa thông tin
--%>
<%-- File: user_profile_dropdown.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="entity.User" %>

<% 
    // Lấy thông tin User từ session
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    String username = (loggedInUser != null) ? loggedInUser.getUsername() : "Guest";
%>

<style>
    /* CSS Chỉ áp dụng cho Dropdown này */
    .dropdown {
    /* Thay đổi: Tham gia vào Flexbox của <nav> */
    display: inline-block; 
    position: relative; /* Giữ relative để menu con xổ xuống đúng */
    margin-left: 20px; /* Thêm khoảng cách với Giỏ hàng (0) */
}
    .dropbtn {
        background-color: #4CAF50; 
        color: white;
        padding: 8px 12px;
        border: none;
        cursor: pointer;
        border-radius: 4px;
        font-weight: bold;
        text-decoration: none;
    }
    .dropbtn:hover, .dropbtn:focus {
        background-color: #45a049;
    }
    .dropdown-content {
        /* BẮT BUỘC: Đặt vị trí tuyệt đối cho menu con */
        display: none;
        position: absolute; 
        top: 100%; /* Đẩy xuống ngay dưới nút */
        right: 0; 
        background-color: #f9f9f9;
        min-width: 180px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1001; 
        border-radius: 4px;
        overflow: hidden;
    }
    /* Ghi đè CSS cho các link bên trong dropdown */
    .dropdown-content a {
        color: #333;
        padding: 10px 16px;
        text-decoration: none;
        display: block;
        margin-left: 0 !important; /* Quan trọng: Ghi đè margin từ .header nav a */
        text-align: left;
    }
    .dropdown-content a:hover {
        background-color: #e0e0e0;
    }

    /* Hiển thị dropdown khi hover */
    .dropdown:hover .dropdown-content {
        display: block;
    }
</style>

<div class="dropdown">
    <button class="dropbtn">Xin chào, <%= username %></button>
    <div class="dropdown-content">
        <a href="<%= request.getContextPath() %>/profile">Sửa thông tin</a>
        
        <a href="<%= request.getContextPath() %>/logout">Đăng xuất</a>
    </div>
</div>