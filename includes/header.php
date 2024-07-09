<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>StudyHub Nook | PHP</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/custom.css">
    <script src="https://kit.fontawesome.com/8f0342e128.js" defer crossorigin="anonymous"></script>
    <!-- SweetAlert -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.3.2/dist/confetti.browser.min.js"></script>




    <style>
        .card {
            height: 100%;
        }
        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .owl-nav button {
            background-color: #27ae60 !important;
            border: none !important;
            border-radius: 50% !important;
            width: 40px !important;
            height: 40px !important;
            position: absolute !important;
            top: 50% !important;
            transform: translateY(-50%) !important;
        }
        .owl-nav button span {
            font-size: 1.5rem;
            color: #fff;
        }
        .owl-nav button.owl-prev {
            left: -20px;
        }
        .owl-nav button.owl-next {
            right: -20px;
        }
        .owl-carousel .item {
            margin: 5px;
        }
    </style>
  </head>
  <body>
    <?php include('navbar.php'); ?>