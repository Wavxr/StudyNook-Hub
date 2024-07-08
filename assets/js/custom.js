$(document).ready(function() {
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
  });
  