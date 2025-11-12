<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký Tài khoản - Shoes Family</title>

    <style>
        /* --- CORE STYLES (Đồng bộ với login.jsp) --- */
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { 
            font-family: sans-serif; 
            background-color: #f4f4f4; 
            color: #333; 
            margin: 0; 
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* --- REGISTER CARD --- */
        .register-card {
            width: 90%;
            max-width: 450px; /* Hơi rộng hơn login để chứa nhiều trường */
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .register-card h2 {
            font-size: 1.8rem;
            color: #2196f3; /* Dùng màu xanh cho Đăng ký */
            margin-bottom: 25px;
        }

        /* --- FORM ELEMENTS --- */
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            font-size: 0.9rem;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            border-color: #2196f3;
            outline: none;
        }

        /* --- SUBMIT BUTTON --- */
        .submit-btn {
            width: 100%;
            padding: 12px;
            background-color: #2196f3;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 1.1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 10px;
        }

        .submit-btn:hover {
            background-color: #1a75c0;
        }
        
        /* --- Links --- */
        .link-text {
            margin-top: 15px;
            font-size: 0.9rem;
        }
        .link-text a {
            color: #f44336; /* Màu đỏ cho link quay lại Đăng nhập */
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="register-card">
    <h2>ĐĂNG KÝ TÀI KHOẢN MỚI</h2>

    <%@ taglib prefix="s" uri="/struts-tags" %>
    <s:actionerror cssStyle="color:red; margin-bottom:15px;"/>
    <s:actionmessage cssStyle="color:green; margin-bottom:15px; font-weight:bold;"/>
    <form action="<%= request.getContextPath() %>/register" method="POST">

        <div class="form-group">
            <label for="new_username">Tên đăng nhập</label>
            <input type="text" id="new_username" name="username" required>
        </div>
        
        <div class="form-group">
            <label for="email">Địa chỉ Email</label>
            <input type="email" id="email" name="email" required>
        </div>

        <div class="form-group">
            <label for="password">Mật khẩu</label>
            <input type="password" id="password" name="password" required>
        </div>
        
        <div class="form-group">
            <label for="confirm_password">Xác nhận Mật khẩu</label>
            <input type="password" id="confirm_password" name="confirm_password" required>
        </div>

    <button type="submit" class="submit-btn">Đăng ký</button>
        
    </form>
    
    <p class="link-text">
        Đã có tài khoản? <a href="login.jsp">Đăng nhập ngay</a>
    </p>
    <p class="link-text">
        <a href="Home.jsp">Quay lại trang chủ</a>
    </p>
</div>

</body>
</html>
