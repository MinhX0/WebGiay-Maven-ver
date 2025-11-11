package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.ProductDAO;
import entity.CartItem;
import entity.Product;

import java.util.HashMap;
import java.util.Map;

public class AddToCartAction extends ActionSupport {
    private int productId;
    private final ProductDAO productDAO = new ProductDAO();

    @Override
    public String execute() {
        if (productId <= 0) {
            return ERROR;
        }
        Product product = productDAO.getProductById(productId);
        if (product == null) {
            return ERROR;
        }
        Map<String,Object> session = ActionContext.getContext().getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.get("cart");
        if (cart == null) {
            cart = new HashMap<>();
            session.put("cart", cart);
        }
        CartItem item = cart.get(productId);
        if (item == null) {
            cart.put(productId, new CartItem(product, 1));
        } else {
            item.setQuantity(item.getQuantity() + 1);
        }
        return SUCCESS;
    }

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }
}
