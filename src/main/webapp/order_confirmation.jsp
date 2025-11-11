<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Xác nhận đơn hàng</title>
    <meta charset="UTF-8"/>
    <style>
        body{font-family:sans-serif;background:#f7f7f7;margin:0}
        .container{max-width:640px;margin:60px auto;background:#fff;padding:32px;border-radius:12px;box-shadow:0 6px 24px rgba(0,0,0,.12)}
        h2{color:#4CAF50;margin-top:0}
        a{color:#2196f3}
    </style>
</head>
<body>
<div class="container">
    <h2>Đặt hàng thành công</h2>
    <p><strong><%= request.getAttribute("orderStatus") != null ? request.getAttribute("orderStatus") : "Cảm ơn bạn đã mua hàng!" %></strong></p>
    <p><a href="<%= request.getContextPath() %>/Home.jsp">Tiếp tục mua sắm</a></p>
</div>
</body>
</html>
