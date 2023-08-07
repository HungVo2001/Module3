package service;

import dao.CategoryDAO;
import model.Category;

import java.util.List;

public class CategoryService {

    public static List<Category> getCategorys(){
        return new CategoryDAO().getCategorys();
    }
}
