<?php 
include('functions/userfunctions.php');
include('includes/header.php'); 
include('middleware/authenticate.php'); 
?>
<div class="py-5">
    <div class="container">
        <div class="card card-body border-none" style="border: none;">
            <div class="row">
                <div class="col-md-8">
                    <h3 class="mt-3">Check Out</h3>
                    <br>
                    <div class="row align-items-center mt-3 text-center">
                        <div class="col-sm-2">
                            <p>Software:</p>
                        </div>
                        <div class="col-md-4">
                            </div>
                        <div class="col-md-2">
                            <p>Quantity:</p>
                        </div>
                        <div class="col-md-2">
                            <p>Price:</p>
                        </div>
                        <div class="col-md-2">
                            <p>Remove:</p>
                        </div>
                    </div>
                    <div id="mycart">
                        <hr>
                        <?php 
                        $items = getCartItems();
                        $totalPrice = 0;
                        foreach($items as $citem) {
                            $totalPrice += $citem['selling_price'] * $citem['prod_qty'];
                        ?>
                            <div class="row align-items-center mt-1 mb-3 text-center">
                                <div class="col-md-2">
                                    <div class="card rounded">
                                        <img src="uploads/<?= $citem['image'] ?>" alt="Product Image" class="rounded">
                                    </div>
                                    
                                </div>
                                <div class="col-md-4">
                                    <h6><?= $citem['name'] ?></h6>
                                </div>
                                <div class="col-md-2">
                                    <h6><?= $citem['prod_qty']?></h6>
                                </div>
                                <div class="col-md-2">
                                    <h6><small>₱<?= $citem['selling_price'] ?></small></h6>
                                </div>
                                <div class="col-md-2">
                                    <button class="btn deleteItem" value="<?= $citem['cid'];?>"><i class="fa-solid fa-xmark"></i></button>
                                </div>
                            </div>
                        <?php
                        }
                        ?>
                    </div>
                    <div class="row align-items-center mt-5 text-center">
                        <div class="col-sm-2">

                        </div>
                        <div class="col-md-4">
                            </div>
                        <div class="col-md-2">
                            <h6>Total:</h6>
                        </div>
                        <div class="col-md-2">
                            <h5>₱<?= $totalPrice ?></h5>
                        </div>
                        <div class="col-md-2">

                        </div>
                    </div>
                </div>
                <div class="col-md-4 bg-dark rounded text-white">
                    <form id="paymentForm" action="#" method="POST" enctype="multipart/form-data">
                        <h3 class="text-white m-3">Payment Info</h3>
                        <br>
                        <div class="col mt-3 p-2">
                            <div class="col-sm-4">
                                <p><small>Payment Method:</small></p>
                            </div>
                            <div class="col-sm-4">
                                <input type="radio" id="creditCard" name="paymentMethod" checked>
                                <label for="creditCard">Credit Card</label>
                            </div>
                            <div class="col-sm-4">
                                <input type="radio" id="paypal" name="paymentMethod">
                                <label for="paypal">PayPal</label>
                            </div>
                        </div>
                        <div class="col mt-3 p-2">
                            <div class="col-sm-12 pb-0">
                                <p><small>Name on Card:</small></p>
                                <input required type="text" id="name" name="cardName" class="form-control bg-transparent text-white">
                            </div>
                        </div>
                        <div class="col mt-3 p-2">
                            <div class="col-sm-12">
                                <p><small>Card Number:</small></p>
                                <input required type="text" id="cardNum" name="cardNum" id="cardNum" class="form-control bg-transparent text-white">
                            </div>
                        </div>
                        <div class="col-sm-12 mt-3 mb-3 p-2">
                            <div class="col-sm-12">
                                <button type="submit" class="btn bg-white checkOutBtn hidden" value="" style="width:100%"><i class="fa fa-shopping-cart me-3"></i>Check Out</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
        const paymentForm = document.getElementById('paymentForm');
        const checkoutButton = document.querySelector('.checkOutBtn');
        const requiredFields = paymentForm.querySelectorAll('input[required]');

        function checkFields() {
            let allFilled = true;
            requiredFields.forEach(field => {
                if (!field.value.trim()) {
                    allFilled = false;
                }
            });
            if (allFilled) {
                checkoutButton.classList.remove('hidden');
            } else {
                checkoutButton.classList.add('hidden');
            }
        }

        requiredFields.forEach(field => {
            field.addEventListener('input', checkFields);
        });

        // Initial check
        checkFields();

        paymentForm.addEventListener('submit', function(event) {
            event.preventDefault();
            if (checkoutButton.classList.contains('hidden')) {
                alert('Please fill all required fields before checking out.');
            } 
        });
    </script>

<?php include('includes/footer.php'); ?>