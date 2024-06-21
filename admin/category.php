<?php 
session_start();
require('../middleware/admin_middleware.php');
include('includes/header.php'); 


?>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card-header">
                <h4>Categories</h4>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-stripped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Status</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            $category = getAll("categories");
                            if(mysqli_num_rows($category) > 0) {
                                foreach($category as $item) {
                                    ?>
                                    <tr>
                                        <td> <?= $item['id'] ?> </td>
                                        <td> <?= $item['name'] ?> </td>
                                        <td>  
                                            <img src="../uploads/<?= $item['image'] ?>" width="50px" height="50px" alt="<?= $item['name'] ?>">
                                        </td>
                                        <td> <?= $item['status'] == "0" ? "Visible" : "Hidden" ?> </td>

                                        <td>
                                            <a href="#" class="btn btn-primary">Edit</a>
                                        </td>

                                    </tr>
                                    <?php
                                }
                            } else {
                                echo "No Records Found";
                            }
                        ?>

                        
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<?php include('includes/footer.php'); ?>