<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="icon" type="image/png" href="<c:url value='/static/img/favicon-16x16.png' />"   >  
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>CHART</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"crossorigin="anonymous"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha256-R4pqcOYV8lt7snxMQO/HSbVCFRPMdrhAFMH+vr9giYI=" crossorigin="anonymous"></script>
        <style>
            #myChart {
                height: 800px !important;
            }

        </style>
    </head>
    <body>
        <div width="200px" height="200px">
            <canvas id="myChart" ></canvas>
        </div>
        <div width="200px" height="200px">
            <canvas id="doughnut-chart"></canvas>
        </div>

        <script
            src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"
        ></script>
        <script>
            function loadGraphData() {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "http://localhost:8084/ProductBoot/orderrest/", true);

                xhr.onload = function () {
                    if (this.status == 200) {
                        var graphData = JSON.parse(xhr.responseText);

                        createMonthlyProfitsGraph(graphData);
                    }
                };
                xhr.send();
            }
        </script>
        <script>
            function loadProducts() {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "http://localhost:8084/ProductBoot/productrest/", true);

                xhr.onload = function () {
                    if (this.status == 200) {
                        var products = JSON.parse(xhr.responseText);

                        createPieChart(products);
                    }
                };

                xhr.send();
            }
        </script>
        <script>
            function createPieChart(products) {
                var categories = products.map((product) => {
                    return product.categoryId.categoryName;
                });

                let countMeatProducts = 0;
                var countAlcoholProducts = 0;
                var countSoftDrinksProducts = 0;
                var countVegetablesProducts = 0;
                var countFruitProducts = 0;
                var countCleaningProducts = 0;

                for (let i = 0; i < categories.length; i++) {
                    if (categories[i] == "Meat")
                        countMeatProducts = countMeatProducts++;
                    if (categories[i] == "Alcohol Drinks")
                        countAlcoholProducts++;
                    if (categories[i] == "Soft Drinks")
                        countSoftDrinksProducts++;
                    if (categories[i] == "Vegetables")
                        countVegetablesProducts++;
                    if (categories[i] == "Fruit")
                        countFruitProducts++;
                    if (categories[i] == "Cleaning")
                        countCleaningProducts++;
                }

                var countCategories = [
                    countMeatProducts,
                    countAlcoholProducts,
                    countSoftDrinksProducts,
                    countVegetablesProducts,
                    countFruitProducts,
                    countCleaningProducts,
                ];
                new Chart(document.getElementById("doughnut-chart"), {
                    type: "doughnut",
                    data: {
                        labels: [
                            "Meat",
                            "Alcohol",
                            "Soft Drinks",
                            "Vegetables",
                            "Fruit",
                            "Cleaning",
                        ],
                        datasets: [
                            {
                                label: "Population (millions)",
                                backgroundColor: [
                                    "#3e95cd",
                                    "#8e5ea2",
                                    "#3cba9f",
                                    "#e8c3b9",
                                    "#c45850",
                                    "$FFE2A0",
                                ],
                                data: countCategories,
                            },
                        ],
                    },
                    options: {
                        title: {
                            display: true,
                            text: "Product allocation in the categories",
                        },
                    },
                });
            }
        </script>
        <script>

            function createMonthlyProfitsGraph(graphData) {
                var ctx = document.getElementById("myChart");

                var graphData2 = graphData.map(function (entry) {
                    entry.date = new Date(entry.date).getMonth();
                    var dateJs = entry.date + 1;
                    var totalAmount = entry.totalAmount;
                    return {dateJs, totalAmount};
                });

                graphData2.sort((a, b) => a.dateJs - b.dateJs);

                var monthlyAmounts = graphData2.map((entry) => {
                    return entry.totalAmount;
                });

                var myChart = new Chart(ctx, {
                    type: "bar",
                    data: {
                        labels: [
                            "January",
                            "February",
                            "March",
                            "April",
                            "May",
                            "June",
                            "July",
                            "August",
                            "September",
                            "October",
                            "November",
                            "December",
                        ],
                        datasets: [
                            {
                                label: "Monthly Revenue in 2020 (€)",
                                data: monthlyAmounts,
                                backgroundColor: [
                                    "rgba(255, 99, 132, 0.2)",
                                    "rgba(54, 162, 235, 0.2)",
                                    "rgba(255, 206, 86, 0.2)",
                                    "rgba(75, 192, 192, 0.2)",
                                    "rgba(153, 102, 255, 0.2)",
                                    "rgba(255, 159, 64, 0.2)",
                                ],
                                borderColor: [
                                    "rgba(255, 99, 132, 1)",
                                    "rgba(54, 162, 235, 1)",
                                    "rgba(255, 206, 86, 1)",
                                    "rgba(75, 192, 192, 1)",
                                    "rgba(153, 102, 255, 1)",
                                    "rgba(255, 159, 64, 1)",
                                ],
                                borderWidth: 1,
                            },
                        ],
                    },
                    options: {
                        scales: {
                            yAxes: [
                                {
                                    ticks: {
                                        beginAtZero: true,
                                    },
                                },
                            ],
                        },
                    },
                });
            }

            $(document).ready(function () {
                loadGraphData();
                loadProducts();
            });
        </script>
    </body>
</html>
