package untils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

public class AppUtil {
    private static final ObjectMapper mapper;
    static {
        mapper = new ObjectMapper();
    }
    public static Object getObject(HttpServletRequest request, Class clazz) {
        // tạo object bằng contructor không tham số.
        Object object;
        try {
            object = clazz.newInstance();
        }catch (Exception e){
            System.out.println(e.getMessage());
            return null;
        }

        java.util.Enumeration<String> paramNames = request.getParameterNames();
        while (paramNames.hasMoreElements()) {
            String paramName = paramNames.nextElement();

            if(AppConstant.ACTION.equals(paramName)){
                continue;
            }
            System.out.println(request.getParameter(paramName));
            // Use reflection to set the parameter value to the corresponding field in the User class
            try {
                // lấy value ra
                String paramValue = mapper.writeValueAsString(request.getParameter(paramName));
                Field field = clazz.getDeclaredField(paramName);
                field.setAccessible(true); // Set accessible, as the fields may be private
                Class<?> fieldType = field.getType();

                var value = mapper.readValue(paramValue,fieldType);
                field.set(object, value);
                //set cho tung field
                // Add more type conversions as needed for other field types (e.g., boolean, double, etc.)
            } catch (NoSuchFieldException | IllegalAccessException | NumberFormatException e) {
                // Handle exceptions as needed
                System.out.println(e.getMessage());
            } catch (JsonProcessingException e) {
                System.out.println(e.getMessage());
            }

        }
        return object;
    }
    public static Object getObjectWithValidation(HttpServletRequest request, Class clazz, Map<String, RunnableCustom> validators) {
        // tạo object bằng contructor không tham số.
        Object object;
        try {
            object = clazz.newInstance();
        }catch (Exception e){
            System.out.println(e.getMessage());
            return null;
        }

        java.util.Enumeration<String> paramNames = request.getParameterNames();
        while (paramNames.hasMoreElements()) {
            String paramName = paramNames.nextElement();

            if(AppConstant.ACTION.equals(paramName)){
                continue;
            }
            System.out.println(request.getParameter(paramName));
            // Use reflection to set the parameter value to the corresponding field in the User class
            try {
                // lấy value ra
                String paramValue = mapper.writeValueAsString(request.getParameter(paramName));
                if (paramName.contains("_")){
                    //handle (xử lý) cho việc object lồng object
                    String[] fields = paramName.split("_");
                    Field field = clazz.getDeclaredField(fields[0]);
                    field.setAccessible(true); // chuyển pulic
                    var fieldType = field.getType();  //class name
                    var objectChild = fieldType.newInstance(); // tạo 1 object
                    field.set(object, objectChild);

                    // Role id của phần trên

                    // phần dưới này lấy field object con

                    Field fieldChild = fieldType.getDeclaredField(fields[1]);
                    fieldChild.setAccessible(true);
                    var value = mapper.readValue(paramValue,fieldChild.getType());
                    fieldChild.set(objectChild, value);
                    continue;

                }
                RunnableCustom validator = validators.get(paramName);
                if(validator != null){
                    validator.setValue(request.getParameter(paramName));
                    validator.run();
                }
                Field field = clazz.getDeclaredField(paramName);
                field.setAccessible(true); // Set accessible, as the fields may be private
                Class<?> fieldType = field.getType();

                var value = mapper.readValue(paramValue,fieldType);
                field.set(object, value);
                //set cho tung field
                // Add more type conversions as needed for other field types (e.g., boolean, double, etc.)
            } catch (NoSuchFieldException | IllegalAccessException | NumberFormatException e) {
                // Handle exceptions as needed
                System.out.println(e.getMessage());
            } catch (JsonProcessingException e) {
                System.out.println(e.getMessage());
            } catch (InstantiationException e) {
                throw new RuntimeException(e);
            }

        }
        return object;
    }

    public static Object getParameterWithDefaultValue(HttpServletRequest request, String name, Object valueDefault){
        String value = request.getParameter(name);
        if(value == null)return valueDefault;
        return value;
    }

