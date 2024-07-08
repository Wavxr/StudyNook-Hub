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
                  alertify.success("Product Added to Cart");
              } else if(response == "exists") {
                  alertify.error("Product Already in Cart"); 
              } else if(response == 401) {
                  alertify.error("Please login to add product to cart");
              } else if(response == 500) {
                  alertify.error("Something Went Wrong");
              }
          }
      });
    });
  });
  