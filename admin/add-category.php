<?php 
session_start();
require('../middleware/admin_middleware.php');
include('includes/header.php'); 


?>

<div class="container">
    <div class="row">
        <div class="mt-3">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Add Category</h4>
                    </div>
                    <div class="card-body">
                        <form action="code.php" method="POST" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="">Name</label>
                                    <input type="text" name="name" placeholder="Enter Category Name" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label for="">Slug</label>
                                    <input type="text" name="slug" placeholder="Enter Slug" class="form-control">
                                </div>
                                <div class="col-md-12">
                                    <label for="">Description</label>
                                    <textarea name="description" class="form-control" placeholder="Enter Description"></textarea>
                                </div>
                                <div class="col-md-12">
                                    <label for="">Upload Image</label>
                                    <input type="file" name="image" class="form-control">
                                </div>
                                <div class="col-md-12">
                                    <label for="">Meta Title</label>
                                    <input type="text" name="meta_title" placeholder="Enter meta title" class="form-control">
                                </div>
                                <div class="col-md-12">
                                    <label for="">Meta Description</label>
                                    <textarea row="3" name="meta_description" class="form-control" placeholder="Enter meta description"></textarea>
                                </div>
                                <div class="col-md-12">
                                    <label for="">Meta Keywords</label>
                                    <textarea row="3" name="meta_keywords" class="form-control" placeholder="Enter meta description"></textarea>
                                </div>
                                <div class="col-md-6">
                                    <label for="">Status</label>
                                    <input type="checkbox" name="status">
                                </div>
                                <div class="col-md-6">
                                    <label for="">Popular</label>
                                    <input type="checkbox" name="popular">
                                </div>
                                <div class="col-md-12">
                                    <button type="submit" name="add_category_btn" class="btn btn-primary" >Save</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>

<?php include('includes/footer.php'); ?>