$(document).ready(function() {
    // Add to Cart
    $('.addToCardBtn').click(function (e) { 
        e.preventDefault();
        var prod_id = $(this).val();
        $.ajax({
            method: "POST",
            url: "functions/handlecart.php",
            data: {
                "prod_id": prod_id,
                "prod_qty": 1,
                "scope": "add"   
            },
            dataType: "json",
            success: function (response) {
                if(response == 201) {
                    swal({
                        title: 'Success',
                        text: 'Product Added to Cart',
                        icon: 'success'
                    });
                } else if(response == 401) {
                    swal({
                        title: 'Login Required',
                        text: 'Please login to add product to cart',
                        icon: 'warning'
                    });
                } else if(response == 500) {
                    swal({
                        title: 'Error',
                        text: 'Something Went Wrong',
                        icon: 'error'
                    });
                } else if(response == 'exists') {
                    swal({
                        title: 'Info',
                        text: 'Product already in cart',
                        icon: 'info'
                    });
                }
            },
            error: function (xhr, status, error) {
                swal({
                    title: 'Error',
                    text: 'Ajax request failed',
                    icon: 'error'
                });
            }
        });
    });

    // Delete from Cart
    $(document).on('click', '.deleteItem', function () {
        var cart_id = $(this).val();
        console.log("Cart ID:", cart_id); // Debugging statement
        $.ajax({
            method: "POST",
            url: "functions/handlecart.php",
            data: {
                "cart_id": cart_id,
                "scope": "delete"
            },
            dataType: "json",
            success: function (response) {
                console.log("Response:", response); // Debugging statement
                if(response == 200) {
                    swal({
                        title: 'Success',
                        text: 'Item Deleted or Removed from Cart',
                        icon: 'success'
                    });
                    $('#mycart').load(location.href + " #mycart");
                } else {
                    swal({
                        title: 'Error',
                        text: 'Something Went Wrong',
                        icon: 'error'
                    });
                }
            },
            error: function (xhr, status, error) {
                console.error("AJAX Error:", status, error); // Debugging statement
                console.error("Response Text:", xhr.responseText); // Debugging statement
                swal({
                    title: 'Error',
                    text: 'Ajax request failed: ' + xhr.responseText,
                    icon: 'error'
                });
            }
        });
    });

    // Checkout
    $(document).on('click', '.checkOutBtn', function () {
        $.ajax({
            method: "POST",
            url: "functions/handlecart.php",
            data: {
                "scope": "checkout"   
            },
            dataType: "json",
            success: function (response) {
                console.log("Checkout Response:", response);
                if(response == 200) {
                    swal({
                        title: 'Success',
                        text: 'Order placed successfully',
                        icon: 'success'
                    }).then(() => {
                        // Show downloading animation
                        swal({
                            title: 'Downloading...',
                            text: 'Please wait while your file is being downloaded.',
                            icon: 'info',
                            buttons: false,
                            timer: 3000,
                            closeOnClickOutside: false,
                            closeOnEsc: false
                        });

                        // After 3 seconds, show file download success message
                        setTimeout(function() {
                            swal({
                                title: 'Success',
                                text: 'File successfully downloaded',
                                icon: 'success'
                            }).then(() => {
                                location.reload();
                            });
                        }, 1500);
                    });
                } else if(response == 401) {
                    swal({
                        title: 'Error',
                        text: 'User not logged in',
                        icon: 'error'
                    });
                } else if(response == 404) {
                        swal({
                            title: 'Error',
                            text: 'Cart is Empty',
                            icon: 'error'
                        });
                } else if(response == 500) {
                    swal({
                        title: 'Error',
                        text: 'Something went wrong',
                        icon: 'error'
                    });
                }
            },
            error: function (xhr, status, error) {
                swal({
                    title: 'Error',
                    text: 'Ajax request failed',
                    icon: 'error'
                });
            }
        });
    });
});  
