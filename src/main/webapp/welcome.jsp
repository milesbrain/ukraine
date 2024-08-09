<%@ page import="java.math.BigDecimal" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="" rel="stylesheet" type="text/css">
    <title>Bank Account Dashboard</title>
    <style>
        /* General Reset and Styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }

        .header {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #1a2a6c;
            /* Navy Blue */
            color: white;
            padding: 10px 20px;
            width: 100%;
        }

        .header-content {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
        }

        .header h2 {
            margin: 0;
            font-size: 20px;
        }

        .toggle-button {
            background: none;
            border: 1px solid #1a2a6c;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            color: #1a2a6c;
            /* Navy Blue */
            display: flex;
            align-items: center;
            padding: 5px 10px;
            font-weight: bold;
            transition: background-color 0.3s, transform 0.3s;
        }

        .toggle-button:hover {
            background-color: #1a2a6c;
            color: white;
            transform: scale(1.05);
        }

        .toggle-icon {
            transition: transform 0.3s;
            margin-right: 8px;
            font-weight: bold;
        }

        .container {
            display: flex;
            flex-direction: column;
            padding: 10px;
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .accounts-history-wrapper {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }

        .accounts-section,
        .account-history-section {
            width: 48%;
        }

        .account-card {
            background-color: #fff;
            padding: 15px;
            border-radius: 8px;
            border-left: 4px solid #1a2a6c;
            /* Navy Blue */
        }

        .account-name {
            font-weight: bold;
            margin-bottom: 5px;
            color: #1a2a6c;
            /* Navy Blue */
        }

        .user-name h4 {
            font-size: 1.2em;
            color: #1a2a6c;
            /* Navy Blue */
            font-style: italic; /* Change the font style if needed */
        }

        .account-amount {
            font-size: 1.5em;
            color: #1a2a6c;
            /* Navy Blue */
        }

        .account-history-section {
            background-color: #fff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
            max-height: 300px;
            /* Adjust this as needed */
        }
        .account-balance {
            font-size: 0.9em; /* Smaller font size */
            color: black;     /* Black color */
            margin-bottom: 5px; /* Space between balance and amount */
        }

        .account-amount {
            font-size: 1.5em; /* Larger font size for the amount */
            font-weight: bold;
            color: #1a2a6c;
        }

        .account-summary {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            font-size: 0.9em;
            color: #1a2a6c;
            /* Navy Blue */
        }

        .transaction-list {
            list-style: none;
            padding: 0;
        }

        .transaction {
            display: flex;
            justify-content: space-between;
            padding: 5px 0;
            border-bottom: 1px solid #ddd;
            font-size: 0.85em;
        }

        .transaction.date {
            font-weight: bold;
            padding-top: 10px;
        }
        /* Navigation Buttons */

        .navigation {
            margin-top: 10px;
        }

        .navigation a {
            display: block;
            width: 100%;
            text-align: left;
            padding: 10px 10px;
            margin-bottom: 8px;
            background-color: #1a2a6c;
            /* Navy Blue */
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 0.9em;
        }

        .transaction a {
            display: flex;
            justify-content: space-between;
            text-decoration: none;
            color: #1a2a6c;
            /* Navy Blue */
        }

        .transaction a:hover {
            text-decoration: underline;
        }
        /* Transfer Section */

        .transfer-section {
            margin-top: 20px;
            background-color: #fff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .transfer-section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .transfer-section-header h2 {
            margin: 0;
            font-size: 1.2em;
            color: #1a2a6c;
            font-weight: bold;
        }

        .filter-options {
            display: flex;
            align-items: center;
        }

        .filter-options p {
            margin: 0;
            margin-right: 10px;
            font-size: 0.9em;
            color: #333;
        }

        .icon-button {
            background: none;
            border: none;
            cursor: pointer;
            margin-left: 5px;
            font-size: 1.2em;
            color: #1a2a6c;
            /* Navy Blue */
        }

        .transfers {
            margin-top: 10px;
        }

        .transfer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }

        .transfer-logo img {
            width: 40px;
            height: 40px;
        }

        .transfer-details {
            display: flex;
            justify-content: space-between;
            width: 70%;
        }

        .transfer-details div {
            text-align: left;
        }

        .transfer-number {
            font-weight: bold;
            color: #e74c3c;
            /* Red */
        }
        /* Responsive Styles */

        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                align-items: flex-start;
            }
            .accounts-history-wrapper {
                flex-direction: column;
            }
            .accounts-section,
            .account-history-section {
                width: 100%;
            }
            .transfer-details {
                flex-direction: column;
                align-items: flex-start;
                width: 50%;
            }
        }
    </style>
