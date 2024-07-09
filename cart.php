<?php 
include('functions/userfunctions.php');
include('includes/header.php'); 
include('middleware/authenticate.php'); 
?>
<div class="py-5">
    <div class="container">
        <div class="card card-body shadow">
            <div class="row">
                <div class="col-md-12">
                    <div class="row align-items-center mt-3 text-center">
                        <div class="col-md-2">
                            <h5>Product Image</h5>
                        </div>
                        <div class="col-md-3">
                            <h5>Name</h5>
                        </div>
                        <div class="col-md-3">
                            <h5>Price</h5>
                        </div>
                        <div class="col-md-2">
                            <h5>Quantity</h5>
                        </div>
                        <div class="col-md-2">
                            <h5>Action</h5>
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
                            <div class="row align-items-center mt-1 mb-1 text-center">
                                <div class="col-md-2">
                                    <img src="uploads/<?= $citem['image'] ?>" alt="Product Image" class="w-100">
                                </div>
                                <div class="col-md-3">
                                    <h5><?= $citem['name'] ?></h5>
                                </div>
                                <div class="col-md-3">
                                    <h5>₱<?= $citem['selling_price'] ?></h5>
                                </div>
                                <div class="col-md-2">
                                    <h5><?= $citem['prod_qty']?></h5>
                                </div>
                                <div class="col-md-2">
                                    <button class="btn btn-danger deleteItem" value="<?= $citem['cid'];?>"><i class="fa fa-trash me-2"></i>Remove</button>
                                </div>
                            </div>
                            <hr>
                        <?php
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>

        <div class="float-end m-2">
            <h5>Total Price: ₱<?= $totalPrice ?></h5>
            <button type="button" class="btn btn-outline-primary checkOutBtn">Check Out</button>
        </div>

    </div>
</div>

<?php include('includes/footer.php'); ?>