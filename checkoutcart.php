<?php
include('config/dbcon.php');
include('functions/userfunctions.php');
include('middleware/authenticate.php'); 

if (isset($_POST['checkout'])) {
    if (!isset($_SESSION['user_id'])) {
        echo "<script>
                swal('Error!', 'User not logged in!', 'error')
                .then((value) => {
                    window.location.href = 'login.php';
                });
              </script>";
        exit();
    }
    
    $userId = $_SESSION['auth_user']['user_id'];
    $items = getCartItems();

    if (empty($items)) {
        echo "<script>
                swal('Error!', 'Your cart is empty!', 'error')
                .then((value) => {
                    window.location.href = 'index.php';
                });
              </script>";
        exit();
    }

    foreach($items as $citem) {
        if (!isset($citem['prod_id'])) {
            continue; // skip items without product_id
        }
        
        $prod_id = $citem['prod_id'];
        $prod_qty = $citem['prod_qty'];
        $price = $citem['selling_price'];

        // Insert the order into the item_orders table
        $query = "INSERT INTO item_orders (prod_id, user_id, prod_id, price) VALUES ('$prod_id', '$user_id', '$prod_qty', '$price')";
        mysqli_query($conn, $query);

        // Reduce the quantity of the product in the products table
        $updateProd_Qty = "UPDATE products SET prod_qty = prod_qty - $prod_qty WHERE id = '$prod_id'";
        mysqli_query($conn, $updateProd_Qty);
    }

    // Clear the cart after checkout
    clearCart($userId);

    echo "<script>
    swal('Success!', 'Your order has been placed successfully!', 'success');
    window.location.href = 'index.php';
  </script>";
}
?>
