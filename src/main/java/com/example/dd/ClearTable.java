package com.example.dd;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "/clear")
public class ClearTable extends HttpServlet {
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        ServletContext contextServlet = req.getServletContext();
        contextServlet.setAttribute("requestData",null);
        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
