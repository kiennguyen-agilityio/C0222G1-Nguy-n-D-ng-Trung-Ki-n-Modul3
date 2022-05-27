package controller;

import models.ListCustomerModels;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ListCustomer", urlPatterns = "/list")
public class ListCustomerController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ListCustomerModels[] listCustomerModels = new ListCustomerModels[4];
        listCustomerModels[0] = new ListCustomerModels("Kiên", "12/04/1999", "Quảng Nam", "https://cdnimg.vietnamplus.vn/uploaded/bokttj/2022_03_10/aldrin_apollo.jpg");
        listCustomerModels[1] = new ListCustomerModels("Hảo", "13/05/1999", "Đà Nẵng", "https://cdn.nguyenkimmall.com/images/detailed/555/may-anh-cho-nguoi-moi.jpg");
        listCustomerModels[2] = new ListCustomerModels("Đạt", "14/06/1999", "Quảng Trị", "https://img.websosanh.vn/v2/users/review/images/4wvuq0i4ozs1q.jpg?compress=85");
        listCustomerModels[3] = new ListCustomerModels("Duy", "15/07/1999", "Huế", "https://mimosawedding.net/wp-content/uploads/2020/05/cach-cam-may-anh-chuyen-nghiep-4.jpg");
        request.setAttribute("listCustomer", listCustomerModels);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
