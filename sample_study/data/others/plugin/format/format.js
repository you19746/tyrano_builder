// 2018.07.28 ko10panda edit

/* 桁数を指定して右詰め＆ゼロ埋め */
paddingZero = function(num, digit){
	if(!num || typeof num !== 'number'){
		alert('引数numとdigitには《数値》を指定してください');
		 return num;
	}
	var zero = "0".repeat(digit);
	return (zero + num).slice(-digit);
}

/* ３ケタ区切りでカンマ付与 */
addComma = function(num){
	if(!num || typeof num !== 'number'){
		alert('引数numには《数値》を指定してください');
		return num;
	}
	return num.toLocaleString();
}


/* 全角 -> 半角変換 */
toHalfWidth = function(str){
	if(!str || typeof str !== 'string'){
		alert('引数strには《文字列》を指定してください');
		return str;
	}
	return str.replace(/./g, function(s){
		return String.fromCharCode(s.charCodeAt(0) - 0xFEE0);
	});
}


/* 半角 -> 全角変換 */
toFullWidth = function(str){
	if(!str || typeof str !== 'string'){
		alert('引数strには《文字列》を指定してください');
		return str;
	}
	return str.replace(/./g, function(s){
		return String.fromCharCode(s.charCodeAt(0) + 0xFEE0);
	});
}


/* 小文字 -> 大文字変換 */
toUpper = function(str){
	if(!str || typeof str !== 'string'){
		alert('引数strには《文字列》を指定してください');
		return str;
	}
	return str.toUpperCase();
}


/* 大文字 -> 小文字変換 */
toLower = function(str){
	if(!str || typeof str !== 'string'){
		alert('引数strには《文字列》を指定してください');
		return str;
	}
	return str.toLowerCase();
}


/* 先頭の文字だけ大文字に */
toCapitalize = function(str){
	if(!str || typeof str !== 'string'){
		alert('引数strには文字列を指定してください');
		return str;
	}
	return str.charAt(0).toUpperCase() + str.slice(1).toLowerCase();
}
