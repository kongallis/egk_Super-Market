$(window).on("load", handler);


function handler() {

    // to make sticky work we need to stick the element to the right scrolling 
    // position, so the page maintains its structure
    // to achieve that we need the height of the elements
    // before the sticky element
    navBarHeight = $("div.navig").css("height");
    $("div.filterChoices").css("top", navBarHeight);

    // we need the height without the 'px'
    filterHeight = $("div.filterChoices").height();
    navBarHeight = $("div.navig").height();
    topOffset = filterHeight + navBarHeight;
    $("div.categories").css("top", topOffset + "px")

}