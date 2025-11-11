package dao;

import entity.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private DBContext dbContext = new DBContext();
    
    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM Product";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT * FROM Product WHERE productID = ?";
    private static final String DELETE_PRODUCT_SQL = "DELETE FROM Product WHERE productID = ?";
    private static final String INSERT_PRODUCT_SQL = 
        "INSERT INTO Product (name, description, price, imageUrl, category, isSale) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_PRODUCT_SQL = 
        "UPDATE Product SET name = ?, description = ?, price = ?, imageUrl = ?, category = ?, isSale = ? WHERE productID = ?";

    // 1. CREATE (Thêm mới)
    public boolean createProduct(Product product) {
        try (Connection connection = dbContext.getConnection();
             PreparedStatement ps = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
            
            // 1. name (VARCHAR NOT NULL)
            ps.setString(1, product.getName());
            // 2. description (VARCHAR)
            ps.setString(2, product.getDescription());
            // 3. price (DECIMAL NOT NULL)
            ps.setDouble(3, product.getPrice()); 
            // 4. imageUrl (VARCHAR)
            ps.setString(4, product.getImageUrl());
            // 5. category (VARCHAR NOT NULL)
            ps.setString(5, product.getCategory()); 
            // 6. isSale (BOOLEAN)
            ps.setBoolean(6, product.getIsSale()); 
            
            // Nếu ps.executeUpdate() trả về 0, nghĩa là INSERT thất bại
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            // Đây là nơi lỗi SQL xảy ra (ví dụ: duplicate key, NOT NULL violation)
            System.err.println("SQL ERROR - Không thể thêm sản phẩm:");
            e.printStackTrace();
            return false;
        }
    }

    // 2. READ (Lấy tất cả)
    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        try (Connection connection = dbContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS)) {
            
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("productID"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setImageUrl(rs.getString("imageUrl"));
                product.setCategory(rs.getString("category"));
                product.setIsSale(rs.getBoolean("isSale"));
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }
    
    // 3. READ (Lấy theo ID)
    public Product getProductById(int productId) {
        // (Logic lấy sản phẩm theo ID giữ nguyên, đã có ở câu trả lời trước)
        Product product = null;
        try (Connection connection = dbContext.getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_PRODUCT_BY_ID)) {
            
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                product = new Product();
                product.setProductID(rs.getInt("productID"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setImageUrl(rs.getString("imageUrl"));
                product.setCategory(rs.getString("category"));
                product.setIsSale(rs.getBoolean("isSale"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    // 4. UPDATE (Sửa)
    public boolean updateProduct(Product product) {
        try (Connection connection = dbContext.getConnection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_PRODUCT_SQL)) {
            
            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getImageUrl());
            ps.setString(5, product.getCategory());
            ps.setBoolean(6, product.getIsSale());
            ps.setInt(7, product.getProductID()); 

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 5. DELETE (Xóa)
    public boolean deleteProduct(int productId) {
        try (Connection connection = dbContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT_SQL)) {
            
            preparedStatement.setInt(1, productId);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}