<?php 
include('functions/userfunctions.php'); 
include('includes/header.php'); 

?>

<div class="container my-5">
    <!-- Hero Section -->
    <div class="jumbotron text-center">
        <h1 class="display-4">Welcome to StudyHub Nook!</h1>
        <p class="lead">Find the best software for your needs.</p>
        <hr class="my-4">
        <p>Browse through our categories and discover our top products.</p>
    </div>
    
    <!-- Displaying Categories -->
    <?php 
    $categories = getAllActive('categories'); 
    if(mysqli_num_rows($categories) > 0) {
        while($category = mysqli_fetch_array($categories)) { 
            $category_id = $category['id']; ?>
            <div class="category-section my-5">
                <h2 class="text-center"><?= $category['name']; ?></h2>
                <hr>
                <div class="owl-carousel owl-theme">
                    <?php
                    $products = getProdByCategory($category_id);
                    if(mysqli_num_rows($products) > 0) {
                        while($product = mysqli_fetch_array($products)) { 
                            if($product['qty'] > 0) { ?>
                            <div class="item">
                                <div class="card" style="min-height: 450px;">
                                    <img src="uploads/<?= $product['image']; ?>" class="card-img-top" alt="<?= $product['name']; ?>">
                                    <div class="card-body">
                                        <h5 class="card-title text-center"><?= $product['name']; ?></h5>
                                        <p class="card-text text-center"><?= $product['small_description']; ?></p>
                                        <p class="text-center"><strong>Price: ₱<?= $product['selling_price']; ?></strong></p>
                                        <a href="view-product.php?product=<?= $product['slug']; ?>" class="btn btn-warning px-4 mt-3 btn-block">View Details</a>
                                    </div>
                                </div>
                            </div>
                            <?php 
                            } 
                        }
                    } else {
                        echo "<p class='text-center'>No products available in this category.</p>";
                    } ?>
                </div>
            </div>
        <?php }
    } else {
        echo "<p class='text-center'>No categories available.</p>";
    } ?>
</div>

<?php include('includes/footer.php'); ?>