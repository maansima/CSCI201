package Test;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("uname");
		String password = request.getParameter("pword");
		int result = 0;
		String nextPage = "/index.jsp";
		DatabaseHelper dh = new DatabaseHelper();
		System.out.print("Login" + username);
		if( (username!=null && !(username.equals("")) && (password!=null && !(password.equals(""))) )) {
			try {
				result = dh.validateLogin(username, password);
			} catch (SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());
			}
			
			if(result == 1)
			{
				request.getSession().setAttribute("login", true);
				request.setAttribute("logincheck", "Success");
				nextPage = "/index.jsp";
			}
			else if( result == 2)
			{
				request.getSession().setAttribute("login", false);
				request.setAttribute("logincheck", "Error: Incorrect Password");
				nextPage = "/login.jsp";
			}
			else 
			{
				request.getSession().setAttribute("login", false);
				request.setAttribute("logincheck", "Error: Incorrect Username");
				nextPage = "/login.jsp";
			}
		}
		else
		{
			request.getSession().setAttribute("login", false);
			request.setAttribute("logincheck", "Error: Please don't leave any fields blank");
			nextPage = "/login.jsp";
		}
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}