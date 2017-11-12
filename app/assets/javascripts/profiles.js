$(function () {
    $("#proposal_table").on("keyup blur", ".form-control", Calculate);
    
    $('.quantity').keyup(function () {
        calculateSum();        
    });
});

function isNumber(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

function Calculate() {
    var total = 0;
    $("#proposal_table").find('tr').each(function () {
        var quantity = $(this).find('input.quantity').val();
        var price = $(this).find('.price').text();
        var unity = $(this).find('.unity').text();        
        price = moneyToInt(price);

        var priceTotal = (quantity * price);
        total += isNumber(priceTotal) ? priceTotal : 0;
        var quantityTotal = calculateQuantity(unity, quantity)
        var real = numberToReal(priceTotal);
        $(this).find('.total_price').text(real ? real : "");
        $(this).find('.total_quantity').text(quantityTotal ? quantityTotal : "0");   
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