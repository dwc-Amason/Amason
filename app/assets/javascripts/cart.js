	var getPrice = function(){
		let subtotal = 0;
		for (let i = 0; i < $(".total").length; i++) {
			    subtotal += Number($(".total").eq(i).text())
			};
		$(".subtotal").text(subtotal)
		let tax = 0.08;
		let priceTax = subtotal * tax;
		$(".tax").text(priceTax);
		console.log(priceTax)
		let totalPrice = priceTax + subtotal
		$(".totalPrice").text(totalPrice)
	}

$(function(){
	getPrice();
	$(".num").change(function(){
		let id = $(this).attr('id').slice(-1);
		let base_price_class_name = "#basePrice_" + id;
		console.log(base_price_class_name);
		let price = $(base_price_class_name).text();
		let num = $(this).val();
		console.log(price);
		console.log(num);
		$("#total_" + id).text(price*num);
		getPrice();
	});
});

