package controller;

import model.Stock;
import service.PaymentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "WebShopServlet", urlPatterns = {"/shop"}, loadOnStartup = 1)
public class WebShopServlet extends HttpServlet {

    private Stock stock;

    @Override
    public void init() throws ServletException {
        stock = new Stock();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("shop", stock.getItems());
        request.getRequestDispatcher("shop.jsp").forward(request, response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id").replace("/", ""));

        if(action.equals("add")){
            PaymentService.cart.add(stock.getItem(id));
        }
        else if (action.equals("del")){
            PaymentService.cart.remove(stock.getItem(id));
        }

        doGet(request, response);

    }

}


