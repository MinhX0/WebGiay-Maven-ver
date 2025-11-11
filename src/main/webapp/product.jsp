<%-- File: product.jsp (Form Admin Thêm/Sửa) --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>${actionType} - Admin</title>
    <style>
        /* CSS Tối giản cho form Admin */
        body { font-family: sans-serif; background-color: #f4f4f4; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .form-container { width: 90%; max-width: 600px; background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); }
        .form-container h2 { color: #f44336; margin-bottom: 25px; text-align: center; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; }
        .form-group input[type="text"], .form-group input[type="number"], .form-group textarea, .form-group select { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; }
        .checkbox-group { display: flex; align-items: center; }
        .checkbox-group input { margin-right: 10px; }
        .btn-submit { background-color: #4CAF50; color: white; padding: 12px; border: none; border-radius: 4px; cursor: pointer; width: 100%; font-weight: bold; margin-top: 20px; }
    </style>
</head>
<body>

<div class="form-container">
    <h2>${actionType}</h2>
    
    <c:set var="p" value="${requestScope.product}" />
    
    <form action="adminProductAction" method="POST">
        <input type="hidden" name="action" value="save">
        
        <c:if test="${p != null}">
            <input type="hidden" name="productId" value="${p.productID}">
        </c:if>

        <div class="form-group">
            <label for="name">Tên sản phẩm:</label>
            <input type="text" id="name" name="name" value="${p.name}" required>
        </div>
        
        <div class="form-group">
            <label for="price">Giá ($):</label>
            <input type="number" id="price" name="price" step="0.01" value="${p.price}" required>
        </div>
        
        <div class="form-group">
            <label for="category">Danh mục:</label>
            <select id="category" name="category" required>
                <option value="NIKE" ${p.category == 'NIKE' ? 'selected' : ''}>NIKE</option>
                <option value="ADIDAS" ${p.category == 'ADIDAS' ? 'selected' : ''}>ADIDAS</option>
                <option value="NEW" ${p.category == 'NEW' ? 'selected' : ''}>Mới (NEW)</option>
            </select>
        </div>
        
        <div class="form-group">
            <label for="imageUrl">URL Ảnh:</label>
            <input type="text" id="imageUrl" name="imageUrl" value="${p.imageUrl}">
        </div>
        
        <div class="form-group">
            <label for="description">Mô tả:</label>
            <textarea id="description" name="description">${p.description}</textarea>
        </div>
        
        <div class="form-group checkbox-group">
            <input type="checkbox" id="isSale" name="isSale" ${p.isSale ? 'checked' : ''}>
            <label for="isSale">Đang Sale</label>
        </div>
        
        <button type="submit" class="btn-submit">Lưu Sản Phẩm</button>
        <p style="text-align: center; margin-top: 10px;"><a href="products">Hủy và quay lại danh sách</a></p>
    </form>
</div>

</body>
</html>