    public static <T> void saveObjectToDatabase(Connection connection, String tableName, T object, String... excludedFields) throws SQLException {
        //String... excludedFields: Mảng chuỗi các tên trường (fields) trong đối tượng mà muốn loại trừ không lưu vào cơ sở dữ liệu.
        String sql;
        Field idField; // lưu trữ thông tin trường field(id) của object
        try {
            idField = object.getClass().getDeclaredField("id"); // lấy thông tin field có tên (id) trong đối tượng
            idField.setAccessible(true); // Cho phép truy cập vào trường "id" dù nó có mức độ truy cập private
            Long idValue = (Long) idField.get(object);
            if (idValue != null) {
                sql = buildUpdateSql(tableName, object, excludedFields); //Gọi phương thức buildUpdateSql để xây dựng câu lệnh SQL cho việc cập nhật dữ liệu.
            } else {                                                    //Nếu giá trị "id" trong đối tượng là null, tức là đối tượng chưa tồn tại trong cơ sở dữ liệu,
                // ta sẽ xây dựng câu lệnh SQL cho việc chèn dữ liệu mới vào.
                sql = buildInsertSql(tableName, object, excludedFields);
            }
        } catch (NoSuchFieldException | IllegalAccessException e) {
            e.printStackTrace();
            return;
        }
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            int parameterIndex = 1;
            Field[] fields = object.getClass().getDeclaredFields(); // lấy danh sách các field
            for (Field field : fields) {
                String fieldName = field.getName(); // lay tên field hiện tại
                if (fieldName.equals("serialVersionUID") || isExcluded(fieldName, excludedFields)) {
                    continue; // check tên trường hiện tại có nằm trong field bị loại trừ không
                }
                field.setAccessible(true);
                Class<?> fieldType = field.getType(); // lấy kiểu dữ liệu hiện tại của field trong object
                try {
                    Object value = field.get(object); // lấy giá trị hiện tại của field
                    preparedStatement.setObject(parameterIndex, value); // sét giá trị tham số trong sql
                    parameterIndex++;
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
            if (sql.contains("UPDATE")) { // kiểm tra sql có chứa "UPDATE' không, nếu có thì tức là câu lệnh cập nhật
                // Set the id value for the WHERE clause in the UPDATE statement
                preparedStatement.setLong(parameterIndex, (Long) idField.get(object));
            }
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private static String buildInsertSql(String tableName, Object object, String... excludedFields) {
        // dùng stringbuider để chèn dữ liệu vào cơ sở dữ liệu
        StringBuilder sql = new StringBuilder("INSERT INTO " + tableName + " (");
        Field[] fields = object.getClass().getDeclaredFields();
        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i]; // lấy field hiện tại của vòng lặp
            String fieldName = field.getName();
            if (fieldName.equals("serialVersionUID") || fieldName.equals("id") || isExcluded(fieldName, excludedFields)) {
                continue;
            }
            sql.append(camelCaseToSnakeCase(fieldName));
            if (i < fields.length - 1) { // check field hiện tại có phải là field cuối cùng trong ds field không
                sql.append(","); // nếu không phải là field cuối cùng thì thêm "," để phân tách các field trong sql
            }
        }
        sql.append(") VALUES (");
        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];
            String fieldName = field.getName();
            if (fieldName.equals("serialVersionUID") || fieldName.equals("id") || isExcluded(fieldName, excludedFields)) {
                continue;
            }
            sql.append("?");
            if (i < fields.length - 1) {
                sql.append(",");
            }
        }
        sql.append(")");
        return sql.toString();
    }
    private static String buildUpdateSql(String tableName, Object object, String... excludedFields) {
        StringBuilder sql = new StringBuilder("UPDATE " + tableName + " SET ");
        Field[] fields = object.getClass().getDeclaredFields();
        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];
            String fieldName = field.getName();

            if (fieldName.equals("serialVersionUID") || fieldName.equals("id") || isExcluded(fieldName, excludedFields)) {
                //chek serialVersionUID và id có nằm trong field bị loaij tru không
                continue;
            }
            sql.append(camelCaseToSnakeCase(fieldName)).append("=?");
            // nối 1 field vào sql. chuyển từ viết hoa sang viết thường. ? đại diện cho value đc truyền vào sql
            if (i < fields.length - 1) {
                sql.append(",");
            }
        }
        sql.append(" WHERE (id = ?)");
        return sql.toString();
    }
    private static boolean isExcluded(String fieldName, String[] excludedFields) {
        for (String excludedField : excludedFields) {
            if (excludedField.equals(fieldName)) {
                return true;
            }
        }
        return false;
    }
    public static String camelCaseToSnakeCase(String camelCase) {
        return camelCase.replaceAll("(.)(\\p{Upper})", "$1_$2").toLowerCase();
    }
}
