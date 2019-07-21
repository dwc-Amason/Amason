$(function(){
	/* 初期値の設定 */
	var priceBase = removeFigure($(".basePrice").text()); //基本価格を取得
	var Tax = 1.08; //加算する消費税の初期設定
	var priceTotal = priceBase * Tax; //基本価格と消費税から総額を計算
	var priceTax = priceBase * Tax - priceBase; //基本価格と消費税から総額を計算
	var basePrice = priceBase; //数量変更後の基本価格を変更

	$(".priceTotal").text(addFigure(priceTotal)); //総額を反映

	$(".options1 :checkbox").click(function(){ //チェックボックス
		optionsPrice = 0; //加算するオプション価格を初期化
		$(".options1 :checkbox:checked").each(function(){
			//指定された範囲の中にある、すべてのチェックされたチェックボックスと同じラベル内にある、.optionPriceのテキストを取得
			optionsPrice = optionsPrice + removeFigure($(this).parent("label").find(".optionPrice").text());
		});

		・・・

	});

	$("select.num").change(function(){
		//セレクトボックス内の選択されているoptionのdata-price属性を取得
		basePrice = removeFigure($(this).find("option:selected").attr("data-price"));

		・・・

	});

	/*-------------------------------
	カンマ処理
	-------------------------------*/
	function addFigure(str) {
		var num = new String(str).replace(/,/g, "");
		while(num != (num = num.replace(/^(-?\d+)(\d{3})/, "$1,$2")));
		return num;
	}

	function removeFigure(str) {
		var num = new String(str).replace(/,/g, "");
		num = Number(num);
		return num;
	}

});