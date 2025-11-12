<%-- File: product_list.jsp (Trang Danh sách sản phẩm) --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách Sản phẩm - Shoes Family</title>
    
    <style>
        /* ... (CSS giữ nguyên) ... */
        .container { width: 90%; max-width: 1200px; margin: 0 auto; padding: 20px 0; }
        .section-title { text-align: center; padding: 20px 0 10px; font-size: 2rem; color: #2196f3; }
        .product-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 25px; padding-bottom: 50px; }
        .card { background: #fff; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); text-align: center; padding: 15px; position: relative; display: flex; flex-direction: column; justify-content: space-between; }
        .card img { width: 100%; height: 220px; object-fit: cover; border-radius: 4px; margin-bottom: 10px; }
        .card h4 { font-size: 1.2rem; color: #333; margin-bottom: 5px; }
        .card p.desc { font-size: 0.9rem; color: #666; margin-bottom: 5px; }
        .card .price { font-size: 1.3rem; color: #f44336; font-weight: bold; margin-top: 5px; display: block; }
        .add-btn { background-color: #4CAF50; color: white; padding: 10px; border: none; border-radius: 4px; cursor: pointer; margin-top: 10px; width: 100%; font-weight: bold; transition: background-color 0.3s; }
        .edit-btn { background-color: #ff9800; } 
        .delete-btn { background-color: #f44336; } 
        .btn-group { display: flex; justify-content: space-between; margin-top: 10px; }
        .admin-action-btn { padding: 10px; border: none; border-radius: 4px; cursor: pointer; width: 48%; font-size: 1rem; font-weight: bold; color: white; }
        .btn-form { display: inline-block; margin: 0; padding: 0; width: 48%; }
        .sale-tag { position: absolute; top: 25px; right: 25px; background-color: #ff9800; color: white; padding: 5px 10px; border-radius: 3px; font-size: 0.8rem; font-weight: bold; }
    </style>
</head>
<body>

<div class="container">
    <h2 class="section-title">DANH SÁCH SẢN PHẨM</h2>
    
    <c:set var="statusMessage" value="${sessionScope.statusMessage}" />
    <c:if test="${not empty statusMessage}">
        <p style="color: blue; text-align: center; font-weight: bold; margin-bottom: 20px;">${statusMessage}</p>
        <c:remove var="statusMessage" scope="session" />
    </c:if>

    <c:set var="isAdmin" value="${sessionScope.loggedInUser != null && sessionScope.loggedInUser.isAdmin == 1}" />

    <c:if test="${isAdmin}">
        <form action="${pageContext.request.contextPath}/adminProductAction" method="GET" style="margin-bottom: 20px;">
            <input type="hidden" name="action" value="addForm">
            <button type="submit" class="add-btn">Thêm sản phẩm mới</button>
        </form>
    </c:if>

    <div class="product-grid">
        <c:forEach var="product" items="${requestScope.productList}">
            <div class="card">
                
                <div>
                    <img src="${product.imageUrl}" alt="${product.name}">
                    
                    <c:if test="${product.isSale}">
                        <span class="sale-tag">ĐANG SALE</span>
                    </c:if>
                    
                    <h4>${product.name}</h4>
                    <p class="desc">Phân loại: ${product.category}</p>
                    <p class="price"><fmt:formatNumber value="${product.price}" type="number" maxFractionDigits="0"/> $</p>
                </div>

                <div class="button-area">
                    <c:choose>
                        <c:when test="${isAdmin}">
                            <div class="btn-group">
                                <form action="${pageContext.request.contextPath}/adminProductAction" method="GET" class="btn-form">
                                    <input type="hidden" name="action" value="editForm">
                                    <input type="hidden" name="productId" value="${product.productID}">
                                    <button type="submit" class="admin-action-btn edit-btn">Sửa</button>
                                </form>
                                
                                <form action="${pageContext.request.contextPath}/adminProductAction" method="POST" class="btn-form">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="productId" value="${product.productID}">
                                    <button type="submit" class="admin-action-btn delete-btn">Xóa</button>
                                </form>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <form action="${pageContext.request.contextPath}/addToCart" method="POST">
                                <input type="hidden" name="productId" value="${product.productID}">
                                <button type="submit" class="add-btn">ĐẶT MUA (Giỏ hàng)</button>
                            </form>
                        </c:otherwise>
                    </c:choose>
                </div>
                
            </div>
        </c:forEach>
    </div>
    
    <p style="text-align: center; margin-top: 30px;"><a href="Home.jsp" style="color: #007bff; text-decoration: none;">&larr; Quay lại Trang chủ</a></p>
</div>

</body>
</html>