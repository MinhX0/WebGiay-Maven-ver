<%-- File: cart.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Giỏ hàng của bạn</title>
    <style>
        /* --- CORE STYLES --- */
        body { font-family: sans-serif; background-color: #f7f7f7; color: #333; margin: 0; }
        .container { 
            width: 90%; 
            max-width: 1000px; 
            margin: 40px auto; 
            padding: 20px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h2 { 
            text-align: center; 
            color: #f44336; 
            margin-bottom: 30px; 
            font-size: 2rem;
            border-bottom: 2px solid #eee;
            padding-bottom: 15px;
        }
        
        /* --- TABLE STYLING --- */
        table {
            width: 100%;
            border-collapse: separate; 
            border-spacing: 0;
            margin-top: 20px;
        }

        th, td {
            padding: 14px 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
            font-size: 0.95rem;
        }

        thead th {
            background-color: #383838;
            color: white;
            font-weight: 600;
            text-transform: uppercase;
        }
        
        tbody tr:nth-child(even) {
            background-color: #fafafa;
        }
        
        .total-row td {
            background-color: #fffde7;
            color: #333;
            font-size: 1.1rem;
            font-weight: bold;
            border-bottom: none;
        }
        
        /* --- BUTTONS AREA --- */
        .action-area {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-top: 30px;
            padding-top: 15px;
            border-top: 1px solid #eee;
        }
        
        .continue-shopping {
            color: #2196f3;
            text-decoration: none;
            margin-right: 20px;
            font-weight: 500;
        }

        .checkout-btn {
            padding: 15px 30px;
            background-color: #ff9800; 
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            text-transform: uppercase;
            cursor: pointer;
            text-decoration: none;
            box-shadow: 0 4px 10px rgba(255, 152, 0, 0.4);
            transition: background-color 0.2s, transform 0.2s;
        }
        
        .checkout-btn:hover {
            background-color: #f57c00;
            transform: translateY(-1px);
        }

    </style>
</head>
<body>
<div class="container">
    <h2>GIỎ HÀNG CỦA BẠN</h2>
    <table border="0">
        <thead>
            <tr>
                <th style="width: 40%;">Sản phẩm</th>
                <th style="width: 15%;">Giá</th>
                <th style="width: 15%;">Số lượng</th>
                <th style="width: 20%;">Tổng cộng</th>
            </tr>
        </thead>
        <tbody>
            <c:set var="cart" value="${sessionScope.cart}" />
            <c:set var="grandTotal" value="${0}" />
            
            <c:choose>
                <c:when test="${empty cart}">
                    <tr><td colspan="4" style="text-align: center; padding: 30px;">Giỏ hàng của bạn hiện đang trống.</td></tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="entry" items="${cart}">
                        <c:set var="item" value="${entry.value}" />
                        <tr>
                            <td>${item.product.name}</td>
                            <td><fmt:formatNumber value="${item.product.price}" type="currency" currencySymbol="$" maxFractionDigits="2"/></td>
                            <td>
                                ${item.quantity}
                            </td>
                            <td><fmt:formatNumber value="${item.totalPrice}" type="currency" currencySymbol="$" maxFractionDigits="2"/></td>
                            <c:set var="grandTotal" value="${grandTotal + item.totalPrice}" />
                        </tr>
                    </c:forEach>
                    <tr class="total-row">
                        <td colspan="3" align="right"><strong>TỔNG THANH TOÁN:</strong></td>
                        <td><strong><fmt:formatNumber value="${grandTotal}" type="currency" currencySymbol="$" maxFractionDigits="2"/></strong></td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
    
    <div class="action-area">
        <a href="Home.jsp" class="continue-shopping">Tiếp tục mua sắm</a>
        <c:if test="${not empty cart}">
            <a href="<%= request.getContextPath() %>/checkout" class="checkout-btn">TIẾN HÀNH THANH TOÁN</a>
        </c:if>
    </div>
</div>
</body>
</html>