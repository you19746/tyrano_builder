; 2018.06.16 ko10panda edit
;=======================================================================================================================

;　ランダム値取得プラグイン v100

;=======================================================================================================================

; 指定した範囲内からランダムでひとつ整数を取り出します。
; 範囲の最小値と最大値、実行回数、取得する値の種類、結果の表示方法など指定が可能です。

;-----------------------------------------------------------------------------------------------------------------------

; 使用できるパラメータ

;-----------------------------------------------------------------------------------------------------------------------
;
;      var_name：取得したランダム値を格納する変数名(初期値 tf.rand)　
;           min：範囲の最小値。整数を指定すること。マイナス値も指定可。初期値１
;           max：範囲の最大値。整数を指定すること。マイナス値も指定可。初期値6
;         count：実行回数。1以上の整数を指定すること。初期値1

;          type：取得したランダム値から何を求めるか（ここで設定した値を var_name に書いた変数に代入）
;      	  　   sum:取得した値の合計値を求める（初期値）
;             min:取得した値の中で一番小さい値を求める
;             max:取得した値の中で一番大きい値を求める
;			  avg：取得した値の平均値を求める

;   show_result:結果を表示するか（表示したいときだけ true を指定）
;   show_detail：結果の詳細を表示するか（表示したいときだけ true を指定）
; detail_length：結果の詳細を最大で何個まで表示するか（初期値 10）　show_detailがfalseのときは無効
;	   push_log:結果を履歴に残すか（残したいときだけ true を指定）


;-----------------------------------------------------------------------------------------------------------------------

; 使用例

;-----------------------------------------------------------------------------------------------------------------------
; 例）範囲1～6、実行回数1、合計値を取得、結果はtf.randに格納、詳細・結果表示なし
; [intrandom]

; 例）範囲1～10、実行回数3、合計値を取得、結果はtf.diceに格納、結果表示あり
; [intrandom result="tf.dice" min="1" max="10" count="3" show_result="true"]

; 例）範囲-100～100、実行回数100、最小値を取得、詳細あり、詳細表示の最大数20、結果表示あり
; [intrandom min="-100" max="100" count="100" type="min" show_detail="true" detail_length="20" show_result="true"]

; 例）範囲1～10、実行回数6、合計値取得、詳細なし、結果表示なし、履歴に残す、結果はf.diceに格納
; [intrandom max="10" count="6" var_name="f.dice" push_log="true"]


;-----------------------------------------------------------------------------------------------------------------------

; マクロ定義

;-----------------------------------------------------------------------------------------------------------------------
[macro name="intrandom"]

	[iscript]

	/* -------------------------
		変数
	------------------------- */
	var rand = [],										// 取得したランダム値を格納しておく配列変数
		rand_copy,										// 上記のコピー（詳細表示用）
		type_text,										// 取得する値の種別を格納しておく変数
		rand_result,									// 結果（ユーザーが指定した変数にこれを代入）
		min           = mp.min           || '1',		// 範囲の最小値（指定がなければ「1」）
		max           = mp.max           || '6',		// 範囲の最大値（指定がなければ「6」）
		count         = mp.count         || '1',		// 実行回数（指定がなければ「1」）
		var_name      = mp.var_name      || 'tf.rand',	// 取得した値を代入する変数（指定がなければ「tf.rand」）
		type          = mp.type          || 'sum',		// 取得する値の種別（指定がなければ「sum」）
		detail_length = mp.detail_length || '10',		// 表示する詳細の最大数（指定がなければ「10」を指定）
		show_result   = mp.show_result   || 'false',    // 結果を表示するかどうか
		show_detail   = mp.show_detail   || 'false',    // 内訳を表示するかどうか
		push_log      = mp.push_log      || 'false';    // 履歴に結果を残すかどうか


	/* -------------------------
		文字列 -> 数値
	------------------------- */
		min           = parseInt( min );
		max           = parseInt( max );
		count         = parseInt( count );
		detail_length = parseInt( detail_length );


	/* -------------------------
		入力値のチェックと修正
	------------------------- */
		if( min > max ){
			min = [max, max = min][0];
		}
		
		count = count < 1 ? 1 : count;

		detail_length = detail_length < 1 ? 1 : detail_length;


	/* -------------------------
		ランダム値取得
	------------------------- */
		rand = (function(count, min, max){
			var ary = [];
				for( var i=0; i < count; i++ ){
					var rnd = Math.floor( Math.random() * ( max + 1 - min )) + min;
					ary.push( rnd );
				}
			return ary;
		})( count, min, max );


	/* -------------------------
		結果表示用のテキスト作成
	------------------------- */
		rand_copy = [].concat( rand );

		if( rand_copy.length > detail_length ){
			rand_copy.length = detail_length;
			rand_copy.push('...');
		}

		rand_copy = '[' + rand_copy.join(",") + ']';


	/* -------------------------
		最小値を求めたいとき
	------------------------- */
		if( type == "min" ) {
			rand_result = Math.min.apply( null, rand );
		}


	/* -------------------------
		最大値を求めたいとき
	------------------------- */
		if( type == "max" ) {
			rand_result = Math.max.apply( null, rand );
		}


	/* -------------------------
		合計値を求めたいとき
	------------------------- */
		if( type == "sum" || type == "avg" ) {
			rand_result = (function( ary ){
				return ary.reduce(function( prev, current, i, ary ){
					return prev + current;
				})
			})( rand );
	

	/* -------------------------
		平均値を求めたいとき
	------------------------- */
			if( type == "avg" ){
				rand_result = Math.round( rand_result / rand.length );
			}
		};


	/* -------------------------
		結果代入
	------------------------- */
		TYRANO.kag.evalScript( var_name + '=' + rand_result + ';' );

		tf.txt_detail = '内訳：'　+ rand_copy;   // 内訳：[x,x,x,x,x,x,x,x,x,x...]
		tf.txt_result = '結果：【'　+ rand_result + '】'; // 結果：xx

	[endscript]

	[nowait]
	[nolog]

