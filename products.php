<?php 
include('functions/userfunctions.php');
include('includes/header.php'); 

if(isset($_GET['category']))
{
    $category_slug = $_GET['category'];
    $category_data = getSlugActive('categories', $category_slug);
    $category = mysqli_fetch_array($category_data);

    if($category)
    {
        $category_id = $category['id'];
        ?>
        <div class="py-5">
            <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="text-center"><?= $category['name']; ?></h1>
                            <hr>
                            <div class="row">
                                <?php
                                    $products = getProdByCategory($category_id);
                                    if(mysqli_num_rows($products) > 0)
                                    {
                                        foreach($products as $item)
                                        {
                                            ?>
                                                <div class="col-md-3 mb-2 ">
                                                    <a href="#" class="text-decoration-none">
                                                        <div class="card shadow h-100">
                                                            <div class="card-body">
                                                                <img src="uploads/<?= $item['image']; ?>" alt="<?= $item['name']; ?>" class="w-100">
                                                                <h4 class="text-center"><?= $item['name']; ?></h4>
                                                                <p class="text-center"><?= $item['small_description']; ?></p>
                                                                <h5 class="text-center">P<?= $item['selling_price']; ?></h>
                                                            </div>
                                                        </div>
                                                    </a>                            
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
        <?php
    }
    else
    {
        redirect('categories.php', 'Invalid Category');
    }
}
include('includes/footer.php'); ?>