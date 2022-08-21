package controller;

import model.*;
import service.employee.EmployeeServiceImpl;
import service.employee.IEmployeeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    private IEmployeeService employeeService = new EmployeeServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "add":
                insertEmployee(request, response);
                break;
            case "edit":
                updateEmployee(request, response);
                break;
            case "delete":
                break;
            case "search":
                break;

        }
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("position"));
        int degreeId = Integer.parseInt(request.getParameter("degree"));
        int divisionId = Integer.parseInt(request.getParameter("division"));
        String userName = request.getParameter("userName");
        Employee employee = new Employee(id, name, birthday, idCard, salary, phone, email, address, positionId, degreeId, divisionId, userName);
        try {
            employeeService.updateEmployee(employee);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void insertEmployee(HttpServletRequest request, HttpServletResponse response){
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("position"));
        int degreeId = Integer.parseInt(request.getParameter("degree"));
        int divisionId = Integer.parseInt(request.getParameter("division"));
        String userName = request.getParameter("userName");
        User user = new User(userName, "123456");
        Employee employee = new Employee(name, birthday, idCard, salary, phone, email, address, positionId, degreeId, divisionId, userName);
        try {
            employeeService.insertUserName(user);
            employeeService.insertEmployee(employee);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
                deleteEmployee(request, response);
                break;
            case "search":
                search(request,response);
                break;
            default:
                showEmployeeList(request,response);
        }
    }

    private void showEmployeeList(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.selectAllEmployee();
        List<Employee> employees = employeeService.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("employees", employees);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            employeeService.deleteEmployee(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        showEmployeeList(request, response);
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("nameSearch");
        String address = request.getParameter("address");
        List<Employee> employeeList = employeeService.search(name, address);
        List<Employee> employees = employeeService.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("employees", employees);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.selectEmployee(id);
        List<Position> positionList = employeeService.selectAllPosition();
        List<EducationDegree> educationDegreeList = employeeService.selectAllDegree();
        List<Division> divisionList = employeeService.selectAllDivision();
        request.setAttribute("employee", employee);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("divisionList", divisionList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreationForm(HttpServletRequest request, HttpServletResponse response) {
        List<Position> positionList = employeeService.selectAllPosition();
        List<EducationDegree> educationDegreeList = employeeService.selectAllDegree();
        List<Division> divisionList = employeeService.selectAllDivision();
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("divisionList", divisionList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
