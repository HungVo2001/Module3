package service;

import dao.DatabaseConnection;
import dao.ProductDAO;
import model.Category;
import model.Product;
import service.dto.PageableRequest;
import untils.AppConstant;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductService{
    private static List<Product> products;

    private static Long currentId = 0L;

    private static final ProductService productService;

    private ProductDAO productDAO = new ProductDAO();

    static {
        products = new ArrayList<>();
//        products.add(new Product(++currentId, "Hung",100, 50, new Category(1,"ACTION"),"adsfdsfdfds",  Date.valueOf("1994-07-29"), "dfgdfgdfgdfd"));
//        products.add(new Product(++currentId, "Hung",100, 50, new Category(1,"ACTION"),"adsfdsfdfds",  Date.valueOf("1994-07-29"), "dfgdfgdfgdfd"));
//        products.add(new Product(++currentId, "Hung",100, 50, new Category(1,"ACTION"),"adsfdsfdfds",  Date.valueOf("1994-07-29"), "dfgdfgdfgdfd"));
        productService = new ProductService();
    }

    public List<Product> getProducts(PageableRequest request){
        return productDAO.findAll(request);
    }
    public Product findById(Long id){
        return productDAO.findById(id)
                .orElseThrow(() ->  new RuntimeException(String.format(AppConstant.ID_NOT_FOUND, "Product")));

//        return products.stream()
//                .filter(product -> Objects.equals(product.getId(), id)) // lọc qua list products với điều kiện là user id == id truyền vào
//                .findFirst() // lấy phần tử tìm thấy đầu tiên
//                .orElseThrow(() ->  new RuntimeException(String.format(AppConstant.ID_NOT_FOUND, "Product")));
        //nếu không tìm thấy thì trả ra lỗi
    }

    public void create(Product product){

        productDAO.insertProduct(product);
//        product.setId(++currentId);
//        products.add(product);
    }

    public static ProductService getProductService() {

        return productService;
    }
    private ProductService(){

    }

    public void edit(Product product) {

        productDAO.updateProduct(product);
//        for (var item : products){
//            if(item.getId().equals(product.getId())){
//                item.setTitle(product.getTitle());
//                item.setPublish(product.getPublish());
//                item.setDescription(product.getDescription());
//                item.setAuthor(product.getAuthor());
//                item.setCategory(product.getCategory());
//            }
//        }
    }
    public boolean existById(Long id) {

        return productDAO.findById(id).orElse(null) != null;
//        for (var product : products){
//            if(Objects.equals(id, product.getId())){
//                return true;
//            }
//        }
//        return false;
    }
    public void delete(Long productId) {

        productDAO.deleteById(productId);
//        products = products
//                .stream()
//                .filter(product -> !Objects.equals(product.getId(), productId))
//                .collect(Collectors.toList());
    }

}
