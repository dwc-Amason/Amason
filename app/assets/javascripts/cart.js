//単価と個数を参照し総計を表示している関数
var setPrice = function () {
	$(".num").each(function (i, obj) {
		let id = $(obj).attr("id");
		let result = id.substr(4);
		let base_price_class_name = "#basePrice_" + result;
		let price = $(base_price_class_name).text();
		let num = $(obj).val();
		$("#total_" + result).text(price * num);
	});
};

//小計から消費税計算、合計値の参照をしている関数
var getPrice = function () {
	let subtotal = 0;
	for (let i = 0; i < $(".total").length; i++) {
		subtotal += Number(
			$(".total")
				.eq(i)
				.text()
		);
	}
	$(".subtotal").text(subtotal);
	let tax = 0.08;
	let priceTax = Math.ceil(subtotal * tax);
	$(".tax").text(priceTax);
	let totalPrice = priceTax + subtotal;
	$(".totalPrice").text(totalPrice);
	//オーダー確認画面部分。
	var totaltax = Math.ceil(subtotal * tax);
	$(".totaltax").text(totaltax);
	let ShippingCost = 500;
	$(".carriage").text(ShippingCost);
	var ordertotal = subtotal + totaltax + ShippingCost;
	$(".ordertotal").text(ordertotal);
};

//ページ読み込み時に動作する所
$(function () {
	setPrice();
	getPrice();
	//数値が変わった場合に動作する所
	$(".num").change(function () {
		setPrice();
		getPrice();
	});
});
