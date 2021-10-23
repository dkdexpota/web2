package com.example.dd;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "/checkarea")
public class CheckAreaServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        float x = Float.parseFloat(req.getParameter("coord_x"));
        float y = Float.parseFloat(req.getParameter("coord_y"));
        float r = Float.parseFloat(req.getParameter("radius"));
        boolean check = false;
        if (x>=0 && y<=0 && x<=r && y>=-r) {
            check = true;
        } else if (x<0 && y<0 && Math.sqrt(x*x+y*y)<=r) {
            check = true;
        } else if (x>=0 && y>=0 && y<=(r-2*x)) {
            check = true;
        }

        ServletContext contextServlet = req.getServletContext();
        com.example.dd.RequestDataList requestDataList = (com.example.dd.RequestDataList) contextServlet.getAttribute("requestData");
        if (requestDataList == null) requestDataList = new com.example.dd.RequestDataList();
        com.example.dd.RequestData requestData = new com.example.dd.RequestData();
        requestData.setX(x);
        requestData.setY(y);
        requestData.setR(r);
        requestData.setCheck(check);

        requestDataList.addData(requestData);
        contextServlet.setAttribute("requestData", requestDataList);
        getServletContext().getRequestDispatcher("/resul.jsp").forward(req, resp);


    }

    private void result (com.example.dd.RequestData requestData, HttpServletResponse resp) throws IOException {

    }
}
