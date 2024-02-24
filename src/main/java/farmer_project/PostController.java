package farmer_project;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/addProduct")
public class PostController extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        double price = Double.parseDouble(req.getParameter("price"));
        String desc = req.getParameter("desc");
        String loc = req.getParameter("loc");
        String url = req.getParameter("url");
        HttpSession sess=req.getSession();
        int id=(int) sess.getAttribute("id");
        System.out.println("from servlet class"+ id);
        Product product = new Product();
        ProductCRUD crud = new ProductCRUD();

        product.setName(name);
        product.setQuantity(quantity);
        product.setDesc(desc);
        product.setLoc(loc);
        product.setUrl(url);
        product.setPrice(price);
        product.setFid(id);

        try {
        	System.out.println("from try block");
            int res = crud.postProduct(product);
            System.out.println("after crud operation");
            System.out.println(res);
            if (res != 0) {
                System.out.println("product posted");
                req.getRequestDispatcher("homeFarmer.jsp").forward(req, resp);

            }

        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
}
