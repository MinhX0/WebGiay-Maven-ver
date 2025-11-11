<%@ page import="dao.DBContext" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kiểm tra kết nối MySQL</title>
</head>
<body>
    <h2>Kiểm tra kết nối MySQL</h2>
    <%
        try {
            Connection conn = DBContext.getConnection();
            if (conn != null) {
                out.println("<p style='color:green;'>✅ Kết nối MySQL thành công!</p>");
                conn.close();
            } else {
                out.println("<p style='color:red;'>❌ Kết nối thất bại!</p>");
            }
        } catch (Exception e) {
            out.println("<p style='color:red;'>Lỗi: " + e.getMessage() + "</p>");
        }
    %>
</body>
</html>


