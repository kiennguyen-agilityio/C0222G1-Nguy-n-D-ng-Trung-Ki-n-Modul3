package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();
    private List<Product> productList = productService.findAll();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
                case "details" :
                    getInfoProduct(request,response);
                    break;
            default:
                break;
        }
    }
    private void getInfoProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        request.setAttribute("product",product);
        request.getRequestDispatcher("products/detail.jsp").forward(request,response );
    }
    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = productList.size();
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int status = Integer.parseInt(request.getParameter("status"));
        String dateProduce = request.getParameter("dateProduce");

        Product product = new Product(id, name, price, status, dateProduce);
        this.productService.put(id,product);
        response.sendRedirect("products");
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int status = Integer.parseInt(request.getParameter("status"));
        String dateProduce = request.getParameter("dateProduce");

        Product product = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            product.setName(name);
            product.setPrice(price);
            product.setStatus(status);
            product.setDateProduce(dateProduce);
            this.productService.update(id, product);
            request.setAttribute("products", product);
            request.setAttribute("message", "Customer information was updated");
            dispatcher = request.getRequestDispatcher("products/update.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            this.productService.delete(id);
            try {
                response.sendRedirect("/products");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "details" :
                    getInfoProduct(request,response);
                    break;
            case "search" :
                searchProduct(request,response);
                break;
            default:
                listProduct(request, response);
                break;
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<Product> products = this.productService.search(name);
        request.setAttribute("product",products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("products/search.jsp");
        dispatcher.forward(request, response);
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        List<Product> products = this.productService.findAll();
        request.setAttribute("products", products);

        RequestDispatcher dispatcher = request.getRequestDispatcher("products/showList.jsp");
        dispatcher.forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("products/create.jsp");

        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);

        request.setAttribute("id", product.getId());
        request.setAttribute("name", product.getName());
        request.setAttribute("price", product.getPrice());
        request.setAttribute("status", product.getStatus());
        request.setAttribute("dateProduce", product.getDateProduce());


        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("products", product);
            dispatcher = request.getRequestDispatcher("products/update.jsp");
        }
        dispatcher.forward(request, response);
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("products", product);
            dispatcher = request.getRequestDispatcher("products/delete.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}