</head>
<body>
<div class="header">
    <div class="header-content">
        <a class="logo" href="${pageContext.request.contextPath}/ufcu2014/">
            <img src="${pageContext.request.contextPath}/css/LoginLogo.aspx" alt="">
        </a>
    </div>
</div>

<div class="accounts-history-wrapper">
    <div class="accounts-section" id="accounts-section">
        <div class="account-card">
            <div class="account-info">
                <%
                    String accountName = (String) session.getAttribute("accountName");
                    BigDecimal amount = (BigDecimal) session.getAttribute("amount");
                    String currency = (String) session.getAttribute("currency");
                %>
                <div class="account-name">PERSONAL CHECKING *0001</div>
                <div class="user-name">
                    <h6>Welcome,</h6>
                    <h4><%= accountName %>!</h4>
                </div>
                <div class="account-balance">
                    <h6>Account Balance</h6>
                </div>
                <div class="account-amount">
                    <%= currency %> <%= amount != null ? String.format("%,.2f", amount) : "0.00" %>
                </div>
            </div>
            <nav class="navigation">
                <a href="${pageContext.request.contextPath}/TriggerAlertServlet" class="action-button">Heating Gas</a>
                <a href="${pageContext.request.contextPath}/TriggerAlertServlet" class="action-button">Scheduled</a>
                <a href="${pageContext.request.contextPath}/TriggerAlertServlet" class="action-button">Transfers</a>
                <a href="${pageContext.request.contextPath}/TriggerAlertServlet" class="action-button">Electricity</a>
                <a href="${pageContext.request.contextPath}/TriggerAlertServlet" class="action-button">Tax Online</a>
                <a href="${pageContext.request.contextPath}/TriggerAlertServlet" class="action-button">Exchange</a>
            </nav>
        </div>
    </div>

    <div class="account-history-section" id="account-history-section">
        <div class="account-summary">
            <button class="toggle-button" id="toggle-transfers">
                <span class="toggle-icon" id="transfer-toggle-icon">▼</span> <strong>Hide History</strong>
            </button>
            <h6><strong>Transaction History</strong></h6>
        </div>
        <ul class="transaction-list" id="transaction-list">

            <li class="transaction">
                <a href="#">
                    <span>WALGREENS SAN FRANCISCO CA</span>
                    <span>-$4.33</span>
                </a>
            </li>
            <li class="transaction">
                <a href="#">
                    <span>Check#12345: Check #1</span>
                    <span>-$500.00</span>
                </a>
            </li>
            <li class="transaction">
                <a href="#">
                    <span>STARBUCKS NEW YORK NY</span>
                    <span>-$7.25</span>
                </a>
            </li>
            <li class="transaction">
                <a href="#">
                    <span>AMAZON.COM SEATTLE WA</span>
                    <span>-$35.00</span>
                </a>
            </li>
            <li class="transaction">
                <a href="#">
                    <span>GROCERY STORE CHICAGO IL</span>
                    <span>-$200.00</span>
                </a>
            </li>
            <li class="transaction">
                <a href="#">
                    <span>SUBSCRIPTION SERVICE</span>
                    <span>-$12.99</span>
                </a>
            </li>
            <li class="transaction">
                <a href="#">
                    <span>WALGREENS SAN FRANCISCO CA</span>
                    <span>-$4.33</span>
                </a>
            </li>
            <li class="transaction">
                <a href="#">
                    <span>Check#12345: Check #1</span>
                    <span>-$10.00</span>
                </a>
            </li>
            <li class="transaction date">Dec 1,2020</li>
            <li class="transaction">
                <a href="#">
                    <span>COLE HAAN-SAN FRANCISCO SAN FRANCISCO CA</span>
                    <span>-$85.00</span>
                </a>
            </li>
            <li class="transaction">
                <a href="#">
                    <span>SUBWAY 003019680 SAN FRANCISCO CA</span>
                    <span>-$5.17</span>
                </a>
            </li>
            <li class="transaction">
                <a href="#">
                    <span>USPS.COM CLICK1061WASHINGTON DC</span>
                    <span>-$13.80</span>
                </a>
            </li>
            <li class="transaction">
                <a href="#">
                    <span>TRADER JOE'S #078 QSAN FRANCISCO CA</span>
                    <span>-$14.08</span>
                </a>
            </li>
            <li class="transaction date">Nov 30,2020</li>
            <li class="transaction">
                <a href="#">
                    <span>BURGER JOINT 4 0003 SAN FRANCISCO CA</span>
                    <span>-$9.71</span>
                </a>
            </li>
            <li class="transaction">
                <a href="#">
                    <span>COMCAST CALIFORNIA 800-COMCAST CA</span>
                    <span>-$164.67</span>
                </a>
            </li>
            <li class="transaction">
                <a href="#">
                    <span>SAFEWAY STORE 2606 SAN FRANCISCO CA</span>
                    <span>-$14.08</span>
                </a>
            </li>
            <li class="transaction date">Nov 19,2020</li>
            <li class="transaction">
                <a href="#">
                    <span>CAFE - PACIFIC SHORES - REDWOOD CITY CA</span>
                    <span>-$2.22</span>
                </a>
            </li>
            <li class="transaction">
                <a href="#">
                    <span>PAMF CUSTOMER SERVICSALT LAKE CITY UT</span>
                    <span>-$8.00</span>
                </a>
            </li>
            <li class="transaction">
                <a href="#">
                    <span>CAFE - PACIFIC SHORES - REDWOOD CITY CA</span>
                    <span>-$6.08</span>
                </a>
            </li>
        </ul>
    </div>
