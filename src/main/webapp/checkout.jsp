<%-- File: checkout.jsp --%>
    <%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <title>Thanh toán</title>
            <style>
                /* --- CORE STYLES --- */
                body {
                    font-family: sans-serif;
                    background-color: #f7f7f7;
                    color: #333;
                    margin: 0;
                }

                .container {
                    width: 90%;
                    max-width: 600px;
                    margin: 40px auto;
                    padding: 30px;
                    background: white;
                    border-radius: 12px;
                    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
                }

                h2 {
                    text-align: center;
                    color: #2196f3;
                    margin-bottom: 30px;
                    font-size: 2rem;
                }

                h3 {
                    border-bottom: 2px solid #f44336;
                    padding-bottom: 10px;
                    margin-bottom: 20px;
                    color: #f44336;
                    font-size: 1.3rem;
                }

                /* Form và Input */
                input[type="text"],
                input[type="password"] {
                    width: 100%;
                    padding: 12px;
                    margin: 8px 0;
                    border: 1px solid #ccc;
                    border-radius: 6px;
                    box-sizing: border-box;
                    font-size: 1rem;
                }

                /* Khu vực Mã QR và Thẻ */
                .qr-code-display,
                .card-info {
                    border: 2px solid #4CAF50;
                    /* Border xanh lá */
                    padding: 20px;
                    border-radius: 10px;
                    text-align: center;
                    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
                    margin-top: 25px;
                }

                .visible {
                    display: block;
                }

                .hidden {
                    display: none;
                }

                /* Nút Hoàn tất */
                .submit-checkout-btn {
                    margin-top: 30px;
                    padding: 15px;
                    background: #2196f3;
                    color: white;
                    border: none;
                    border-radius: 6px;
                    width: 100%;
                    font-weight: bold;
                    cursor: pointer;
                    transition: background-color 0.2s;
                }

                .submit-checkout-btn:hover {
                    background: #1a75c0;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <h2>THÔNG TIN THANH TOÁN & GIAO HÀNG</h2>

                <%@ taglib prefix="s" uri="/struts-tags" %>
                <s:actionerror cssStyle="color:#f44336; font-weight:bold;"/>
                <form action="<%= request.getContextPath() %>/checkout" method="POST">

                    <h3>Địa chỉ giao hàng</h3>
                    <input type="text" name="address" placeholder="Nhập địa chỉ cần ship đến" required>

                    <h3>Chọn Phương thức thanh toán</h3>
                    <div>
                        <input type="radio" id="qr" name="paymentMethod" value="QR" onclick="showPaymentFields('qr')">
                        <label for="qr">Thanh toán bằng Mã QR</label><br>

                        <input type="radio" id="card" name="paymentMethod" value="CARD"
                            onclick="showPaymentFields('card')" checked>
                        <label for="card">Thanh toán bằng Thẻ (VISA/Mastercard)</label>
                    </div>

                    <div id="qr-fields" class="qr-code-display hidden">
                        <p style="font-weight: bold; color: #333;">Vui lòng quét mã QR sau để thanh toán:</p>
                        <img src="https://scontent.fhan5-9.fna.fbcdn.net/v/t39.30808-6/572086455_798538696431516_6206690782596310534_n.jpg?stp=dst-jpg_s640x640_tt6&_nc_cat=110&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeHCauvut8g9JOrCPxOWFkQYueYiVpjjcby55iJWmONxvN-JYO4_pUB2Q7lB_NXfh6Q2VMurypP1BBkaMD0geb_R&_nc_ohc=EO3hJ-m8aQwQ7kNvwHGjrSS&_nc_oc=AdllvCYDR7VZKTxTHqHchgwinurrPD5CdUnjNC4jSkDRJ9yQLKGsduwqNwWWW41i8gc&_nc_zt=23&_nc_ht=scontent.fhan5-9.fna&_nc_gid=m-knVhwc3x1pQyd-1ON2SQ&oh=00_Afel2KgPpY7491qB0OmLMPSbXTVzRcU229oAmMpyqXlKAg&oe=6907AB63"
                            alt="Mã QR thanh toán"
                            style="width: 200px; height: 200px; border: 4px solid #fff; padding: 5px; background: white; display: block; margin: 10px auto; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">

                        <p style="font-size: 0.9rem; color: #f44336; margin-top: 10px;">
                            ⚠️ Mã QR này là mã mẫu, không có giá trị thanh toán thực tế.
                        </p>
                    </div>

                    <div id="card-fields" class="card-info visible">
                        <label style="display: block; text-align: left; margin-bottom: 5px;">Số thẻ:</label><input
                            type="text" name="cardNumber" placeholder="XXXX XXXX XXXX XXXX"><br>
                        <label style="display: block; text-align: left; margin-bottom: 5px;">Ngày hết hạn:</label><input
                            type="text" name="expiry" placeholder="MM/YY"><br>
                        <label style="display: block; text-align: left; margin-bottom: 5px;">CVV:</label><input
                            type="password" name="cvv" placeholder="***">
                    </div>

                    <button type="submit" class="submit-checkout-btn">HOÀN TẤT ĐẶT HÀNG</button>
                </form>
            </div>

            <script>
                function showPaymentFields(method) {
                    document.getElementById('qr-fields').classList.remove('visible');
                    document.getElementById('card-fields').classList.remove('visible');
                    document.getElementById('qr-fields').classList.add('hidden');
                    document.getElementById('card-fields').classList.add('hidden');

                    if (method === 'qr') {
                        document.getElementById('qr-fields').classList.add('visible');
                        document.getElementById('qr-fields').classList.remove('hidden');
                    } else if (method === 'card') {
                        document.getElementById('card-fields').classList.add('visible');
                        document.getElementById('card-fields').classList.remove('hidden');
                    }
                }
                // Khởi tạo trạng thái ban đầu
                document.addEventListener('DOMContentLoaded', () => showPaymentFields('card')); 
            </script>
        </body>

        </html>