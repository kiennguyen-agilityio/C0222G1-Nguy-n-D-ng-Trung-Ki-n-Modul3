package controller;

import model.Contract;
import model.ContractDetail;
import service.contract.ContractServiceImpl;
import service.contract.IContractService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ContractDetailServlet", urlPatterns = "/contract_detail")
public class ContractDetailServlet extends HttpServlet {
    private IContractService contractService = new ContractServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "add":
                insertContractDetail(request, response);
                break;
            case "edit":
                break;
            case "delete":
                break;
            case "search":
                break;

        }
    }
    private void insertContractDetail(HttpServletRequest request, HttpServletResponse response) {
        int contractId = Integer.parseInt(request.getParameter("contractId"));
        int attachServiceId = Integer.parseInt(request.getParameter("attachServiceId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        ContractDetail contractDetail = new ContractDetail(contractId, attachServiceId, quantity);

        try {
            contractService.insertContractDetail(contractDetail);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        String mess = "Added successfully";
        request.setAttribute("mess", mess);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/contract_detail/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
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
                break;
            case "delete":
                break;
            case "search":
                break;
        }
    }
    private void showCreationForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/contract_detail/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
