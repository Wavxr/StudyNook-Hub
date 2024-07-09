<script src="assets/js/jquery-3.7.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/custom.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

    <script>
    $(document).ready(function(){
        $('.owl-carousel').owlCarousel({
            loop: true,
            margin: 10,
            nav: true,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 2
                },
                1000: {
                    items: 4
                }
            }
        });
    });
    </script>
    <script>
      <?php 
        session_start();
        if(isset($_SESSION['message'])) {
          echo "swal({
                  title: 'Success',
                  text: '".$_SESSION['message']."',
                  icon: 'success'
                });";
          unset($_SESSION['message']);
        }
      ?>
    </script>
  </body>
</html>