; //	trueのときだけ詳細を表示（detail_lengthの長さぶんだけ表示）
		[if exp="mp.show_detail == 'true'"]
		[emb exp="tf.txt_detail"][r]
		[endif]

; //	trueのときだけ結果表示
		[if exp="mp.show_result == 'true'"]
		[emb exp="tf.txt_result"]
		[endif]

	[endnolog]
	[endnowait]

;// 	バックログに結果を残す場合のみ実行
		[if exp="mp.push_log == 'true'"]
		[pushlog text="&'ランダム値取得　' + tf.txt_result"]
		[endif]

[endmacro]



;-----------------------------------------------------------------------------------------------------------------------

; D66マクロ

;-----------------------------------------------------------------------------------------------------------------------
; D66とは6面ダイスを２個振り、片方の出目を十の位に、もう片方の出目を一の位に見立てて
; 11～66の数字をランダムで取得するというシステムです。TRPGで使用されることが多いです。

;-----------------------------------------------------------------------------------------------------------------------

; 使用できるパラメータ

;-----------------------------------------------------------------------------------------------------------------------
;    var_name：結果を格納する変数名（初期値 tf.rand）
; show_result：結果を表示するかどうか（指定する場合のみ true を指定）
; show_detail：詳細を表示するかどうか（指定する場合のみ true を指定）
;    push_log：履歴に結果を残すかどうか（残す場合のみ true を指定）

;-----------------------------------------------------------------------------------------------------------------------

; 使用例

;-----------------------------------------------------------------------------------------------------------------------
; 結果はtf.diceに格納、結果表示あり、詳細表示あり、履歴表示あり
; [dice_d66 var_name="tf.dice" show_result="true" show_detail="true" push_log="true"]

; 結果はf.diceに格納、結果表示あり、詳細表示なし、履歴表示なし
; [dice_d66 var_name="f.dice" show_result="true"]


;-----------------------------------------------------------------------------------------------------------------------

; マクロ定義

;-----------------------------------------------------------------------------------------------------------------------
[macro name="dice_d66"]

	[iscript]

	var dice = [],
		result,
		min          = 1,
		max          = 6,
		count        = 2,
		var_name     = mp.var_name     || 'tf.rand',
		show_result  = mp.show_result  || 'false',
		show_detail  = mp.show_detail  || 'false',
		push_log     = mp.push_log     || 'false';

		dice = (function(count, min, max){
			var ary = [];
				for( var i=0; i < count; i++ ){
					var rnd = Math.floor( Math.random() * ( max + 1 - min )) + min;
					ary.push( rnd );
				}
			return ary;
		})( count, min, max );

		tf.txt_dice1 = dice[0]; // １回目の出目
		tf.txt_dice2 = dice[1]; // ２回目の出目

//		dice.sort(); // 出目の小さい方を十の位に固定する場合はコメントアウトを外す

 		result = dice[0] * 10 + dice[1]; // 結果
		tf.txt_result = result; // 表示用テキスト

		TYRANO.kag.evalScript( var_name + '=' + result + ';' ); // 変数に結果を代入

	[endscript]

	[nowait]
	[nolog]

; //	詳細表示をするときのみ実行
		[if exp="mp.show_detail == 'true'"]
		[emb exp="'１回目の出目：【' + tf.txt_dice1 + '】'"][r]
		[emb exp="'２回目の出目：【' + tf.txt_dice2 + '】'"][r]	
		[endif]

; //	結果表示をするのみ実行
		[if exp="mp.show_result == 'true'"]
		[emb exp="'結果：【' + tf.txt_result + '】'"]
		[endif]

	[endnolog]
	[endnowait]

; //	バックログに結果を残すときのみ実行
		[if exp="mp.push_log == 'true'"]
		[pushlog text="&'D66　結果：【' + tf.txt_result + '】'"]
		[endif]

[endmacro]

;-----------------------------------------------------------------------------------------------------------------------
[return]
