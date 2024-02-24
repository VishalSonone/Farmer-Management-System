package farmer_project;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/login")
public class LoginController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("from login controller");
		long phone=Long.parseLong(req.getParameter("phone"));
		String password=req.getParameter("password");
		
			FarmerCRUD crud=new FarmerCRUD();
			try {
				ResultSet set=crud.login(phone);
				if(set.next()) {
					String dbpassword=set.getString("password");
					String role=set.getString("role");
					int id=set.getInt("id");
					HttpSession session = req.getSession();

					if(dbpassword.equals(password)) {
						System.out.println("password matched");

						if(role.equals("farmer")) {
							System.out.println("farmer logged in");
							//req.setAttribute("message","login successful....");
							//req.setAttribute("id",id);
							System.out.println("hello");
							System.out.println(id);
							session.setAttribute("id", id);
							req.getRequestDispatcher("homeFarmer.jsp").forward(req, resp);
						}else if(role.equals("buyer")) {
							System.out.println("buyer logged in");
							//req.setAttribute("id",id);

							//req.setAttribute("message","login successful....");
							session.setAttribute("id",id);
							req.getRequestDispatcher("buyerhome.jsp").forward(req, resp);
						}
					}else {
						System.out.println("invalid password");

						req.setAttribute("message","invalid password");
					}
					
				}else {
					System.out.println("user not found");

					req.setAttribute("message", "user not found.Kindly Register");
					req.getRequestDispatcher("signup.jsp").forward(req, resp);
				}
				
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		
		
		
		
	}

}
