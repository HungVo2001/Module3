package service;

import dao.CategoryDAO;
import dao.ProductDAO;
import model.Category;
import model.Product;
import untils.AppConstant;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class CategoryService {

    public static List<Category> getCategorys(){
        return new CategoryDAO().getCategorys();
    }

}
