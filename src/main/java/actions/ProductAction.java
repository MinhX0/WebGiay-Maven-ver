package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.ProductDAO;
import entity.Product;

import java.util.List;
import java.util.Map;

public class ProductAction extends ActionSupport {
    private final ProductDAO productDAO = new ProductDAO();
    private List<Product> productList; // expose via getter if using Struts tags

    @Override
    public String execute() {
        productList = productDAO.getAllProducts();
        // Put into request map so JSTL can access as requestScope.productList
        Map<String, Object> contextMap = ActionContext.getContext().getContextMap();
        Map<String, Object> request = (Map<String, Object>) contextMap.get("request");
        if (request != null) {
            request.put("productList", productList);
            // Expose loggedInUser for admin checks
            Map<String, Object> session = ActionContext.getContext().getSession();
            request.put("loggedInUser", session.get("loggedInUser"));
        } else {
            // Fallback: still expose on the value stack
            ActionContext.getContext().put("productList", productList);
        }
        return SUCCESS;
    }

    public List<Product> getProductList() { return productList; }
}
