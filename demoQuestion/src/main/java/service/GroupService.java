package service;

import dao.CategoryDAO;
import dao.GroupDAO;
import model.Category;
import model.Group;

import java.util.List;

public class GroupService {

    public static List<Group> groupServices(){
        return new GroupDAO().getGroups();
    }

}
