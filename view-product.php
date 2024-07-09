<?php 
include('functions/userfunctions.php');
include('includes/header.php'); 

if(isset($_GET['product']))
{
    $product_slug = $_GET['product'];
    $product_data = getSlugActive('products', $product_slug);
    $product = mysqli_fetch_array($product_data);

    if($product)
    {
        ?>
        <div class="bg-light py-4">
            <div class="container mt-3">
                <div class="row">
                    <div class="col-md-8">
                        <div class="shadow">
                            <img src="uploads/<?= $product['image']; ?>" alt="Product Image" class="w-100">
                        </div>
                        <h5 class="text-center mt-3">Description</h5>
                        <p><?= $product['description'];?></p>
                    </div>
                    <div class="card col-md-4">
                        <div class="card-body">
                            <h2 class="fw-bold text-dark"><?= $product['name']; ?></h2>
                            <br>
                            <h6><?= $product['small_description']; ?></h6>
                            <br><hr><br>
                            <h3>₱<?= $product['selling_price']; ?></h3>
                            <h6 class="text-danger"><s>₱<?= $product['original_price']; ?></s></h6>
                            <div class="column mt-3">
                                <button class="btn btn-warning px-4 mt-3 addToCardBtn" value="<?= $product['id'] ?>" style="width:100%"><i class="fa fa-shopping-cart me-2"></i>Add to Cart</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            
        <?php
    }
    else
    {
        echo "product not found";
    }
}
else
{
    redirect('products.php', 'Invalid Category');
}
include('includes/footer.php'); ?>