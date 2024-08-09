package com.example.ukranian;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

@WebServlet("/submit_account")
public class submit_account extends HttpServlet {

    private Properties loadDatabaseProperties() throws IOException {
        Properties properties = new Properties();
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("database.properties")) {
            if (input == null) {
                throw new IOException("Sorry, unable to find database.properties");
            }
            properties.load(input);
        }
        return properties;
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
        } catch (ClassNotFoundException | IOException e) {
            throw new ServletException("Failed to load JDBC driver", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountType = request.getParameter("accountType");
        String accountName = request.getParameter("accountName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String amount = request.getParameter("amount").replace(",", "");
        BigDecimal amountBig = new BigDecimal(amount);
        String currency = request.getParameter("currency");

        Properties properties = loadDatabaseProperties();
        String url = properties.getProperty("db.url");
        String user = properties.getProperty("db.username");
        String pass = properties.getProperty("db.password");

        try (Connection connection = DriverManager.getConnection(url, user, pass)) {
            String sql = "INSERT INTO accounts (account_name, email, password, amount, currency) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, accountName);
                preparedStatement.setString(2, email);
                preparedStatement.setString(3, password);
                preparedStatement.setBigDecimal(4, amountBig);
                preparedStatement.setString(5, currency);
                preparedStatement.executeUpdate();
            }
            request.setAttribute("successMessage", "Account created successfully!");
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
