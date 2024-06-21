<?php

    $host = "localhost";
    $username = "root";
    $password = "";
    $database = "phpecom";

    //creating db connection
    $con = mysqli_connect($host, $username, $password, $database);

    //checking db connection
    if(!$con){
        die("Connection Failed: ". mysqli_connect_error());
    }
?>