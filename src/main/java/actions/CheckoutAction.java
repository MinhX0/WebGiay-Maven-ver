package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;

/**
 * Simple checkout action to validate input and clear cart.
 */
public class CheckoutAction extends ActionSupport {
    private String address;
    private String paymentMethod;
    private String cardNumber;
    private String expiry;
    private String cvv;

    @Override
    public String execute() {
        // Basic validation: address required
        if (isBlank(address)) {
            addActionError("Vui lòng nhập địa chỉ giao hàng.");
            return INPUT;
        }

        if ("CARD".equalsIgnoreCase(paymentMethod)) {
            if (isBlank(cardNumber) || isBlank(expiry) || isBlank(cvv)) {
                addActionError("Vui lòng nhập đầy đủ thông tin thẻ.");
                return INPUT;
            }
        }

        // Simulate order placing: clear cart in session
        Map<String,Object> session = ActionContext.getContext().getSession();
        session.remove("cart");
        ActionContext.getContext().put("orderStatus", "Đơn hàng đã được đặt thành công!");

        return SUCCESS;
    }

    private boolean isBlank(String s) { return s == null || s.trim().isEmpty(); }

    // Getters/Setters (Struts uses these to populate fields)
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public String getCardNumber() { return cardNumber; }
    public void setCardNumber(String cardNumber) { this.cardNumber = cardNumber; }

    public String getExpiry() { return expiry; }
    public void setExpiry(String expiry) { this.expiry = expiry; }

    public String getCvv() { return cvv; }
    public void setCvv(String cvv) { this.cvv = cvv; }
}
