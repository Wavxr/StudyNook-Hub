<?php 
session_start();
require('../middleware/admin_middleware.php');
include('includes/header.php'); 

$orderData = getOrderHistoryAndProfit();
$orderHistory = $orderData['orderHistory'];
$totalProfit = $orderData['totalProfit'];
$dailyProfit = $orderData['dailyProfit'];


?>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="row mt-4">
                <!-- graph -->
                <div class="col-md-8">
                    <div class="shadow card">
                        <h5 class="m-4">Orders Graph</h5>
                        <canvas id="ordersChart"></canvas>
                    </div>     
                </div>
                
                <div class="col-md-4">
                    <!-- Today's Money -->
                    <div class="card shadow mb-4">
                        <div class="card-body p-6">
                            <div class="row">
                                <div class="col-8">
                                    <div class="numbers">
                                        <p class="text-sm mb-0 text-uppercase font-weight-bold">Total Money</p>
                                        <h5 class="font-weight-bolder">
                                            ₱<?= number_format($totalProfit, 2); ?>
                                        </h5>
                                    </div>
                                </div>
                                <div class="col-4 text-end">
                                    <div class="icon icon-shape bg-gradient-primary shadow-primary text-center rounded-circle">
                                    <i class="fas fa-coins text-lg opacity-10" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Other cards here -->
                    <di class="card shadow mb-4">
                        <div class="card-body pt-5 pb-5">
                            <div class="row">
                                <div class="col-8">
                                    <div class="numbers">
                                        <p class="text-sm mb-0 text-uppercase font-weight-bold">Progress towards 100,000 Profits</p>
                                        <h6 class="mt-3">
                                            <?= number_format($totalProfit, 2); ?> / 100,000
                                        </h6>
                                    </div>
                                </div>
                                <div class="col-4 text-end">
                                    <div class="icon icon-shape bg-gradient-primary shadow-primary text-center rounded-circle">
                                        <i class="fas fa-chart-line text-lg opacity-10" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="progress mt-3">
                                <div class="progress-bar bg-gradient-primary" role="progressbar" style="width: <?= ($totalProfit / 100000) * 100; ?>%" aria-valuenow="<?= ($totalProfit / 100000) * 100; ?>" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                </div>                 
            </div>

            <div class="row mt-4">
                <div class="card shadow">
                    <div class="col-md-11.5 m-4">
                        <h5 class="mb-4">Order History</h5>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Product ID</th>
                                    <th>Total</th>
                                    <th>Order Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($orderHistory as $order): ?>
                                    <tr>
                                        <td><?= $order['id']; ?></td>
                                        <td><?= $order['prod_id']; ?></td>
                                        <td>₱<?= number_format($order['price'] * $order['prod_qty'], 2); ?></td>
                                        <td><?= date('d-m-Y H:i:s', strtotime($order['order_date'])); ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Prepare data for the graph
    const dailyProfit = <?= json_encode($dailyProfit); ?>;
    const dates = Object.keys(dailyProfit).reverse();
    const profits = Object.values(dailyProfit).reverse();

    const ctx = document.getElementById('ordersChart').getContext('2d');
    const ordersChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: dates,
            datasets: [{
                label: 'Daily Profit',
                data: profits,
                borderColor: 'rgba(75, 192, 192, 1)',
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderWidth: 1,
                fill: true
            }]
        },
        options: {
            scales: {
                x: {
                    title: {
                        display: true,
                        text: 'Date'
                    }
                },
                y: {
                    title: {
                        display: true,
                        text: 'Profit (₱)'
                    },
                    beginAtZero: true
                }
            }
        }
    });
</script>

<?php include('includes/footer.php'); ?>