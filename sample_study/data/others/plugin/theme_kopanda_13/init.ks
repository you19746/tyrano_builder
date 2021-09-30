;--------------------------------------------------------------------------------
; ティラノスクリプト テーマプラグイン theme_kopanda_13
; 作者:こ・ぱんだ
; https://kopacurve.blog.fc2.com/
;--------------------------------------------------------------------------------

[iscript]

mp.font_color    = mp.font_color    || "0x4c4741";
mp.name_color    = mp.name_color    || "0xadd8d8";
mp.frame_opacity = mp.frame_opacity || "255";
mp.font_color2   = mp.font_color2   || "0x4c4741";
mp.glyph         = mp.glyph         || "off";

// Config.tjsで既読テキストのフォントカラーを「default」にしている場合はmp.font_color2は反映されません
if(TG.config.alreadyReadTextColor != "default"){
	TG.config.alreadyReadTextColor = mp.font_color2;
}

[endscript]

; 名前部分のメッセージレイヤ削除
[free name="chara_name_area" layer="message0"]

; メッセージウィンドウの設定
[position layer="message0" width="1152" height="207" top="495" left="64"]
[position layer="message0" frame="../others/plugin/theme_kopanda_13/image/frame_message.png" margint="55" marginl="160" marginr="150" opacity="&mp.frame_opacity" page="fore"]

; 名前枠の設定
[ptext name="chara_name_area" layer="message0" color="&mp.name_color" size="24" x="175" y="505" width="420"]
[chara_config ptext="chara_name_area"]

; デフォルトのフォントカラー指定
[font color="&mp.font_color"]
[deffont color="&mp.font_color"]

; クリック待ちグリフの設定（on設定時のみ有効）
[if exp="mp.glyph == 'on'"]
[glyph line="../../../data/others/plugin/theme_kopanda_13/image/system/nextpage.gif"]
[endif]

;=================================================================================

; 機能ボタンを表示するマクロ

;=================================================================================
; 機能ボタンを表示したいシーンで[add_theme_button]と記述してください（消去は[clearfix]タグ）

[macro name="add_theme_button"]

; 歯車ボタン（メニューボタン）非表示
[hidemenubutton]

; クイックセーブボタン
[button name="role_button" role="quicksave" graphic="../others/plugin/theme_kopanda_13/image/button/qsave.png" enterimg="../others/plugin/theme_kopanda_13/image/button/qsave2.png" x="388" y="675"]

; クイックロードボタン
[button name="role_button" role="quickload" graphic="../others/plugin/theme_kopanda_13/image/button/qload.png" enterimg="../others/plugin/theme_kopanda_13/image/button/qload2.png" x="482" y="675"]

; セーブボタン
[button name="role_button" role="save" graphic="../others/plugin/theme_kopanda_13/image/button/save.png" enterimg="../others/plugin/theme_kopanda_13/image/button/save2.png" x="576" y="675"]

; ロードボタン
[button name="role_button" role="load" graphic="../others/plugin/theme_kopanda_13/image/button/load.png" enterimg="../others/plugin/theme_kopanda_13/image/button/load2.png" x="654" y="675"]

; オートボタン
[button name="role_button" role="auto" graphic="../others/plugin/theme_kopanda_13/image/button/auto.png" enterimg="../others/plugin/theme_kopanda_13/image/button/auto2.png" x="732" y="675"]

; フルスクリーン切替ボタン
[button name="role_button" role="fullscreen" graphic="../others/plugin/theme_kopanda_13/image/button/screen.png" enterimg="../others/plugin/theme_kopanda_13/image/button/screen2.png" x="810" y="675"]

; メニュー呼び出しボタン
[button name="role_button" role="menu" graphic="../others/plugin/theme_kopanda_13/image/button/menu.png" enterimg="../others/plugin/theme_kopanda_13/image/button/menu2.png" x="906" y="675"]

; コンフィグボタン
[button name="role_button" role="sleepgame" graphic="../others/plugin/theme_kopanda_13/image/button/sleep.png" enterimg="../others/plugin/theme_kopanda_13/image/button/sleep2.png" storage="../others/plugin/theme_kopanda_13/config.ks" x="988" y="675"]

; タイトルに戻るボタン
[button name="role_button" role="title" graphic="../others/plugin/theme_kopanda_13/image/button/title.png" enterimg="../others/plugin/theme_kopanda_13/image/button/title2.png" x="1080" y="675"]

; メッセージウィンドウ非表示ボタン
[button name="role_button" role="window" graphic="../others/plugin/theme_kopanda_13/image/button/close.png" enterimg="../others/plugin/theme_kopanda_13/image/button/close2.png" x="1165" y="675"]

; スキップボタン
[button name="role_button" role="skip" graphic="../others/plugin/theme_kopanda_13/image/button/skip.png" enterimg="../others/plugin/theme_kopanda_13/image/button/skip2.png" x="1183" y="570"]

; バックログボタン
[button name="role_button" role="backlog" graphic="../others/plugin/theme_kopanda_13/image/button/log.png" enterimg="../others/plugin/theme_kopanda_13/image/button/log2.png" x="32" y="570"]


[endmacro]

;=================================================================================

;　システムで利用するHTML,CSSの設定

;=================================================================================
; セーブ画面
[sysview type="save" storage="./data/others/plugin/theme_kopanda_13/html/save.html"]

; ロード画面
[sysview type="load" storage="./data/others/plugin/theme_kopanda_13/html/load.html"]

; バックログ画面
[sysview type="backlog" storage="./data/others/plugin/theme_kopanda_13/html/backlog.html"]

; メニュー画面
[sysview type="menu" storage="./data/others/plugin/theme_kopanda_13/html/menu.html"]

; CSS
[loadcss file="./data/others/plugin/theme_kopanda_13/ts13.css"]


;=================================================================================

;　テストメッセージ出力プラグインの読み込み

;=================================================================================
[loadjs storage="plugin/theme_kopanda_13/testMessagePlus/gMessageTester.js"]
[loadcss file="./data/others/plugin/theme_kopanda_13/testMessagePlus/style.css"]

[macro name="test_message_start"]
[eval exp="gMessageTester.create()"]
[endmacro]

[macro name="test_message_end"]
[eval exp="gMessageTester.destroy()"]
[endmacro]

[macro name="test_message_reset"]
[eval exp="gMessageTester.currentTextNumber=0;gMessageTester.next(true)"]
[endmacro]

[return]
