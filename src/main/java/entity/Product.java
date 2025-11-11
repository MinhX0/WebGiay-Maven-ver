package entity;

public class Product {
    private int productID;
    private String name;
    private String description;
    private double price;
    private String imageUrl;
    private String category;
    private boolean isSale;

    // Constructors
    public Product() {}
    
    public Product(int productID, String name, String description, double price, String imageUrl, String category, boolean isSale) {
        this.productID = productID;
        this.name = name;
        this.description = description;
        this.price = price;
        this.imageUrl = imageUrl;
        this.category = category;
        this.isSale = isSale;
    }

    // Getters and Setters (Lược bỏ phần code để tiết kiệm không gian)
    public int getProductID() { return productID; }
    public void setProductID(int productID) { this.productID = productID; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public boolean getIsSale() { return isSale; }
    public void setIsSale(boolean isSale) { this.isSale = isSale; }
}