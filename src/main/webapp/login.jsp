<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - Shoes Family</title>

    <style>
        /* --- CORE STYLES --- */
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { 
            font-family: sans-serif; 
            background-color: #f4f4f4; 
            color: #333; 
            margin: 0; 
            display: flex; /* Dùng Flexbox để căn giữa */
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* --- LOGIN CARD --- */
        .login-card {
            width: 90%;
            max-width: 400px;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .login-card h2 {
            font-size: 1.8rem;
            color: #f44336; /* Màu chủ đạo */
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
            background-color: #f44336;
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
            background-color: #d32f2f;
        }
        
        /* --- Links --- */
        .link-text {
            margin-top: 15px;
            font-size: 0.9rem;
        }
        .link-text a {
            color: #2196f3;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="login-card">
    <h2>ĐĂNG NHẬP</h2>
    <s:actionerror cssStyle="color:red; margin-bottom:15px;"/>
    <s:actionmessage cssStyle="color:green; margin-bottom:15px; font-weight:bold;"/>
    <form action="${pageContext.request.contextPath}/login" method="POST">

        <div class="form-group">
            <label for="username">Tên đăng nhập / Email</label>
            <input type="text" id="username" name="username" required>
        </div>

        <div class="form-group">
            <label for="password">Mật khẩu</label>
            <input type="password" id="password" name="password" required>
        </div>

    <button type="submit" class="submit-btn">Đăng nhập</button>
        
        
    </form>
    
    <p class="link-text">
        Chưa có tài khoản? <a href="register.jsp">Đăng ký ngay</a>
    </p>
    <p class="link-text">
        <a href="Home.jsp">Quay lại trang chủ</a>
    </p>
</div>

</body>
</html>