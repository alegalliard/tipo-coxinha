// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery3
//= require jquery_ujs

$(function () {
    $("#price").on("keyup blur", ".form-control", recalc);
    
    $('.quantity').keyup(function () {
        calculateSum();        
    });
});

function isNumber(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

function recalc() {
    var total = 0;
    $("#price").find('tr').each(function () {
        var quantity = $(this).find('input.quantity').val();
        var price = $(this).find('.price').text();
        var unity = $(this).find('.unity').text();        
        price = moneyToInt(price);

        var priceTotal = (quantity * price);
        total += isNumber(priceTotal) ? priceTotal : 0;
        var quantityTotal = calculateQuantity(unity, quantity)
        var real = numberToReal(priceTotal);
        $(this).find('.total_price').text(real ? real : "");
        $(this).find('.total_quantity').text(quantityTotal ? quantityTotal : "");   
    });
    var total_real = numberToReal(total);
    $("#price_sum").text(total_real);      
}

function moneyToInt ( str )
{
    return parseFloat(str.replace("R$","").replace(".","").replace(",","."));
}

function numberToReal(number) {
    var number = number.toFixed(2).split('.');
    number[0] = "R$ " + number[0].split(/(?=(?:...)*$)/).join('.');
    return number.join(',');
}

function calculateQuantity(str, qnt){
    if(str=="Cento") {
        return qnt * 100;
    }
    return qnt;
}