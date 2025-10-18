package ex;

import java.util.List;
import java.util.Map;

public class Product {
    private String sellerId;
    private String name;
    private String category;
    private String registerDate;
    private int price;
    private List<String> options;
    private List<Map<String,String>> images;
    private List<Map<String,String>> detailImages;

    public Product(String sellerId, String name, String category, String registerDate, int price,
                   List<String> options, List<Map<String,String>> images, List<Map<String,String>> detailImages) {
        this.sellerId = sellerId;
        this.name = name;
        this.category = category;
        this.registerDate = registerDate;
        this.price = price;
        this.options = options;
        this.images = images;
        this.detailImages = detailImages;
    }

    public String getSellerId() { return sellerId; }
    public String getName() { return name; }
    public String getCategory() { return category; }
    public String getRegisterDate() { return registerDate; }
    public int getPrice() { return price; }
    public List<String> getOptions() { return options; }
    public List<Map<String,String>> getImages() { return images; }
    public List<Map<String,String>> getDetailImages() { return detailImages; }
}
