<?php 
session_start();
require('../middleware/admin_middleware.php');
include('includes/header.php'); 
?>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>Add Product</h4>
                </div>
                <div class="card-body">
                    <form action="code.php" method="POST" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-12">
                                <label for="">Select Category</label>
                                <select name="category_id" class="form-select">
                                    <?php 
                                        $categories = getAll("categories");
                                        if(mysqli_num_rows($categories) > 0){
                                            foreach($categories as $category) {
                                                ?>
                                                <option value="<?= $category['id'] ?>"> <?= $category['name'] ?> </option>
                                                <?php
                                            }
                                        }
                                        else {
                                            echo "No Category Available";
                                        }
                                        
                                    ?>
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label for="">Name</label>
                                <input required type="text" name="name" placeholder="Enter Product Name" class="form-control">
                            </div>
                            
                            <div class="col-md-6">
                                <label for="">Slug</label>
                                <input required type="text" name="slug" placeholder="Enter Slug" class="form-control">
                            </div>
                            <div class="col-md-12">
                                <label for="">Small Description</label>
                                <textarea required name="small_description" class="form-control" placeholder="Enter Small Description"></textarea>
                            </div>
                            <div class="col-md-12">
                                <label for="">Description</label>
                                <textarea required name="description" class="form-control" placeholder="Enter Description"></textarea>
                            </div>
                            <div class="col-md-6">
                                <label for="">Original Price</label>
                                <input required type="text" name="original_price" placeholder="Enter Original Price" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label for="">Selling Price</label>
                                <input required type="text" name="selling_price" placeholder="Enter Selling Price" class="form-control">
                            </div>
                            <div class="col-md-12">
                                <label for="">Upload Image</label>
                                <input required type="file" name="image" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label for="">Quantity</label>
                                <input readonly type="number" value="1" name="qty" class="form-control">
                            </div>
                            <div class="col-md-3 mt-4">
                                <label for="">Status</label>
                                <input type="checkbox" name="status">
                            </div>
                            <div class="col-md-3 mt-4">
                                <label for="">Trending</label>
                                <input type="checkbox" name="trending">
                            </div>
                            <div class="col-md-12">
                                <label for="">Meta Title</label>
                                <input type="text" name="meta_title" placeholder="Enter Meta Title" class="form-control">
                            </div>
                            <div class="col-md-12">
                                <label for="">Meta Description</label>
                                <textarea rows="3" name="meta_description" class="form-control" placeholder="Enter Meta Description"></textarea>
                            </div>
                            <div class="col-md-12">
                                <label for="">Meta Keywords</label>
                                <textarea rows="3" name="meta_keywords" class="form-control" placeholder="Enter Meta Keywords"></textarea>
                            </div>
                            <div class="col-md-12 mt-2">
                                <button type="submit" name="add_product_btn" class="btn btn-primary">Add Product</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include('includes/footer.php'); ?>
