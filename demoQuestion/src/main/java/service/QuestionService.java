package service;

import dao.QuestionDAO;
import model.Question;
import untils.AppConstant;

import java.util.ArrayList;
import java.util.List;

public class QuestionService {
    private static List<Question> questions;

    private static Long currentId = 0L;

    private static final QuestionService questionService;

    private QuestionDAO questionDAO = new QuestionDAO();

    static {
        questions = new ArrayList<>();
        questionService = new QuestionService();
    }

    public List<Question> getQuestions(){
        return questionDAO.findAll();
    }
    public Question findById(Long id){
        return questionDAO.findById(id)
                .orElseThrow(() ->  new RuntimeException(String.format(AppConstant.ID_NOT_FOUND, "Question")));

    }
    public void create(Question question){

        questionDAO.insertQuestion(question);
//        product.setId(++currentId);
//        products.add(product);
    }
    public static QuestionService getQuestionService() {

        return questionService;
    }

    public void edit(Question question) {

        questionDAO.updateQuestion(question);

    }
    public boolean existById(Long id) {

        return questionDAO.findById(id).orElse(null) != null;

    }
    public void delete(Long questionId) {

        questionDAO.deleteById(questionId);

    }

}
