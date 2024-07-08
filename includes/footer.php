<script src="assets/js/jquery-3.7.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/custom.js"></script>

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