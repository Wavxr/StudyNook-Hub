<?php
session_start();
include('../config/dbcon.php');

header('Content-Type: application/json');

function getCartItems($user_id) {
    global $con;
    $query = "SELECT c.*, p.name, p.image, p.selling_price 
              FROM carts c 
              JOIN products p ON c.prod_id = p.id 
              WHERE c.user_id = '$user_id'";
    $result = mysqli_query($con, $query);
    $items = [];
    while($row = mysqli_fetch_assoc($result)) {
        $items[] = $row;
    }
    return $items;
}

if(isset($_SESSION['auth'])) {
    if(isset($_POST['scope'])) {
        $scope = $_POST['scope'];
        
        switch($scope) {

            case "add": 
                if(isset($_POST['prod_id']) && isset($_POST['prod_qty'])) {
                    
                    $prod_id = $_POST['prod_id'];
                    $prod_qty = $_POST['prod_qty'];
                    $user_id = $_SESSION['auth_user']['user_id'];

                    $prod_name_query = "SELECT name FROM products WHERE id = '$prod_id'";
                    $prod_name_query_run = mysqli_query($con, $prod_name_query);
                    $prod_name = mysqli_fetch_assoc($prod_name_query_run)['name'];

                    $check_if_cart_exists = "SELECT * FROM carts WHERE user_id = '$user_id' AND prod_id = '$prod_id'";
                    $check_if_cart_exists_run = mysqli_query($con, $check_if_cart_exists);

                    if(mysqli_num_rows($check_if_cart_exists_run) > 0) {
                        echo json_encode("exists");    
                    } else {
                        $insert_query = "INSERT INTO carts (name, user_id, prod_id, prod_qty) VALUES ('$prod_name', '$user_id', '$prod_id', '$prod_qty')";
                        $insert_query_run = mysqli_query($con, $insert_query);

                        if($insert_query_run) {
                            echo json_encode(201);
                        } else {
                            echo json_encode(500);
                        }
                    }                
                } else {
                    echo json_encode(500); // Invalid request
                }
                break;
                
            case "delete":
                if(isset($_POST['cart_id'])) {
                    $cart_id = $_POST['cart_id'];
                    $user_id = $_SESSION['auth_user']['user_id'];

                    $check_if_cart_exists = "SELECT * FROM carts WHERE id = '$cart_id' AND user_id = '$user_id'";
                    $check_if_cart_exists_run = mysqli_query($con, $check_if_cart_exists);

                    if(mysqli_num_rows($check_if_cart_exists_run) > 0) {
                        $delete_query = "DELETE FROM carts WHERE id='$cart_id' ";
                        $delete_query_run = mysqli_query($con, $delete_query);

                        if($delete_query_run) {
                            echo json_encode(200);
                        } else {
                            echo json_encode(500);
                        }   
                    } else {
                        echo json_encode(500); // Cart item not found
                    }        
                } else {
                    echo json_encode(500); // Invalid request
                }
                break;

            case "checkout":
                $user_id = $_SESSION['auth_user']['user_id'];
                $items = getCartItems($user_id);
                $cardNum = $_POST['cardNum'];

                error_log("Card Number fromm php: " . $cardNum);

                if(empty($items)) {
                    echo json_encode(404); // Cart is empty
                    exit;
                }

                $total_price = 0;

                // Process each item in the cart
                foreach($items as $item) {
                    $prod_id = $item['prod_id'];
                    $prod_qty = $item['prod_qty'];
                    $selling_price = $item['selling_price'];
                    $prod_name = $item['name'];
                    $total_price += $selling_price * $prod_qty;

                    // Update product quantity in the products table
                    $update_query = "UPDATE products SET qty = qty - $prod_qty WHERE id = '$prod_id'";
                    $update_query_run = mysqli_query($con, $update_query);

                    if(!$update_query_run) {
                        echo json_encode(500); // Error updating product quantity
                        exit;
                    }   
                    error_log("Card Number: " . $cardNum);

                    // Insert order into orders table
                    $insert_order_query = "INSERT INTO item_orders (user_id, prod_id, prod_qty, price, card_num) VALUES ('$user_id', '$prod_id', '$prod_qty', $total_price, '$cardNum')";
                    $insert_order_query_run = mysqli_query($con, $insert_order_query);

                    if(!$insert_order_query_run) {
                        echo json_encode(500); // Error inserting order
                        exit;
                    }
                }

                // Clear user's cart
                $clear_cart_query = "DELETE FROM carts WHERE user_id = '$user_id'";
                $clear_cart_query_run = mysqli_query($con, $clear_cart_query);

                if($clear_cart_query_run) {
                    echo json_encode(200); // Order placed successfully
                } else {
                    echo json_encode(500); // Error clearing cart
                }
                break;

            default:
                echo json_encode(500); // Invalid scope
                break;
        }
    } else {
        echo json_encode(500); // Scope not set
    }
} else {
    echo json_encode(401); // User not authenticated
}
?>
