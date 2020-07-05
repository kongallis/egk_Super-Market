function loadProducts() {
    var elements = document.getElementsByClassName("listOfProducts");
    for (let i = 0; i < elements.length; i++) {
        while (elements[i].firstChild) {
            elements[i].firstChild.remove();
        }
    }
    var xhr = new XMLHttpRequest();

    xhr.open("GET", "http://localhost:8084/ProductBoot/productrest/", true);

    xhr.onload = function () {
        if (this.status == 200) {
            var productsJSON = JSON.parse(xhr.responseText);
            for (let i = 0; i < productsJSON.length; i++) {
                var productDIV = createEachDOMProduct(productsJSON[i]);
            }
            var anchorsCreated = document.getElementsByClassName(
                    "add-to-cart-anchor"
                    );
            var titles = document.getElementsByClassName("titleOfProduct");
            var prices = document.getElementsByClassName("price");
            for (let z = 0; z < productsJSON.length; z++) {
                anchorsCreated[z]["data-json"] = productsJSON[z];

                titles[z].textContent = anchorsCreated[z]["data-json"].name;
                prices[z].innerText = parseFloat(anchorsCreated[z]["data-json"].price);
            }
            attachEventListenerToButtons();
        }
    };

    xhr.send();
}

function createEachDOMProduct(product) {
    var productCreated = document.createElement("div");
    console.log(product);
    productCreated.className = "product";
    var measurementType =
            product.categoryId.categoryName == "Meat" ||
            product.categoryId.categoryName == "Vegetables" ||
            product.categoryId.categoryName == "Fruit"
            ? "gr"
            : "ml";
    var greenB = product.bio == true ? "circleC" : "no";

    var restOf = `<img class="img-fluid" src="/ProductBoot/static/img/${product.image}"/>
 
  <h3 class="titleOfProduct">"${product.name}</h3>
 
  <h4 class="descriptionOfProduct">"${product.brand}"</h4>
  <span class=${greenB}></span>
  
  <div class="footerProduct">
     
    <p class="measurementOfProduct">${product.quantity}${measurementType}
   </p>
    <div class="priceCurrency">
      <p class="price"><strong>${product.price}</strong></p>
      <span>€</span>
    </div>
    <button class="btn btn-primary addToCartButton">
      ADD TO CART<a data-json=${product} class="add-to-cart-anchor"></a>
    </button>`;

    productCreated.innerHTML = restOf;
    document.body.appendChild(productCreated);
    document.getElementById("listOfProducts").appendChild(productCreated);
    return productCreated;
}

// <!---FILTER FUNCTION-->

document.getElementById("sortPerPrice").addEventListener("click", function () {
    var pricesToSort = document.querySelectorAll(".add-to-cart-anchor");
    var arrayPricesToSort = Array.from(pricesToSort);
    arrayPricesToSort.sort(function (a, b) {
        return b["data-json"].price - a["data-json"].price;
    });
    arrayPricesToSort.map(function (element) {
        var doc = document.querySelector(".listOfProducts");
        doc.appendChild(element.parentElement.parentElement.parentElement);
    });
});

document
        .getElementById("sortPerPriceAsc")
        .addEventListener("click", function () {
            var pricesToSort = document.querySelectorAll(".add-to-cart-anchor");
            var arrayPricesToSort = Array.from(pricesToSort);
            arrayPricesToSort.sort(function (a, b) {
                return a["data-json"].price - b["data-json"].price;
            });
            arrayPricesToSort.map(function (element) {
                var doc = document.querySelector(".listOfProducts");
                doc.appendChild(element.parentElement.parentElement.parentElement);
            });
        });

var bioSign = document.querySelector(".bioSwitch");
var bioSelected = false;
document.querySelector("#switch").addEventListener("click", function () {
    if (bioSelected == false) {
        var bioToSort = document.querySelectorAll(".add-to-cart-anchor");

        var arrayBioToSort = Array.from(bioToSort);

        var arrayBioSorted = arrayBioToSort.filter(function (element) {
            return element["data-json"].bio !== true;
        });
        arrayBioSorted.map(function (element) {
            var parent = element.parentElement.parentElement.parentElement;
            parent.style.display = "none";
        });

        bioSelected = true;
        bioSign.style.color = "#339318";
        bioSign.style.fontWeight = "800";
    } else {
        // loadProducts();
        var bioToSort = document.querySelectorAll(".add-to-cart-anchor");
        var arrayBioToSort = Array.from(bioToSort);
        var arrayBioSorted = arrayBioToSort.filter(function (element) {
            return element["data-json"].bio !== true;
        });
        arrayBioSorted.map(function (element) {
            var parent = element.parentElement.parentElement.parentElement;
            parent.style.display = "block"; /////
        });

        bioSelected = false;
        bioSign.style.color = "black";
        bioSign.style.fontWeight = "400";
    }
});

$(document).ready(function () {
    loadProducts();
});

function filterBy(filterType) {
    var elements = document.getElementsByClassName("listOfProducts");
    for (let i = 0; i < elements.length; i++) {
        while (elements[i].firstChild) {
            elements[i].firstChild.remove();
        }
    }
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "http://localhost:8084/ProductBoot/productrest/", true);
    xhr.onload = function () {
        if (this.status == 200) {
            var productsJSON = JSON.parse(xhr.responseText);
            var fishProductsJSON = productsJSON.filter(
                    (product) => product.categoryId.categoryName == filterType
            );
            for (let i = 0; i < fishProductsJSON.length; i++) {
                var productDIV = createEachDOMProduct(fishProductsJSON[i]);
            }
            var anchorsCreated = document.getElementsByClassName(
                    "add-to-cart-anchor"
                    );
            var titles = document.getElementsByClassName("titleOfProduct");
            var prices = document.getElementsByClassName("price");
            for (let z = 0; z < fishProductsJSON.length; z++) {
                anchorsCreated[z]["data-json"] = fishProductsJSON[z];
                titles[z].textContent = anchorsCreated[z]["data-json"].name;
                prices[z].innerText = parseFloat(anchorsCreated[z]["data-json"].price);
            }
            attachEventListenerToButtons();
        }
    };
    xhr.send();
}

function attachEventListenerToButtons() {
    var minusButtons = document.getElementsByClassName("minusButton");
    var plusButtons = document.getElementsByClassName("plusButton");
    var addToCartButtons = document.getElementsByClassName(
            "addToCartButton"
            );

    for (let minusButton of minusButtons) {
        minusButton.addEventListener("click", function (event) {
            console.log("- 1");
            var initialQuantity = parseInt(
                    event.target.nextSibling.firstChild.value
                    );
            if (initialQuantity != 0) {
                event.target.nextSibling.firstChild.value -= 1;
            }
        });
    }
    for (let plusButton of plusButtons) {
        plusButton.addEventListener("click", function () {
            console.log("+ 1");
            var initialQuantity = parseInt(
                    event.target.previousSibling.firstChild.value
                    );
            event.target.previousSibling.firstChild.value = initialQuantity + 1;
        });
    }

    $(".addToCartButton").click(function (event) {
        var thisAnchor = event.target.getElementsByClassName(
                "add-to-cart-anchor"
                );

        event.preventDefault();
        var name = thisAnchor[0]["data-json"].name;
        var price = Number(thisAnchor[0]["data-json"].price);
        shoppingCart.addItemToCart(name, price, 1);
        displayCart();
    });
}