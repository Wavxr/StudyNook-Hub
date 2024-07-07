<?php 
include('functions/userfunctions.php');
include('includes/header.php'); 

?>
 

<div class="py-5">
    <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Our Collections</h1>
                    <hr>
                    <div class="row">
                        <?php
                            $categories = getAllActive('categories');
                            if(mysqli_num_rows($categories) > 0)
                            {
                                foreach($categories as $item)
                                {
                                    ?>
                                        <div class="col-md-3 mb-2 ">
                                            <div class="card shadow h-100">
                                                <div class="card-body">
                                                    <h4 class="text-center"><?= $item['name']; ?></h4>
                                                    <img src="uploads/<?= $item['image']; ?>" alt="<?= $item['name']; ?>" class="w-100">
                                                </div>
                                            </div>
                                        </div>
                                    <?php
                                }
                            }
                            else
                            {
                                echo "No Data Available";
                            }
                        ?>
                    </div>
                </div>
            </div>
    </div>
</div>
    
    

<?php include('includes/footer.php'); ?>