<%-- 
    File : Home.jsp (Hoàn chỉnh điều hướng sau login)
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ - Shoes Family</title>
    
    <style>
        
        /* --- CORE STYLES --- */
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: sans-serif; background-color: #f4f4f4; color: #333; margin: 0; min-height: 100vh; }
        .container { width: 90%; max-width: 1200px; margin: 0 auto; padding: 20px 0; }

        /* --- HEADER & NAVIGATION (FIXED) --- */
        .header { 
            background-color: #383838;
            padding: 10px 5%; 
            color: white; 
            /* Dùng GRID để chia header thành 2 hàng chính */
            display: grid;
            grid-template-columns: auto 1fr; /* Logo/Dropdown | Nav chính */
            grid-template-rows: auto auto; 
            align-items: center; 
            position: sticky; 
            top: 0; 
            z-index: 1000; 
        }
        
        .logo-area { 
            /* Logo: Hàng 1, Cột 1 */
            grid-row: 1; 
            grid-column: 1; 
        }
        .header h1 { font-size: 1.5rem; margin: 0; }
        
        .main-nav-controls {
            /* Nav: Hàng 1, Cột 2 */
            grid-row: 1;
            grid-column: 2; 
            display: flex;
            align-items: center; 
            justify-content: flex-end;
        }
        
        .user-dropdown-area {
            /* Dropdown: Hàng 2, chiếm 2 cột */
            grid-row: 2;
            grid-column: 1 / span 2; 
            padding-top: 5px;
            display: flex;
        }
        
        /* ... (Các CSS khác giữ nguyên) ... */
        .main-nav-controls a { color: white; text-decoration: none; margin-left: 20px; padding: 8px 10px; font-size: 0.9rem; }
        .auth-btn { background-color: #f44336; padding: 8px 12px; border-radius: 4px; margin-left: 20px !important; font-weight: bold; text-decoration: none; color: white !important; transition: background-color 0.3s; }
        .auth-btn:hover { background-color: #d32f2f; }
        .carousel { height: 70vh; background-image: url('https://file.hstatic.net/1000230642/file/web-top-banner_68b9a0c957374772bdf25d1d0f312b11_master.jpg'); background-size: cover; background-position: center; display: flex; justify-content: center; align-items: center; color: white; font-size: 2rem; font-weight: bold; text-shadow: 2px 2px 4px rgba(0,0,0,0.5); margin-top: 55px; }
        .service-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; text-align: center; padding: 30px 0; border-bottom: 1px solid #ccc; }
        .service-item h5 { color: #f44336; margin: 5px 0; }
        .service-item p { font-size: 0.9rem; color: #666; }
        .section-title { text-align: center; padding: 20px 0 10px; font-size: 1.8rem; color: #f44336; border-top: 2px solid #ddd; margin-top: 40px; }
        .product-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; padding-bottom: 30px; }
        .card { background: #fff; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 5px rgba(0,0,0,0.1); text-align: center; position: relative; }
        .card img { width: 100%; height: 200px; object-fit: cover; }
        .card h4 { font-size: 1.1rem; margin: 10px 0 5px; }
        .card p { font-size: 0.9rem; color: #666; margin-bottom: 5px; }
        .card .price { display: block; background: #2196f3; color: white; padding: 8px; margin: 10px 15px; border-radius: 4px; text-decoration: none; font-weight: bold; }
        .sale-tag { position: absolute; top: 10px; right: 10px; background-color: #ff9800; color: white; padding: 5px 10px; border-radius: 3px; font-size: 0.8rem; font-weight: bold; }
        .about-section { padding: 40px 0; border-top: 2px solid #ddd; margin-top: 40px; text-align: center; }
        .about-section h2 { margin-bottom: 15px; }
        .about-section p { max-width: 800px; margin: 0 auto; line-height: 1.6; color: #555; }
        .contact-info { margin-top: 20px; font-size: 1rem; }
        /* Cập nhật trong khối .card CSS */
.card { 
    /* Giữ nguyên các thuộc tính hiện có */
    background: #fff; 
    border: none;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
    text-align: center; /* Đảm bảo text và các block nội dung được căn giữa */
    padding: 15px; 
    position: relative;
    display: flex;
    flex-direction: column;
    justify-content: space-between; 
    transition: transform 0.3s, box-shadow 0.3s;
    overflow: hidden;
}

/* Cập nhật CSS cho form bao quanh nút */
.card form {
    margin: 0 auto; /* Căn giữa form theo chiều ngang */
    padding: 15px; /* Giữ padding tổng thể của thẻ */
    width: 80%; /* Giảm chiều rộng của form để nút có thể căn giữa trong phạm vi đó */
    max-width: 200px; /* Giới hạn chiều rộng tối đa của nút */
}

/* Nút giá đã được nâng cấp (giữ nguyên hoặc điều chỉnh nhẹ) */
.card-price-btn {
    display: block; 
    background-color: #2196f3; 
    color: white; 
    padding: 12px 15px; 
    /* margin: 15px 0 0;  -- BỎ THUỘC TÍNH NÀY để form tự căn giữa */
    border: none;
    border-radius: 8px; 
    font-weight: 700; 
    font-size: 1.2rem; 
    cursor: pointer;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    box-shadow: 0 4px 10px rgba(33, 150, 243, 0.4); 
    transition: transform 0.2s, background-color 0.2s, box-shadow 0.2s;
    width: 100%; /* Nút chiếm 100% chiều rộng của form chứa nó */
}

.card-price-btn:hover {
    background-color: #1a75c0; 
    transform: translateY(-2px); 
    box-shadow: 0 6px 15px rgba(33, 150, 243, 0.6);
}
    </style>
</head>
<body>

<header class="header">
    <div class="logo-area">
        <h1>Shoes Family</h1>
    </div>

    <nav class="main-nav-controls">
        <a href="Home.jsp">Trang chủ</a>
        <a href="${pageContext.request.contextPath}/products">Sản phẩm</a>
        <a href="${pageContext.request.contextPath}/cart">Giỏ hàng (0)</a>
        <c:if test="${empty sessionScope.loggedInUser}">
            <a href="${pageContext.request.contextPath}/login" class="auth-btn">ĐĂNG NHẬP</a>
        </c:if>
    </nav>

    <div class="user-dropdown-area ${empty sessionScope.loggedInUser ? 'hidden' : ''}">
        <c:if test="${not empty sessionScope.loggedInUser}">
            <jsp:include page="user_profile_dropdown.jsp"/>
        </c:if>
    </div>
</header>

<div class="carousel">
    Chào mừng đến với Shoes Family
</div>

<main class="container">
    
    <div class="service-grid">
        <div class="service-item"><h5>GIAO HÀNG</h5><p>Vận chuyển khắp VN</p></div>
        <div class="service-item"><h5>THANH TOÁN</h5><p>Nhận hàng rồi trả tiền</p></div>
        <div class="service-item"><h5>BẢO HÀNH</h5><p>Lên đến 60 ngày</p></div>
        <div class="service-item"><h5>ĐỔI HÀNG</h5><p>Thoải mái trong 30 ngày</p></div>
    </div>

    <h2 class="section-title">SẢN PHẨM NỔI BẬT</h2>
    <div class="product-grid">
        <div class="card">
            <img src="https://cdn.hstatic.net/files/1000230642/file/1920x750__28__8206eae857294e9a8841116bfb8730a0.jpg" alt="Nike Air Zoom">
            <span class="sale-tag">SALE 15%</span>
            <h4>Nike Air Zoom</h4>
            <p>Nâng Niu Bàn Chân Phái Đẹp</p>
            
            <form action="<%= request.getContextPath() %>/addToCart" method="POST">
                <input type="hidden" name="productId" value="1">
                <button type="submit" class="card-price-btn">120 $</button>
            </form>
        </div>
        
        <div class="card">
            <img src="https://file.hstatic.net/1000230642/file/banner_central_opt_2_76f1c057c7dc43ee9c8a36c6bee9ac4d_master.jpg" alt="Nike Air Max">
            <h4>Nike Air Max</h4>
            <p>Thời trang và năng động</p>
            
            <form action="<%= request.getContextPath() %>/addToCart" method="POST">
                <input type="hidden" name="productId" value="3">
                <button type="submit" class="card-price-btn">110 $</button>
            </form>
        </div>
        
        </div>
    
    <div class="about-section">
        <h2 class="section-title">VỀ CHÚNG TÔI</h2>
        <p>Shoes Family chuyên cung cấp giày thể thao **Replica 1:1 - Like Auth** với chất lượng đảm bảo và giá tốt nhất.</p>
        <div class="contact-info">**Hotline:** 0123.456.789 | **Email:** contact@shoesfamily.vn</div>
    </div>
    
</main>

</body>
</html>
