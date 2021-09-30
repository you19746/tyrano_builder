; 目パチプラグイン　v1.0
; 作者:なるとりっく
; http://buddycollection.web.fc2.com/

;目ぱちに必要なjsライブラリを読み込み
[loadjs storage="imagesloaded.pkgd.min.js"]

;キャラを退場させて再度登場させたとき、表情を引き継ぐように設定
;これはchara_blinkを使用する際の制約です
[chara_config memory=true]

[iscript]

// 指定されたキャラの目ぱちを開始
blinkStart = function (charaName) {
	var self = this;

	// 目の状態を変更する間隔
	var idleTime = 1000;

	//　現在の目の状態　open:通常の開き目 middle:中目　close:閉じ目
	var blinkFlag = "open";

	// 指定されたキャラの目ぱち実行フラグ
	if (!f['chara_blink']) f['chara_blink'] = {};
	if (!f['chara_blink'][charaName]) f['chara_blink'][charaName] = {};
	f['chara_blink'][charaName]["isBlink"] = true;

	var blink = function () {

		//　キャラのimage要素を取得
		var $chara = $(".layer_fore").find("." + charaName);

		// キャラの現在の表情取得
		var currentStorage = self.kag.stat.charas[charaName]["storage"];

		// 目ぱち画像パス取得
		var closeImage = self.kag.stat.charas[charaName]["map_face"][currentStorage + "close_eyes"];
		var middleImage = self.kag.stat.charas[charaName]["map_face"][currentStorage + "middle_eyes"];
		var openImage = currentStorage;
		var storageUrl;

		//目ぱち実行フラグがtrueじゃない場合は実行しない
		var isBlink = f['chara_blink'][charaName]["isBlink"];
		if (!isBlink) {
			$chara.attr("src", "./data/fgimage/" + openImage);
			return;
		}

		// 中目と閉じ目が登録してあれば目ぱち実行
		if (closeImage && middleImage) {
			// 開き目の場合は閉じ目へ
			if (blinkFlag == "open") {
				storageUrl = closeImage;
				blinkFlag = "close";
				idleTime = 100;
			}

			// 閉じ目の場合は中目へ
			else if (blinkFlag == "close") {
				storageUrl = middleImage;
				blinkFlag = "middle";
				idleTime = 50;
			}

			// 中目の場合は開き目へ
			else if (blinkFlag == "middle") {
				storageUrl = openImage;
				blinkFlag = "open";

				// 2~4秒に一回くらいまばたきする
				idleTime = Math.round(Math.random()*2000) + 2000;
			}

			$chara.imagesLoaded(function　() {
				tf['system']['chara_blink'][charaName]["timeout_id"] = setTimeout(blink, idleTime);
	    	});

			$chara.attr("src", "./data/fgimage/" + storageUrl);
		}

		// 中目と閉じ目が登録されていない表情の場合は目ぱちしない
		// 中目と閉じ目が登録されている表情になったときのために一秒後に再試行する
		else {
			idleTime = 1000;
			tf['system']['chara_blink'][charaName]["timeout_id"] = setTimeout(blink, idleTime);
		}
	};

	// 目ぱち実行中フラグ
	// 既に実行中の場合は実行しない
	if (!tf['system']['chara_blink']) tf['system']['chara_blink'] = {};
	if (!tf['system']['chara_blink'][charaName]) tf['system']['chara_blink'][charaName] = {};
	var isBlinking = tf['system']['chara_blink'][charaName]["isBlinking"];
	if (!isBlinking) {
		blink();
		tf['system']['chara_blink'][charaName]["isBlinking"] = true;
	}
}

