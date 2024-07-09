<?php
session_start();

if(isset($_SESSION['auth_user']['user_id'])) {
    $user_id = $_SESSION['auth_user']['user_id'];
    $zipFilePath = '../orders/order_' . $user_id . '.zip';

    if(file_exists($zipFilePath)) {
        header('Content-Type: application/zip');
        header('Content-Disposition: attachment; filename="order_' . $user_id . '.zip"');
        header('Content-Length: ' . filesize($zipFilePath));
        readfile($zipFilePath);

        // Optionally delete the files after download
        unlink($zipFilePath);
        unlink('../orders/order_' . $user_id . '.txt');
        exit;
    } else {
        echo "File not found.";
    }
} else {
    echo "Unauthorized access.";
}
?>
