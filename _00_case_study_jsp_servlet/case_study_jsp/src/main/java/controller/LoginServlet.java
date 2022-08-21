package controller;

import model.User;
import service.username.IUsernameService;
import service.username.UsernameServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    private IUsernameService usernameService = new UsernameServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "login":
                login(request, response);
                break;
            case "logout":
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) {
        User user = null;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        List<User> userList = usernameService.selectAllUser();
        boolean rememberMe = Boolean.parseBoolean(request.getParameter("rememberMe"));

        for (User item:userList) {
            if (item.getUserName().equals(username) && item.getPassword().equals(password)){
               user = item;
               break;
            }
        }
        if (user != null){
            request.setAttribute("mess", "Login successfully");
            HttpSession session = request.getSession();
            session.setAttribute("userSession", user);

            if (rememberMe) {
                Cookie cookie1 = new Cookie("cookieUsername", user.getUserName());
                cookie1.setMaxAge(120);
                Cookie cookie2 = new Cookie("cookiePassword", user.getPassword());
                cookie2.setMaxAge(120);
                response.addCookie(cookie1);
                response.addCookie(cookie2);
            }
            try {
                response.sendRedirect("/index.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("mess", "Login failed");
            try {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("cookieUsername")) {
                    request.setAttribute("name", cookie.getValue());
                }
                if (cookie.getName().equals("cookiePassword")) {
                    request.setAttribute("pass", cookie.getValue());
                }
            }
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
