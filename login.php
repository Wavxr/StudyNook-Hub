<?php 
session_start();

$hideNavbar = true;

if(isset($_SESSION['auth'])) {
    $_SESSION['message'] = 'You are already Logged In!';
    header('Location: index.php');
    exit();
}

include('includes/header.php'); ?>

    <div class="py-5 bg-light">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    
                    <?php if(isset($_SESSION['message'])) { ?>
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        <strong>Notice!</strong> <?= $_SESSION['message'] ?>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <?php unset($_SESSION['message']); } ?>

                    <div class="card shadow-sm border-0">
                        <div class="card-header bg-dark text-white text-center">
                            <h4>Login</h4>
                        </div> 
                        <div class="card-body">
                            <form action="functions/authcode.php" method="POST">
                                <div class="form-floating mb-3">
                                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="name@example.com" required>
                                    <label for="exampleInputEmail1">Email address</label>
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                                    <label for="exampleInputPassword1">Password</label>
                                </div>
                                
                                <div class="d-grid">
                                    <button type="submit" name="login_btn" class="btn bg-dark text-white btn-lg">Login</button>
                                </div>
                            </form>
                            <div class="mt-3 text-center">
                                <a href="register.php" class="text-muted">Don't have an account? Register</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

<?php include('includes/footer.php'); ?>
