package dao;

import model.Category;
import model.ELever;
import model.Group;
import model.Question;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class QuestionDAO extends DatabaseConnection{

    private final String SELECT_ALL_QUESTIONS = "SELECT q.*, g.name as group_name, c.name as category_name\n" +
            "FROM questions q\n" +
            "inner join groups_question g on q.group_id = g.id\n" +
            "inner join categorys c on q.category_id = c.id";


//    private final String SELECT_TOTAL_RECORDS = "SELECT COUNT(1) as cnt  FROM `products` p LEFT JOIN " +
//            "`categorys` c on p.category_id = c.id  WHERE p.`name` like '%s' OR p.`price` LIKE '%s'";
    private final String UPDATE_QUESTIONS = "UPDATE `questions` SET `name` = ?, `create_at` = ?, `lever_point` = ?, `count_true` = ?, `count_false` = ?, `category_id` = ?, `group_id` = ? WHERE (`id` = ?);";

    private final String INSERT_QUESTIONS = "INSERT INTO `questions` (`name`, `create_at`, `lever_point`, `count_true`, `count_false`, `category_id`, `group_id`) \n" +
            "VALUES (?, ?, ?, ?, ?, ?, ?)";
    private final String FIND_BY_ID = "SELECT q.*, g.name as group_name, c.name as category_name FROM questions q inner join groups_question g on q.group_id = g.id inner join categorys c on q.category_id = c.id where q.id = ?";

    private final String DELETE_BY_ID = "DELETE FROM `questions` WHERE (`id` = ?)";

    public List<Question> findAll() {
        List<Question> questions = new ArrayList<>();
        try (Connection connection = getConnection();


             PreparedStatement preparedStatement = connection
                     .prepareStatement(SELECT_ALL_QUESTIONS)) {
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {

                questions.add(getQuestionByResultSet(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return questions;
    }

    private Question getQuestionByResultSet(ResultSet rs) throws SQLException {
        Long id = rs.getLong("id");
        String name = rs.getString("name");
        String lever = rs.getString("lever_point");
        String countTrue = rs.getString("count_true");
        String countFalse = rs.getString("count_false");
        String create_at = rs.getString("create_at");
        String categoryName = rs.getString("category_name");
        Long categoryId = rs.getLong("category_id");
        Category category = new Category(categoryId, categoryName);
        String groupName = rs.getString("group_name");
        Long groupId = rs.getLong("group_id");
        Group group = new Group(groupId, groupName);
        return new Question(id, name, Date.valueOf(create_at), ELever.valueOf(lever),countTrue, countFalse, category, group);
    }

    public void insertQuestion(Question question){
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(INSERT_QUESTIONS)) {
            System.out.println(preparedStatement);
            preparedStatement.setString(1,question.getName());
            preparedStatement.setTimestamp(2,Timestamp.valueOf(LocalDateTime.now()));
            preparedStatement.setString(3,question.getLever().toString());
            preparedStatement.setString(4,question.getCountTrue());
            preparedStatement.setString(5,question.getCountFalse());
            preparedStatement.setLong(6,question.getCategory().getId());
            preparedStatement.setLong(7,question.getGroup().getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateQuestion(Question question) {
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(UPDATE_QUESTIONS)) {
            System.out.println(preparedStatement);
            preparedStatement.setString(1,question.getName());
            preparedStatement.setTimestamp(2,Timestamp.valueOf(LocalDateTime.now()));
            preparedStatement.setString(3,question.getLever().toString());
            preparedStatement.setString(4,question.getCountTrue());
            preparedStatement.setString(5,question.getCountFalse());
            preparedStatement.setLong(6,question.getCategory().getId());
            preparedStatement.setLong(7,question.getGroup().getId());
            preparedStatement.setLong(8,question.getId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public Optional<Question> findById(Long id) {
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(FIND_BY_ID)) {
            preparedStatement.setLong(1, id);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return Optional.of(getQuestionByResultSet(rs));
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
