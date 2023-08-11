package model;

import java.sql.Date;

public class Product {
    private long id;
    private String name;
    private float price;
    private int quantity;
    private Category category;

    private String description;

    private Date create_at;
    private String avatar;



    public Product() {
    }

    public Product(long id, String name, float price, int quantity, Category category, String description, Date create_at, String avatar) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
        this.description = description;
        this.create_at = create_at;
        this.avatar = avatar;
    }
    public Product(long id, String name, float price, int quantity, String description, Date create_at, String avatar) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.create_at = create_at;
        this.avatar = avatar;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreate_at() {
        if(create_at == null) return "";
        return create_at.toString();
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
