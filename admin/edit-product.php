<?php 
session_start();
require('../middleware/admin_middleware.php');
include('includes/header.php'); 
?>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <?php
                if(isset($_GET['id'])) 
                {
                    $id = $_GET['id'];
                    $product = getByID("products", $id);
                    if(mysqli_num_rows($product) > 0) 
                    {
                        $data = mysqli_fetch_array($product);
                        ?>
                        <div class="card">
                            <div class="card-header">
                                <h4>Edit Product
                                <a href="products.php" class="btn btn-primary float-end">Back</a>
                                </h4>
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
                                                            <option value="<?= $category['id'] ?>" <?= $data['category_id'] == $category['id']?'selected':'' ?> > <?= $category['name'] ?> </option>
                                                            <?php
                                                        }
                                                    }
                                                    else {
                                                        echo "No Category Available";
                                                    }
                                                    
                                                ?>
                                            </select>
                                        </div>
                                        <input type="hidden" name="product_id" value="<?= $data['id'] ?>">
                                        <div class="col-md-6">
                                            <label for="">Name</label>
                                            <input required type="text" name="name" value="<?= $data['name'] ?>" placeholder="Enter Product Name" class="form-control">
                                        </div>
                                        
                                        <div class="col-md-6">
                                            <label for="">Slug</label>
                                            <input required type="text" name="slug" value="<?= $data['slug'] ?>" placeholder="Enter Slug" class="form-control">
                                        </div>
                                        <div class="col-md-12">
                                            <label for="">Small Description</label>
                                            <textarea required name="small_description" class="form-control" placeholder="Enter Small Description"><?= $data['small_description'] ?></textarea>
                                        </div>
                                        <div class="col-md-12">
                                            <label for="">Description</label>
                                            <textarea required name="description" class="form-control" placeholder="Enter Description"><?= $data['description'] ?></textarea>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="">Original Price</label>
                                            <input required type="text" value="<?= $data['original_price'] ?>" name="original_price" placeholder="Enter Original Price" class="form-control">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="">Selling Price</label>
                                            <input required type="text" value="<?= $data['selling_price'] ?>" name="selling_price" placeholder="Enter Selling Price" class="form-control">
                                        </div>
                                        <div class="col-md-12">
                                            <label for="">Upload Image</label>
                                            <input type="file" name="image" class="form-control">
                                            <label for="">Current Image</label>
                                            <input type="hidden" name="old_image" value="<?= $data['image']?>">
                                            <img src="../uploads/<?= $data['image'] ?>" height="50px" alt="<?= $data['name'] ?>" >

                                        </div>
                                        <div class="col-md-6">
                                            <label for="">Quantity</label>
                                            <input required type="number" value="<?= $data['qty'] ?>" name="qty" placeholder="Enter Quantity" class="form-control">
                                        </div>
                                        <div class="col-md-3 mt-4">
                                            <label for="">Status</label>
                                            <input type="checkbox" <?= $data['status'] ? "Checked" : "" ?> name="status">
                                        </div>
                                        <div class="col-md-3 mt-4">
                                            <label for="">Trending</label>
                                            <input type="checkbox"<?= $data['trending'] ? "Checked" : "" ?> name="trending">
                                        </div>
                                        <div class="col-md-12">
                                            <label for="">Meta Title</label>
                                            <input required type="text" value="<?= $data['meta_title'] ?>" name="meta_title" placeholder="Enter Meta Title" class="form-control">
                                        </div>
                                        <div class="col-md-12">
                                            <label for="">Meta Description</label>
                                            <textarea required rows="3" name="meta_description" class="form-control" placeholder="Enter Meta Description"><?= $data['meta_description'] ?></textarea>
                                        </div>
                                        <div class="col-md-12">
                                            <label for="">Meta Keywords</label>
                                            <textarea required rows="3"  name="meta_keywords" class="form-control" placeholder="Enter Meta Keywords"><?= $data['meta_keywords'] ?></textarea>
                                        </div>
                                        <div class="col-md-12 mt-2">
                                            <button type="submit" name="update_product_btn" class="btn btn-primary">Update</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <?php
                    }
                    else
                    {
                        echo "Product not found";
                    
                    }
                } 
                else 
                {
                    echo "ID not found";
                }
            ?>
        </div>
        </div>
    </div>
</div>

<?php include('includes/footer.php'); ?>