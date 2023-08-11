package dao;

import model.Category;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


public class CategoryDAO extends DatabaseConnection{
    private static final String SELECT_ALL_PRODUCTS_CATEGORY = "SELECT * FROM `categorys`";
    private static final String FIND_BY_ID = "SELECT * FROM categorys where id = ?";

//    public List<Category> findAll() {
//        //để hiện thị các option theo role mà mình muốn
//        List<Category> categorys = new ArrayList<>();
//        try (Connection connection = getConnection();
//
//             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
//             PreparedStatement preparedStatement = connection
//                     .prepareStatement(SELECT_ALL_PRODUCTS_CATEGORY)) {
//            System.out.println(preparedStatement);
//
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()) {
//
//                categorys.add(getCategoryByResultSet(rs));
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return categorys;
//    }
//
//    private Category getCategoryByResultSet(ResultSet rs) throws SQLException {
//        int idCate = rs.getInt("id");
//        String name = rs.getString("name");
//         return new Category(idCate, name);
//    }
//
//
//    public Category findById(int id) {
//        try {
//            Connection connection = getConnection();
//            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
//
//            System.out.println("FindById: " + preparedStatement);
//            preparedStatement.setInt(1, id);
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()){
//                int idCate = rs.getInt("id");
//                String nameCate = rs.getString("name");
//
//                return new Category(idCate, nameCate);
//
//            }
//        }catch (SQLException e){
//            throw new RuntimeException(e);
//        }
//        return null;
//    }
public List<Category> getCategorys(){
    List<Category> categorys = new ArrayList<>();
    try (Connection connection = getConnection();

         // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
         PreparedStatement preparedStatement = connection
                 .prepareStatement(SELECT_ALL_PRODUCTS_CATEGORY)) {
        System.out.println(preparedStatement);

        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {

            categorys.add(new Category(rs.getLong("id"), rs.getString("name")));
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
    return categorys;
}

}
