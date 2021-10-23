package com.example.dd;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "/treatment")
public class TreatmentServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        try {
            if (req.getParameterValues("coord_x").length == 1 && req.getParameterValues("coord_y").length == 1 && req.getParameterValues("radius").length == 1) {
                float x = Float.parseFloat(req.getParameter("coord_x"));
                float y = Float.parseFloat(req.getParameter("coord_y"));
                float r = Float.parseFloat(req.getParameter("radius"));
                System.out.println(validate(x, y, r));
                if (validate(x, y, r)) {
                    getServletContext().getRequestDispatcher("/checkarea").forward(req, resp);
                } else {
                    getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
                }
            } else {
                getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }

    private boolean validate(float x, float y, float r) {
        if (x < -2 || x > 2 || x%0.5!=0) {
            return false;
        } else if (y <= -3 || y >= 3 || Float.toString(y).length()>5) {
            return false;
        } else return (r >= 1) && (r <= 5) && (r%1 == 0);
    }

    public void destroy() {
    }
}