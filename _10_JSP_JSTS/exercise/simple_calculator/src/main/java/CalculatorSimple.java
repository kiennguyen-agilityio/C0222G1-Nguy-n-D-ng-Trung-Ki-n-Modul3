

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorSimple" ,value = "/calculator")
public class CalculatorSimple extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       float number1 = Float.parseFloat(request.getParameter("number1"));
       float number2 = Float.parseFloat(request.getParameter("number2"));
       float result = 0;
       String operator = request.getParameter("operator");

       switch (operator){
           case "Addition":
               result = number1+number2;
               break;
           case "Subtraction":
               result=number1-number2;
               break;
           case "Multiplication":
               result= number1*number2 ;
               break;
           case "Division" :
               result=number1/number2;
       }
       request.setAttribute("number1",number1);
       request.setAttribute("number2",number2);
       request.setAttribute("result",result);
       request.setAttribute("operator", operator);
       request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}