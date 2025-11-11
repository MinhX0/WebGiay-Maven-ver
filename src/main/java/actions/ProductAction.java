package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.ProductDAO;
import entity.Product;

import java.util.List;
import java.util.Map;

public class ProductAction extends ActionSupport {
    private final ProductDAO productDAO = new ProductDAO();

    @Override
    public String execute() {
        // Fetch products
        List<Product> productList = productDAO.getAllProducts();
        Map<String, Object> context = ActionContext.getContext().getContextMap();
        Map<String, Object> request = (Map<String, Object>) context.get("request");
        if (request != null) {
            request.put("productList", productList);
            Map<String,Object> session = ActionContext.getContext().getSession();
            Object user = session.get("loggedInUser");
            request.put("loggedInUser", user);
        } else {
            // Fallback: put in ActionContext so JSP can access via OGNL
            ActionContext.getContext().put("productList", productList);
        }
        return SUCCESS;
    }
}
