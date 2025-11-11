package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.ProductDAO;
import entity.Product;
import entity.User;

public class AdminProductAction extends ActionSupport {
    private final ProductDAO productDAO = new ProductDAO();

    // Form fields
    private String action; // addForm, editForm, save, delete
    private Integer productId;
    private String name;
    private String description;
    private Double price;
    private String imageUrl;
    private String category;
    private Boolean isSale;

    // Navigation helpers
    public String addForm() {
        if (!isAdmin()) return "forbidden";
        ActionContext.getContext().put("actionType", "Thêm mới");
        return "form";
    }

    public String editForm() {
        if (!isAdmin()) return "forbidden";
        if (productId == null) return ERROR;
        Product product = productDAO.getProductById(productId);
        if (product == null) return ERROR;
        ActionContext.getContext().put("product", product);
        ActionContext.getContext().put("actionType", "Sửa sản phẩm");
        return "form";
    }

    @Override
    public String execute() {
        // Default: route by action param for GET/POST operations
        if (!isAdmin()) return "forbidden";
        if ("delete".equalsIgnoreCase(action)) {
            if (productId == null) return ERROR;
            boolean ok = productDAO.deleteProduct(productId);
            putStatus(ok ? "Đã xóa sản phẩm thành công." : "Lỗi: Không thể xóa sản phẩm.");
            return SUCCESS;
        } else if ("save".equalsIgnoreCase(action)) {
            if (name == null || price == null || category == null) return INPUT;
            boolean sale = Boolean.TRUE.equals(isSale);
            String img = (imageUrl != null && !imageUrl.trim().isEmpty()) ? imageUrl.trim() : null;
            Product p = new Product(0, name, description, price, img, category, sale);
            boolean ok;
            if (productId != null) {
                p.setProductID(productId);
                ok = productDAO.updateProduct(p);
                putStatus(ok ? "Sửa sản phẩm thành công!" : "Lỗi khi sửa sản phẩm.");
            } else {
                ok = productDAO.createProduct(p);
                putStatus(ok ? "Thêm sản phẩm mới thành công!" : "Lỗi: Không thể thêm sản phẩm.");
            }
            return ok ? SUCCESS : INPUT;
        } else if ("addForm".equalsIgnoreCase(action)) {
            ActionContext.getContext().put("actionType", "Thêm mới");
            return "form";
        } else if ("editForm".equalsIgnoreCase(action)) {
            if (productId == null) return ERROR;
            Product product = productDAO.getProductById(productId);
            if (product == null) return ERROR;
            ActionContext.getContext().put("product", product);
            ActionContext.getContext().put("actionType", "Sửa sản phẩm");
            return "form";
        }
        return ERROR;
    }

    private boolean isAdmin() {
        User u = (User) ActionContext.getContext().getSession().get("loggedInUser");
        return u != null && u.getIsAdmin() == 1;
    }

    private void putStatus(String msg) {
        ActionContext.getContext().getSession().put("statusMessage", msg);
    }

    // Getters/Setters for Struts params
    public String getAction() { return action; }
    public void setAction(String action) { this.action = action; }
    public Integer getProductId() { return productId; }
    public void setProductId(Integer productId) { this.productId = productId; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public Boolean getIsSale() { return isSale; }
    public void setIsSale(Boolean isSale) { this.isSale = isSale; }
}
