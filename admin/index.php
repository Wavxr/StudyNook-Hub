<?php 
session_start();
require('../middleware/admin_middleware.php');
include('includes/header.php'); 

$orderData = getOrderHistoryAndProfit();
$orderHistory = $orderData['orderHistory'];
$totalProfit = $orderData['totalProfit'];

?>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="row mt-4">
                <!-- Today's Money -->
                <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                    <div class="card">
                        <div class="card-body p-3">
                            <div class="row">
                                <div class="col-8">
                                    <div class="numbers">
                                        <p class="text-sm mb-0 text-uppercase font-weight-bold">Today's Money</p>
                                        <h5 class="font-weight-bolder">
                                            ₱<?= number_format($totalProfit, 2); ?>
                                        </h5>
                                    </div>
                                </div>
                                <div class="col-4 text-end">
                                    <div class="icon icon-shape bg-gradient-primary shadow-primary text-center rounded-circle">
                                        <i class="ni ni-money-coins text-lg opacity-10" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Other cards here -->
            </div>

            <div class="row mt-4">
                <div class="col-md-12">
                    <h5 class="mb-4">Order History</h5>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Product ID</th>
                                <th>Price</th>
                                <th>Total</th>
                                <th>Order Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($orderHistory as $order): ?>
                                <tr>
                                    <td><?= $order['id']; ?></td>
                                    <td><?= $order['prod_id']; ?></td>
                                    <td>₱<?= number_format($order['price'], 2); ?></td>
                                    <td>₱<?= number_format($order['price'] * $order['prod_qty'], 2); ?></td>
                                    <td><?= date('d-m-Y H:i:s', strtotime($order['order_date'])); ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-md-12">
                    <h5 class="mb-4">Orders Graph</h5>
                    <canvas id="ordersChart"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Prepare data for the graph
    const orderHistory = <?= json_encode($orderHistory); ?>;
    const dateOrdersMap = {};

    orderHistory.forEach(order => {
        const date = order.order_date.split(' ')[0];
        if (dateOrdersMap[date]) {
            dateOrdersMap[date]++;
        } else {
            dateOrdersMap[date] = 1;
        }
    });

    const dates = Object.keys(dateOrdersMap);
    const orderCounts = Object.values(dateOrdersMap);

    const ctx = document.getElementById('ordersChart').getContext('2d');
    const ordersChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: dates,
            datasets: [{
                label: 'Number of Orders',
                data: orderCounts,
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
                        text: 'Number of Orders'
                    },
                    beginAtZero: true
                }
            }
        }
    });
</script>


<?php include('includes/footer.php'); ?>