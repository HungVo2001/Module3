package dao;


import model.Category;
import model.Product;
import service.dto.PageableRequest;
import service.dto.enums.ESortType;

import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ProductDAO extends DatabaseConnection{
    private final String SELECT_ALL_PRODUCTS = "SELECT p.*,c.name category_name  FROM `products` p LEFT JOIN " +
            "`categorys` c on p.category_id = c.id  WHERE p.`name` like '%s' OR p.`price` LIKE '%s' Order BY %s %s LIMIT %s OFFSET %s";

    private final String SELECT_TOTAL_RECORDS = "SELECT COUNT(1) as cnt  FROM `products` p LEFT JOIN " +
            "`categorys` c on p.category_id = c.id  WHERE p.`name` like '%s' OR p.`price` LIKE '%s'";
    private final String UPDATE_PRODUCTS = "UPDATE `products` SET `name` = ?, `price` = ?, `quantity` = ?, `category_id` = ?, `avarta` = ?, `description` = ?, `create_at` = ? WHERE (`id` = ?);";

    private final String INSERT_PRODUCTS = "INSERT INTO `products` (`name`, `price`, `quantity`, `category_id`, `avarta`, `description`, `create_at`) \n" +
            "VALUES (?, ?, ?, ?, ?, ?, ?)";
    private final String FIND_BY_ID = "SELECT p.*,c.name category_name  FROM " +
            "`products` p LEFT JOIN `categorys` c on p.category_id = c.id WHERE p.`id` = ?"; // show Edit

    private final String DELETE_BY_ID = "DELETE FROM `products` WHERE (`id` = ?)";

    public List<Product> findAll(PageableRequest request) {
        List<Product> products = new ArrayList<>();
        String search = request.getSearch();
        if(request.getSortField() == null){
            request.setSortField("id");
        }
        if(request.getSortType() == null){
            request.setSortType(ESortType.DESC);
        }
        if(search == null){
            search = "%%";
        }else {
            search = "%" + search + "%";
        }
        var offset = (request.getPage() - 1) * request.getLimit();
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(String.format(SELECT_ALL_PRODUCTS, search, search,
                             request.getSortField(), request.getSortType(), request.getLimit(), offset))) {

            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            //

            while (rs.next()) {

                products.add(getProductByResultSet(rs));
            }
            PreparedStatement statementTotalRecords = connection
                    .prepareStatement(String.format(SELECT_TOTAL_RECORDS, search, search));
            ResultSet resultSetOfTotalRecords = statementTotalRecords.executeQuery();
            if(resultSetOfTotalRecords.next()){
                int totalPage =
                        (int) Math.ceil(resultSetOfTotalRecords.getDouble("cnt")/request.getLimit());
                request.setTotalPage(totalPage);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }
    public void insertProduct(Product product){
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(INSERT_PRODUCTS)) {
            System.out.println(preparedStatement);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setFloat(2,product.getPrice());
            preparedStatement.setInt(3,product.getQuantity());
            preparedStatement.setLong(4,product.getCategory().getId());
            preparedStatement.setString(5,product.getAvatar());
            preparedStatement.setString(6,product.getDescription());
            preparedStatement.setTimestamp(7,Timestamp.valueOf(LocalDateTime.now()));
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    private Product getProductByResultSet(ResultSet rs) throws SQLException {
        Long id = rs.getLong("id");
        String name = rs.getString("name");
        Float price = rs.getFloat("price");
        int quantity = rs.getInt("quantity");
        String description = rs.getString("description");
        String avatar = rs.getString("avarta");
        String create_at = rs.getString("create_at");
        String categoryName = rs.getString("category_name");
        Long categoryId = rs.getLong("category_id");
        Category category = new Category(categoryId, categoryName);
        return new Product(id, name, price, quantity, category, description, Date.valueOf(create_at), avatar);
    }
    public void updateProduct(Product product) {
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(UPDATE_PRODUCTS)) {
            System.out.println(preparedStatement);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setFloat(2,product.getPrice());
            preparedStatement.setInt(3,product.getQuantity());
            preparedStatement.setLong(4,product.getCategory().getId());
            preparedStatement.setString(5,product.getAvatar());
            preparedStatement.setString(6,product.getDescription());
            preparedStatement.setTimestamp(7,Timestamp.valueOf(LocalDateTime.now()));
            preparedStatement.setLong(8,product.getId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public Optional<Product> findById(Long id) {
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(FIND_BY_ID)) {
            preparedStatement.setLong(1, id);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return Optional.of(getProductByResultSet(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return Optional.empty();
    }

    public void deleteById(Long id) {
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(DELETE_BY_ID)) {
            preparedStatement.setLong(1, id);
            System.out.println(preparedStatement);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
