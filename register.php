<?php 
session_start();

$hideNavbar = true;


if(isset($_SESSION['auth'])) {
    $_SESSION['message'] = 'You are already Logged In!';
    header('Location: index.php');
    exit();
}

include('includes/header.php'); ?>

    <div class="py-5 bg-dark">
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
                        <div class="card-header bg-success text-white text-center">
                            <h4>Register</h4>
                        </div> 
                        <div class="card-body">
                            <form action="functions/authcode.php" method="POST">
                                <div class="form-floating mb-3">
                                    <input type="text" name="name" class="form-control" id="floatingName" placeholder="John Doe" required>
                                    <label for="floatingName">Name</label>
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <input type="email" name="email" class="form-control" id="floatingEmail" placeholder="name@example.com" required>
                                    <label for="floatingEmail">Email address</label>
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <input type="number" name="phone" class="form-control" id="floatingPhone" placeholder="1234567890" required>
                                    <label for="floatingPhone">Phone Number</label>
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password" required>
                                    <label for="floatingPassword">Password</label>
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <input type="password" name="cpassword" class="form-control" id="floatingCPassword" placeholder="Confirm Password" required>
                                    <label for="floatingCPassword">Confirm Password</label>
                                </div>
                                
                                <div class="d-grid">
                                    <button type="submit" name="register_btn" class="btn bg-success text-white btn-lg">Submit</button>
                                </div>
                            </form>
                            <div class="mt-3 text-center">
                                <a href="login.php" class="text-muted">Already have an account? Login</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

<?php include('includes/footer.php'); ?>