// 指定されたキャラの目ぱち実行フラグを折る
blinkEnd = function (charaName) {

	if (!f['chara_blink']) f['chara_blink'] = {};
	if (!tf['system']['chara_blink']) tf['system']['chara_blink'] = {};
	if (!f['chara_blink'][charaName]) f['chara_blink'][charaName] = {};
	if (!tf['system']['chara_blink'][charaName]) tf['system']['chara_blink'][charaName] = {};

	if (f['chara_blink'] && tf['system']['chara_blink']) {

		// 目パチ処理をキャンセル
		clearTimeout(tf['system']['chara_blink'][charaName]["timeout_id"]);

		// 指定されたキャラの目ぱち実行フラグを折る
		f['chara_blink'][charaName]["isBlink"] = false;

		// 指定されたキャラの目ぱち実行中フラグを折る
		tf['system']['chara_blink'][charaName]["isBlinking"] = false;
	}
}

[endscript]



;--------------------
;---目ぱちの登録マクロ----
;--------------------
[macro name="chara_blink"]

;キャラ名、表情、閉じ目画像、中目画像の登録は必須
[if exp="!mp.name"]
[eval exp="alert('chara_blink_new　　nameは必須です')"]
[return]
[endif]

[if exp="!mp.face"]
[eval exp="alert('chara_blink_new　　faceは必須です')"]
[return]
[endif]

[if exp="!mp.close_eyes"]
[eval exp="alert('chara_blink_new 　close_eyesは必須です')"]
[return]
[endif]

[if exp="!mp.middle_eyes"]
[eval exp="alert('chara_blink_new 　middle_eyesは必須です')"]
[return]
[endif]

[iscript]
if (!(this.stat.charas[mp.name]) ||
	!(this.stat.charas[mp.name]["map_face"][mp.face])) {
    alert("chara_blink_new　　指定されたキャラクター「" + mp.name + "」もしくはface:「" + mp.face + "」は定義されていません。もう一度確認をお願いします");
}
else {
	// 表情に対する中目と閉じ目を紐づけ
	var storage = this.stat.charas[mp.name]["map_face"][mp.face];
	this.stat.charas[mp.name]["map_face"][storage + "close_eyes"] = mp.close_eyes;
	this.stat.charas[mp.name]["map_face"][storage + "middle_eyes"] = mp.middle_eyes;
}
[endscript]

[endmacro]





;-------------------
;---目ぱち開始マクロ----
;-------------------
[macro name="chara_blink_start"]

;キャラ名は必須
[if exp="!mp.name"]
[eval exp="alert('chara_blink_new　　nameは必須です')"]
[return]
[endif]

[iscript]
if (!(this.stat.charas[mp.name])) {
    alert("指定されたキャラクター「" + mp.name + "」は定義されていません。もう一度確認をお願いします");
}
else {

	blinkStart.call(this, mp.name);
}

	
[endscript]
[endmacro]




;-------------------
;---目ぱち終了マクロ----
;-------------------
[macro name="chara_blink_end"]

;キャラ名は必須
[if exp="!mp.name"]
[eval exp="alert('chara_blink_new　　nameは必須です')"]
[return]
[endif]

[iscript]

// 指定されたキャラの目ぱち実行フラグを折る
blinkEnd.call(this, mp.name);

[endscript]

[endmacro]




;-------------------
;---目ぱち再開マクロ----
;-------------------
[macro name="chara_blink_resume"]

;キャラ名は必須
[if exp="!mp.name"]
[eval exp="alert('chara_blink_new　　nameは必須です')"]
[return]
[endif]

[iscript]

var nameArray = mp.name.split(',');

for (var i = 0; i < nameArray.length; i++) {
	var charaName = nameArray[i];
	if (!f['chara_blink']) f['chara_blink'] = {};
	if (!f['chara_blink'][charaName]) f['chara_blink'][charaName] = {};

	// 目ぱち実行フラグが立っていれば目ぱち開始
	if (f['chara_blink'][charaName]['isBlink']) {
		blinkStart.call(this, charaName);
	}

	// 目ぱち実行フラグが立っていない場合は目パチ終了
	else {
		blinkEnd.call(this, charaName);
	}
}
[endscript]

[endmacro]

[return]


