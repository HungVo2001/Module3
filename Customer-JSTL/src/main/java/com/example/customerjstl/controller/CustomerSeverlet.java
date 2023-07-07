package com.example.customerjstl.controller;

import com.example.customerjstl.model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerSeverlet", value = "/customer")
public class CustomerSeverlet extends HttpServlet {
    private String message;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customer> customers = new ArrayList<>();
        customers.add(new Customer("Bé Đạt", "19-9-2000", "28 NTP", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYWEVasM61jRwsG4sd5zCW9EeWw4E2ViPz7w&usqp=CAU"));
        customers.add(new Customer("Bé Huy", "20-9-2000", "29 NTP", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrK-1BzyeBwNzLRtN9ABE0cfdoknS5UQBzoTOPQOofJYLK2NZrXpvj2gB7zsbKgiVrAfw&usqp=CAU"));
        customers.add(new Customer("Bé Béo", "21-9-2000", "30 NTP", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdTbR19pXYQ7vJnrz6iQN3CXJUmW0yvcXRiw&usqp=CAU"));
        customers.add(new Customer("Bé Nhân", "22-9-2000", "31 NTP", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIQaKufB7Xg8cskd-6dziQhenJYg2IbtBVIw&usqp=CAU"));
        req.setAttribute("customers", customers);
        req.getRequestDispatcher("/customer.jsp").forward(req,resp);
    }

    @Override
    public void destroy() {

    }
}
