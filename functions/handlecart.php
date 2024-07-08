<?php
session_start();
include('../config/dbcon.php');

header('Content-Type: application/json');

if(isset($_SESSION['auth'])) {
    if(isset($_POST['scope'])) {
        $scope = $_POST['scope'];
        switch($scope) {
            case "add": 
                $prod_id = $_POST['prod_id'];
                $prod_qty = $_POST['prod_qty'];
                $user_id = $_SESSION['auth_user']['user_id'];

                $check_if_cart_exists = "SELECT * FROM carts WHERE user_id = '$user_id' AND prod_id = '$prod_id'";
                $check_if_cart_exists_run = mysqli_query($con, $check_if_cart_exists);

                if(mysqli_num_rows($check_if_cart_exists_run) > 0) 
                {
                    echo json_encode("exists");    
                }
                else
                {
                    $insert_query = "INSERT INTO carts (user_id, prod_id, prod_qty) VALUES ('$user_id', '$prod_id', '$prod_qty')";
                    $insert_query_run = mysqli_query($con, $insert_query);

                    if($insert_query_run) {
                        echo json_encode(201);
                    } else {
                        echo json_encode(500);
                    }
                }                
                break;
            case "delete":
                $cart_id = $_POST['cart_id'];
                $user_id = $_SESSION['auth_user']['user_id'];

                $check_if_cart_exists = "SELECT * FROM carts WHERE id = '$cart_id' AND user_id = '$user_id'";
                $check_if_cart_exists_run = mysqli_query($con, $check_if_cart_exists);

                if(mysqli_num_rows($check_if_cart_exists_run) > 0) 
                {
                    $delete_query = "DELETE FROM carts WHERE id='$cart_id' ";
                    $delete_query_run = mysqli_query($con, $delete_query);

                    if($delete_query_run) {
                        echo json_encode(200);
                    } else {
                        echo json_encode(500);
                    }   
                }
                else
                {
                    echo json_encode(500); 
                }        

                break;
            default:
                echo json_encode(500);
        }
    }
} else {
    echo json_encode(401);
}
?>
