<?php
include('../config/dbcon.php');

function getAll($table) {
    global $con;
    $query = "SELECT * FROM $table";
    return $query_run = mysqli_query($con, $query);
}

function getByID($table, $id) {
    global $con;
    $query = "SELECT * FROM $table WHERE id = $id";
    return $query_run = mysqli_query($con, $query);
}

function getAllActive($table) {
    global $con;
    $query = "SELECT * FROM $table WHERE status = '0'";
    return $query_run = mysqli_query($con, $query);
}

function redirect($url, $message) {
    $_SESSION['message'] = $message;
    header('Location: ' .$url);
    exit();
}

function getOrderHistoryAndProfit() {
    global $con;
    $date = date('Y-m-d');
    $weekAgo = date('Y-m-d', strtotime('-6 days'));

    // Create an array to store the profit for each day
    $dailyProfit = [];
    for ($i = 0; $i <= 6; $i++) {
        $currentDate = date('Y-m-d', strtotime("-$i days"));
        $dailyProfit[$currentDate] = 0;
    }

    // Query to fetch orders from the past week
    $query = "SELECT * FROM item_orders WHERE DATE(order_date) BETWEEN '$weekAgo' AND '$date'";
    $result = mysqli_query($con, $query);

    $orderHistory = [];
    $totalProfit = 0;

    while ($row = mysqli_fetch_assoc($result)) {
        $orderHistory[] = $row;
        $orderDate = date('Y-m-d', strtotime($row['order_date']));
        $dailyProfit[$orderDate] += $row['price'] * $row['prod_qty'];
        $totalProfit += $row['price'] * $row['prod_qty'];
    }

    return ['orderHistory' => $orderHistory, 'totalProfit' => $totalProfit, 'dailyProfit' => $dailyProfit];
}

?>