package com.example.ungdungproductdiscountcalculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculateDiscount", value = "/display-discount")

public class CalculateDiscount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int discountAmount = Integer.parseInt(req.getParameter("discountpercent"));
        float discountPrice = Float.parseFloat(req.getParameter("listprice"));

        float recipeDiscountAmount = (float) (discountAmount * discountPrice * 0.01);

        PrintWriter writer = resp.getWriter();
        writer.println("<html>");
        writer.println("<h1>Discount Amount: " + discountAmount + "</h1>");
        writer.println("<h1>Discount Price: " + discountPrice + "</h1>");
        writer.println("<h1>Recipe Discount Amount: " + recipeDiscountAmount + "</h1>");
        writer.println("</html>");

    }
}
