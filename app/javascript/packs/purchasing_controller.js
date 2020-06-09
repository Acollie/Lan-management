var order=new Array();
let basket = 0;

$( document ).ready(function() {
    console.log(basket)
    $('.add').click(function (data) {
        addToOrder($(this).parent().parent().find('.item_id').html(), $(this).parent().parent().find('.number_input').val());

        var price= $(this).closest('tr').children('td.item_price').text()
        price = price.replace('£','');
        console.log(price);
        basket+= parseFloat(price);

        console.log(basket)
        display_values();
    });
    $('.remove').click(function (data) {
        RemoveFromOrder($(this).parent().parent().find('.item_id').html());
        var price= $(this).closest('tr').children('td.item_price').text()
        price=price.replace('£','')
        console.log(basket)

        basket-= parseFloat(price);
        display_values();
    });
    $('#Buy_now').click(function (data){
        console.log("here")
        $.ajax({url:"/purchasing/order_create",dataType:"json",type:"POST",data: {data_values:order},success:function (data) {
                window.location.href = "/purchasing/checkout"
            }
        });
    });
    $('#Pay_later').click(function (data){
        console.log("here")
        $.ajax({url:"/purchasing/order_create",dataType:"json",type:"POST",data: {data_values:order},success:function (data) {
                window.location.href = "/purchasing/cash"
            }
        });
    });
});
function display_values(){
    $("#basket").fadeOut(500);
    $('#basket').html("Value of basket " + basket).hide();
    $('#basket').append('<table><tr><th>Name</th><th>Quantity</th></tr></table>')
    for (var x in order){
        console.log(order[x])
        $('#basket tr:last').append("<tr><td>"+order[x].name+"</td><td>"+order[x].quantity+"</td></tr>")

    }
}
function addToOrder(item_id,quantity){
    for(var key in order){
        console.log(order[key].name)
    }
    var item={
        name:item_id,
        quantity:quantity
    };
    order.push(item)

}
function RemoveFromOrder(item_id){
    console.log(order);
    for(var key in order) {
        if(order[key].name==item_id){
            delete order[key];
        }
    }
    console.log(order)
}
