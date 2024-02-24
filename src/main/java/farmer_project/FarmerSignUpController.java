package farmer_project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/FarmerSignUpController")
public class FarmerSignUpController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String role=req.getParameter("role");
		System.out.println(role);
		System.out.println("reaches.............");
		if(role!=null) {
			if(role.equals("farmer")) {
				signupFamer(req,resp);
			}else if(role.equals("buyer")) {
				System.out.println(role);
				System.out.println("reaches.............");
				signUpBuyer(req, resp);
			}
		}
		
	}

	public void signUpBuyer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String email = req.getParameter("email");
		long phone = Long.parseLong(req.getParameter("phone"));
		String address = req.getParameter("address");
		String password = req.getParameter("password");
		String role="buyer";

		BuyerCRUD crud = new BuyerCRUD();

		Buyer buyer = new Buyer();

		buyer.setFname(fname);
		buyer.setLname(lname);
		buyer.setEmail(email);
		buyer.setAddress(address);
		buyer.setPhone(phone);
		buyer.setPassword(password);
		buyer.setRole(role);

		try {
			int res = crud.signUp(buyer);

			if (res != 0) {
				
				//req.setAttribute("message","user registered successfully....");
//				HttpSession session=req.getSession();
//				session.setAttribute("user", buyer);
				req.getRequestDispatcher("login.jsp").forward(req, resp);

			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void signupFamer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String email = req.getParameter("email");
		long phone = Long.parseLong(req.getParameter("phone"));
		String address = req.getParameter("address");
		String password = req.getParameter("password");
		String role="farmer";


		FarmerCRUD crud = new FarmerCRUD();

		Farmer farmer = new Farmer();

		farmer.setFname(fname);
		farmer.setLname(lname);
		farmer.setEmail(email);
		farmer.setAddress(address);
		farmer.setPhone(phone);
		farmer.setPassword(password);
		farmer.setRole(role);
		

		try {
			int res = crud.signUp(farmer);

			if (res != 0) {
				
//				req.setAttribute("message","user registered successfully....");
				
//				HttpSession session=req.getSession();
//				session.setAttribute("user", farmer);
				req.getRequestDispatcher("login.jsp").forward(req, resp);

			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	

}
