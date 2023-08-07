package dao;

import model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO extends DatabaseConnection{
    private static final String SELECT_ALL_CATEGORY = "SELECT * FROM `categorys`";

    public List<Category> getCategorys(){
        List<Category> categorys = new ArrayList<>();
        try (Connection connection = getConnection();


             PreparedStatement preparedStatement = connection
                     .prepareStatement(SELECT_ALL_CATEGORY)) {
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
