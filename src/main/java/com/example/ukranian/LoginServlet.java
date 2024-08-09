package com.example.ukranian;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.*;
import java.util.Properties;

@WebServlet("/Login")

public class LoginServlet extends HttpServlet {
    String url;
    String user;
    String pass;

    private static final long serialVersionUID = 1L;

    private Properties loadDatabaseProperties() {
        Properties props = new Properties();
        try (InputStream in = getClass().getClassLoader().getResourceAsStream("database.properties")) {
            if (in == null) {
                throw new FileNotFoundException("Property file 'database.properties' not found in the classpath");
            }
            props.load(in);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return props;
    }



    @Override
    public void init() throws ServletException {
        try {
            Properties properties = loadDatabaseProperties();
            String driverClassName = properties.getProperty("db.driverClassName");

            if (driverClassName != null && !driverClassName.isEmpty()) {
                Class.forName(driverClassName);
            } else {
                throw new ServletException("Database driver class not specified in properties file.");
            }
        } catch (ClassNotFoundException e) {
            throw new ServletException("JDBC Driver not found", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("homepage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Properties properties = loadDatabaseProperties();
        url = properties.getProperty("db.url");
        user = properties.getProperty("db.username");
        pass = properties.getProperty("db.password");

        System.out.println("Received login request: email=" + email);

        try {
            if (validateLogin(email, password, request)) {
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                System.out.println("Login successful, redirecting to welcome.jsp");
                response.sendRedirect("welcome.jsp");
            } else {
                System.out.println("Invalid login attempt");
                request.setAttribute("errorMessage", "Invalid email or password.");
                request.getRequestDispatcher("homepage.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Unexpected error: " + e.getMessage());
            request.setAttribute("errorMessage", "Unexpected error: " + e.getMessage());
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
        }
    }

    private boolean validateLogin(String email, String password, HttpServletRequest request)
            throws SQLException {
        System.out.println("Connecting to database...");
        try (Connection connection = DriverManager.getConnection(url, user,pass)) {
            String query = "SELECT account_name, amount, currency FROM accounts WHERE email = ? AND password = ?";
            System.out.println("Executing query: " + query);

            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, password);
                System.out.println("Prepared statement parameters set: email=" + email + ", password=" + password);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        String accountName = resultSet.getString("account_name");
                        BigDecimal amount = resultSet.getBigDecimal("amount");
                        String currency = resultSet.getString("currency");

                        HttpSession session = request.getSession();
                        session.setAttribute("accountName", accountName);
                        session.setAttribute("amount", amount);
                        session.setAttribute("currency", currency);

                        System.out.println("Login success: true, accountName: " + accountName + ", amount: " + amount + ", currency: " + currency);
                        return true;
                    } else {
                        System.out.println("Login success: false");
                        return false;
                    }
                }
            }
        }
    }
}