</div>

<section class="transfer-section">
    <div class="transfer-section-header">
        <h2>Latest Transfers</h2>
        <div class="filter-options">
            <p>Filter selected: more than 100 $</p>
            <button class="icon-button">
                <i class="ph-funnel"></i>
            </button>
            <button class="icon-button">
                <i class="ph-plus"></i>
            </button>
        </div>
    </div>
    <div class="transfers">
        <div class="transfer">
            <div class="transfer-logo">
                <img src="https://assets.codepen.io/285131/apple.svg" alt="Apple Inc." />
            </div>
            <dl class="transfer-details">
                <div>
                    <dt>Apple Inc.</dt>
                    <dd>Apple ID Payment</dd>
                </div>
                <div>
                    <dt>4012</dt>
                    <dd>Last four digits</dd>
                </div>
                <div>
                    <dt>28 Oct. 21</dt>
                    <dd>Date payment</dd>
                </div>
            </dl>
            <div class="transfer-number">
                - $ 550
            </div>
        </div>
        <div class="transfer">
            <div class="transfer-logo">
                <img src="https://assets.codepen.io/285131/pinterest.svg" alt="Pinterest" />
            </div>
            <dl class="transfer-details">
                <div>
                    <dt>Pinterest</dt>
                    <dd>2 year subscription</dd>
                </div>
                <div>
                    <dt>5214</dt>
                    <dd>Last four digits</dd>
                </div>
                <div>
                    <dt>26 Oct. 21</dt>
                    <dd>Date payment</dd>
                </div>
            </dl>
            <div class="transfer-number">
                - $ 120
            </div>
        </div>
        <div class="transfer">
            <div class="transfer-logo">
                <img src="https://assets.codepen.io/285131/warner-bros.svg" alt="Warner Bros." />
            </div>
            <dl class="transfer-details">
                <div>
                    <dt>Warner Bros.</dt>
                    <dd>Cinema</dd>
                </div>
                <div>
                    <dt>2228</dt>
                    <dd>Last four digits</dd>
                </div>
                <div>
                    <dt>22 Oct. 2020</dt>
                    <dd>Date payment</dd>
                </div>
            </dl>
            <div class="transfer-number">
                - $ 70
            </div>
        </div>
    </div>
</section>

<script>
    function formatBalance(balance, currency) {
        let formatter = new Intl.NumberFormat('en-US', {
            style: 'currency',
            currency: currency,
            minimumFractionDigits: 2,
        });
        return formatter.format(balance);
    }

    document.addEventListener('DOMContentLoaded', function () {
        let balanceElement = document.getElementById('account-balance');
        let balance = parseFloat(balanceElement.getAttribute('data-balance'));
        let currency = balanceElement.getAttribute('data-currency');
        balanceElement.innerText = formatBalance(balance, currency);
    });
    window.onload = function() {
        var showAlert = "<%= request.getAttribute("showAlert") != null ? request.getAttribute("showAlert").toString() : "false" %>";
        if (showAlert === "true") {
            alert("Your account is dormant. Please take the necessary actions.");
        }
    };
    document.getElementById("toggle-transfers").addEventListener("click", function() {
        const transactionList = document.getElementById("transaction-list");
        const toggleIcon = document.getElementById("transfer-toggle-icon");
        const toggleButton = this;

        if (transactionList.style.display === "none") {
            transactionList.style.display = "block";
            toggleIcon.textContent = "▼";
            toggleButton.innerHTML = '<span class="toggle-icon" id="transfer-toggle-icon">▼</span> <strong>Hide History</strong>';
        } else {
            transactionList.style.display = "none";
            toggleIcon.textContent = "▲";
            toggleButton.innerHTML = '<span class="toggle-icon" id="transfer-toggle-icon">▲</span> <strong>Show History</strong>';
        }
    });
</script>
</body>

</html>