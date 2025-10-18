package ex;

public class Option {
    private String optionId;
    private String name;
    private String detail;
    private int price;
    private int quantity;

    public Option(String optionId, String name, String detail, int price, int quantity){
        this.optionId = optionId;
        this.name = name;
        this.detail = detail;
        this.price = price;
        this.quantity = quantity;
    }

    // Getter / Setter
    public String getOptionId() { return optionId; }
    public void setOptionId(String optionId) { this.optionId = optionId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDetail() { return detail; }
    public void setDetail(String detail) { this.detail = detail; }

    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
}
