package entity;

// Mô hình hóa sản phẩm trong giỏ hàng
public class CartItem {
    private Product product;
    private int quantity;

    public CartItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }
    
    // Getters and Setters
    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    
    // Phương thức tính tổng tiền cho item này
    public double getTotalPrice() {
        return product.getPrice() * quantity;
    }
}