import java.io.IOException;
import java.io.PrintWriter;

@javax.servlet.annotation.WebServlet(name = "ServletDiscountProduct",urlPatterns = "/product")
public class ServletDiscountProduct extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
      String description = request.getParameter("description");
      float price=Float.parseFloat(request.getParameter("price"));
      int discount_percent=Integer.parseInt(request.getParameter("discount"));
      float discount = (float) (price*discount_percent*0.01);
      float total=price-discount;
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1> Product Description"+ description);
        writer.println("<h1> Product Price"+ price );
        writer.println("<h1> Product Discount Percent"+ discount_percent);
        writer.println("<h1> Product Description"+ discount);
        writer.println("<h1> Product Description"+ total);
        writer.println("</html>");
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
