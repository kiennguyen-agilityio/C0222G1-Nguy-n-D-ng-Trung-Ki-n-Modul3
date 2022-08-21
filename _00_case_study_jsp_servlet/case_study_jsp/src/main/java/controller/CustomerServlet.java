package controller;

import model.Customer;
import model.CustomerType;
import service.customer.CustomerServiceImpl;
import service.customer.CustomerTypeServiceImpl;
import service.customer.ICustomerService;
import service.customer.ICustomerTypeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@javax.servlet.annotation.WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends javax.servlet.http.HttpServlet {
    private ICustomerService customerService = new CustomerServiceImpl();
    private static ICustomerTypeService customerTypeService = new CustomerTypeServiceImpl();

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {
        String action =request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "add":
                insertCustomer(request, response);
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            case "delete":
                break;
            case "search":
                break;
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        String mess = "";
        String id = request.getParameter("id");
        if (!customerService.checkRegexId(id)){
            mess = "Please input the right format KH-XXXX, X is a number";
        }
        int typeId = Integer.parseInt(request.getParameter("type"));
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idcard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(id, typeId, name, birthday, gender, idCard, phone, email, address);
        try {
            customerService.updateCustomer(customer);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response){
        List<Customer> customerList =customerService.selectAllCustomer();
        String id = request.getParameter("id");
        for (Customer customer: customerList) {
            if (id.equals(customer.getId())){
                String messId = "Please input again, this id is already taken";
                forward(request, response, messId);
                break;
            }
        }
        if (!customerService.checkRegexId(id)){
           String messId = "Please input the right format KH-XXXX, X is a number";
            forward(request, response, messId);
        }
        int typeId = Integer.parseInt(request.getParameter("type"));
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idcard");
        if (!customerService.checkRegexId(id)){
            String messIdCard = "Please input 9 numbers";
            forward(request, response, messIdCard);
        }
        String phone = request.getParameter("phone");
        if (!customerService.checkRegexId(id)){
            String messPhone = "Please input the right phone number";
            forward(request, response, messPhone);
        }
        String email = request.getParameter("email");
        if (!customerService.checkRegexId(id)){
            String messEmail = "Please input the right email format";
            forward(request, response, messEmail);
        }
        String address = request.getParameter("address");
        Customer customer = new Customer(id, typeId, name, birthday, gender, idCard, phone, email, address);
        try {
            customerService.insertCustomer(customer);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static void forward(HttpServletRequest request, HttpServletResponse response, String mess){
        request.setAttribute("mess", mess);
        List<CustomerType> customerTypeList = customerTypeService.selectAllCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {
        String action =request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "add":
                showCreationForm(request,response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            case "search":
                search(request,response);
                break;
            case "active":
                showActiveCustomerList(request, response);
                break;
            default:
                showCustomerList(request,response);
        }
    }

    private void showActiveCustomerList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList =customerService.selectAllActiveCustomer();
        List<Customer> customers = customerService.selectAllActiveCustomer();
        request.setAttribute("customerList", customerList);
        request.setAttribute("customers", customers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/active-customer-list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("nameSearch");
        String address = request.getParameter("address");
        List<Customer> customerList = customerService.search(name,address);
        List<Customer> customers = customerService.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        request.setAttribute("customers", customers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCustomerList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList =customerService.selectAllCustomer();
        List<Customer> customers = customerService.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        request.setAttribute("customers", customers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        try {
            customerService.deleteCustomer(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        showCustomerList(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Customer customer = customerService.selectCustomer(id);
        List<CustomerType> customerTypeList = customerTypeService.selectAllCustomerType();
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        request.setAttribute("customer", customer);
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreationForm(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = customerTypeService.selectAllCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
