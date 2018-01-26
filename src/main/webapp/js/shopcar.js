function add(goodsId, goodsNum) {
	var goods = {
		"goodsId" : goodsId,
		"goodsNum" : goodsNum
	};
	var data
	if ($.cookie("shopcar") == null) {// 表明第一次加入到购物车
		data = [];
		data.push(goods);
	} else {
//		data = getCookie();
		addGoods(data, goods);
	}
	$.cookie("shopcar", JSON.stringify(data));
}

/* 从cookie中的到shopcar的值 */
function getCookie() {
	var goodses = $.cookie("shopcar");
	if (goodses == null) {
		return [];
	}
	return JSON.parse(goodses);
}

/* 将goods添加到goodses中 */
function addGoods(goodses, goods) {
	for (var i = 0; i < goodses.length; i++) {
		if (goods.goodsId == goodses[i].goodsId) {
			goodses[i].goodsNum = parseInt(goodses[i].goodsNum)
					+ parseInt(goods.goodsNum);
			return;
		}
	}
	goodses.push(goods);
}
/*
 * 将src的JSON数据加到target的JSON 中
 */
function addJSON(target, src) {
	for ( var p in src) {
		target[p] = src[p];
	}
}

/**
 * 通过goodsId得到对应的goodsNum
 * @param goodses
 * @param goodsId
 * @returns
 */
function getGoodsNumById(goodses, goodsId) {
	for (var i = 0; i < goodses.length; i++) {
		if (goodsId == goodses[i].goodsId) {
			return goodses[i].goodsNum;
		}
	}

}