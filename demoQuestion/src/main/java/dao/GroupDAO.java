package dao;

import model.Category;
import model.Group;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GroupDAO extends DatabaseConnection{

    private static final String SELECT_ALL_GROUP = "SELECT * FROM `groups_question`";

    public List<Group> getGroups(){
        List<Group> groups = new ArrayList<>();
        try (Connection connection = getConnection();


             PreparedStatement preparedStatement = connection
                     .prepareStatement(SELECT_ALL_GROUP)) {
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {

                groups.add(new Group(rs.getLong("id"), rs.getString("name")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return groups;
    }



}
