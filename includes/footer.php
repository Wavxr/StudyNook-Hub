<script src="assets/js/jquery-3.7.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/custom.js"></script>

    <!-- Alertify -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
    <script>
      alertify.set('notifier','position', 'top-right');
      <?php 
        session_start();
        if(isset($_SESSION['message'])) {
          echo "alertify.success('".$_SESSION['message']."');";
          unset($_SESSION['message']);
        }
      ?>
    </script>
  </body>
</html>