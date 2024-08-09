package com.example.ukranian;



import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/Admin")
public class Admin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        try {
            // Obtain the JNDI DataSource from the context.xml
            Context initialContext = new InitialContext();
            Context envContext = (Context) initialContext.lookup("java:/comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/MyDB");
        } catch (NamingException e) {
            throw new ServletException("Cannot retrieve java:/comp/env/jdbc/MyDB", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            if (validateLogin(email, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                System.out.println("Login successful, redirecting to admin_option.jsp");
                response.sendRedirect("admin_option.jsp");
            } else {
                System.out.println("Invalid login attempt");
                request.setAttribute("errorMessage", "Invalid email or password.");
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Unexpected error: " + e.getMessage());
            request.setAttribute("errorMessage", "Unexpected error: " + e.getMessage());
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        }
    }

    private boolean validateLogin(String email, String password) throws SQLException {
        System.out.println("Connecting to database...");

        try (Connection connection = dataSource.getConnection()) {
            String query = "SELECT * FROM sign_up WHERE email = ? AND password = ?";
            System.out.println("Executing query: " + query);

            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, password);
                System.out.println("Prepared statement parameters set: email=" + email + ", password=" + password);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    boolean loginSuccess = resultSet.next();
                    System.out.println("Login success: " + loginSuccess);
                    return loginSuccess;
                }
            }
        }
    }
}
