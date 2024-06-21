<?php
include('../functions/myfunctions.php');

    if (!isset($_SESSION['auth'])) {
        redirect("../login.php", "Login to Continue");
    } elseif ($_SESSION['role_as'] != 1) {
        redirect("../index.php", "You are not authorized to access this page");
    }

?>