package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import model.ELever;
import model.Question;
import service.CategoryService;
import service.GroupService;
import service.QuestionService;
import untils.AppConstant;
import untils.AppUtil;
import untils.RunnableCustom;
import untils.RunnableWithRegex;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@WebServlet(name = "QuestionServlet", urlPatterns = "/questions")
public class QuestionServlet extends HttpServlet {
    private final String PAGE = "questions"; // đặt hằng số

    private Map<String, RunnableCustom> validators;

    private final Map<String, String> errors = new HashMap<>();
    private CategoryService categoryService;

    @Override
    public void init() {
        validators = new HashMap<>();

        validators.put("name", new RunnableWithRegex("^[A-Za-z ]{6,20}", "name", errors));

    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter(AppConstant.ACTION);

        if(Objects.equals(action, AppConstant.EDIT)){
            showEdit(req,resp);
            return;
        }
        if (Objects.equals(action, AppConstant.CREATE)) {
            showCreate(req, resp);
            return;
        }
        if (Objects.equals(action, AppConstant.DELETE)) {
            delete(req, resp);
            return;
        }
        showList(req, resp);

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        errors.clear(); // clear lỗi cũ
        String action = req.getParameter(AppConstant.ACTION); // lấy action
        if (Objects.equals(action, AppConstant.CREATE)) {
            //kiểm tra xem action = create thi call create
            create(req, resp);
            return;
        }
        if (Objects.equals(action, AppConstant.EDIT)) {
            //kiểm tra xem action = create thi call edit
            edit(req, resp);
            return;
        }
        showList(req, resp);
    }
    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.setAttribute("pageable", request);
        req.setAttribute("questions", QuestionService.getQuestionService().getQuestions());
        req.setAttribute("questionsJSON", new ObjectMapper().writeValueAsString(QuestionService.getQuestionService().getQuestions()));
        req.setAttribute("message", req.getParameter("message")); // gửi qua message để toastr show thông báo
        req.setAttribute("categorysJSON", new ObjectMapper().writeValueAsString(CategoryService.getCategorys()));
        req.setAttribute("leverJSON", new ObjectMapper().writeValueAsString(ELever.values()));
        req.setAttribute("groupsJSON", new ObjectMapper().writeValueAsString(GroupService.groupServices()));
        req.getRequestDispatcher(PAGE + AppConstant.LIST_PAGE).forward(req,resp);
    }
    private void showCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("questionJSON", new ObjectMapper().writeValueAsString(new Question())); // gửi qua user rỗng để JS vẻ lên trang web
        req.setAttribute("categorysJSON", new ObjectMapper().writeValueAsString(CategoryService.getCategorys()));
        req.setAttribute("groupsJSON", new ObjectMapper().writeValueAsString(GroupService.groupServices()));
        req.setAttribute("leverJSON", new ObjectMapper().writeValueAsString(ELever.values()));
        req.getRequestDispatcher(PAGE + AppConstant.CREATE_PAGE)
                .forward(req,resp);
    }

    private void showEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.valueOf(req.getParameter("id"));
        if(checkIdNotFound(req, resp, id)) return;
        req.setAttribute("question", QuestionService.getQuestionService().findById(id)); // gửi user để jsp check xem edit hay là create User
        req.setAttribute("questionJSON", new ObjectMapper().writeValueAsString(QuestionService.getQuestionService().findById(id))); // gửi qua user được tìm thấy bằng id để JS vẻ lên trang web
        req.setAttribute("categorysJSON", new ObjectMapper().writeValueAsString(CategoryService.getCategorys()));
        req.setAttribute("groupsJSON", new ObjectMapper().writeValueAsString(GroupService.groupServices()));
        req.setAttribute("leverJSON", new ObjectMapper().writeValueAsString(ELever.values()));
        req.getRequestDispatcher(PAGE + AppConstant.CREATE_PAGE)
                .forward(req,resp);

    }
    private void create(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Question question = getValidQuestion(req,resp); // lấy ra user và + xử lý cho việc validation của các field trong class User.
        if(errors.size() == 0){ //không xảy lỗi (errors size == 0) thì mình mới tạo user.
            QuestionService.getQuestionService().create(question);
            resp.sendRedirect("/questions?message=Created");
        }

    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Question question = getValidQuestion(req,resp); // lấy ra user và + xử lý cho việc validation của các field trong class User.
        if(errors.size() == 0){ //không xảy lỗi (errors size == 0) thì mình mới sửa user.
            QuestionService.getQuestionService().edit(question);
            resp.sendRedirect("/questions?message=Edited");
        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.valueOf(req.getParameter("id"));
        if(checkIdNotFound(req, resp, id)) return;
        QuestionService.getQuestionService().delete(id);
        resp.sendRedirect(PAGE + "?message=Deleted");
    }

    private boolean checkIdNotFound(HttpServletRequest req, HttpServletResponse resp, Long id) throws IOException{
        if(!QuestionService.getQuestionService().existById(id)){
            resp.sendRedirect(PAGE + "?message=Id not found");
            return true;
        }
        return false;
    }

    private Question getValidQuestion(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Question question = (Question) AppUtil.getObjectWithValidation(req, Question.class,  validators); //
        if(errors.size() > 0){
            req.setAttribute("questionJSON", new ObjectMapper().writeValueAsString(question)); //hiểu dòng đơn giản là muốn gửi data qua JS thì phải xài thằng này  new ObjectMapper().writeValueAsString(question).
            req.setAttribute("categorysJSON", new ObjectMapper().writeValueAsString(CategoryService.getCategorys()));
            req.setAttribute("groupsJSON", new ObjectMapper().writeValueAsString(GroupService.groupServices()));
            req.setAttribute("leverJSON", new ObjectMapper().writeValueAsString(ELever.values()));
            req.setAttribute("message","Something was wrong");
            req.getRequestDispatcher(PAGE + AppConstant.CREATE_PAGE)
                    .forward(req,resp);
        }
        return question;
    }


}
