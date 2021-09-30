;一番最初に呼び出されるファイル

[title name="テストゲーム"]

[stop_keyconfig]

; ---------------
; プラグイン一覧
; ---------------

; テーマ※変える場合はケツの数字を↓に変える
; 【対応テーマ】06,07,09_1,09_2,11,13,14
[plugin name="theme_kopanda_11"]

; ptextタグで表示する文字列に装飾をほどこす
[plugin name="ptext_deco"]

; TIPS使う
[plugin name="tip"]

; メッセージボックスなどをフェードする
[plugin name="fade_frame"]

; メニュー画面に効果音を設定する
[plugin name="menu_se"]

; 文字列を整形する
[plugin name="format"]

; ランダム値を取得する
[plugin name="intrandom"]

; テキストボックスを拡張する
; [plugin name="textbox_ex"]

; デバッグツール
[plugin name="tsex"]

; ----ここまで----

; エンターボタンのSE設定
[macro name="click"]
[playse storage="click.mp3" buf="10"]
[endmacro]

; 各種ボタンのSE設定
[menu_se_set name="se01" clickse="enter.mp3" enterse="cursor.mp3" buf="11"]

;ティラノスクリプトが標準で用意している便利なライブラリ群
;コンフィグ、CG、回想モードを使う場合は必須
; @call storage="tyrano.ks"

;ゲームで必ず必要な初期化処理はこのファイルに記述するのがオススメ

;メッセージボックスは非表示
@layopt layer="message" visible=false

;メニューボタンを非表示にする
[hidemenubutton]

;タイトル画面へ移動
@jump storage="title.ks"

[s]


