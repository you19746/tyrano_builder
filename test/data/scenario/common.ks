;ティラノスクリプトサンプルゲーム

*start

[cm  ]
[clearfix]
[start_keyconfig]

; 背景表示
[bg storage="common.jpg" time="3000"]

; SE
[fadeinbgm storage="musi2.mp3" loop="true" time="1000"]

; システムボタンの表示
[add_theme_button]

;メッセージウィンドウの設定
[position layer="message0" page=fore visible=true]

;メッセージウィンドウの表示
@layopt layer=message0 visible=true

;文字が表示される領域を調整
[position layer="message0" page="fore" marginr="200" marginb="20"]

#
ノベルゲーム開発テスト全集です。[p][click]
読みたいシナリオを選択してください。[l][click]

*main
[glink name="se01" storage=scene1.ks color="ts11" width="420" x="200" y="100" text="サンプルゲーム"]
[glink name="se01" storage=wishOfF.ks color="ts11" width="420" x="640" y="100" text="F氏の願い"]
[glink name="se01" storage=Euthanasia.ks color="ts11" width="420" x="200" y="200" text="安楽死薬"]
[glink name="se01" storage=Euthanasia.ks color="ts11" width="420" x="640" y="200" text="安楽死薬"]
[glink name="se01" storage=Euthanasia.ks color="ts11" width="420" x="200" y="300" text="安楽死薬"]
[glink name="se01" storage=Euthanasia.ks color="ts11" width="420" x="640" y="300" text="安楽死薬"]
[glink name="se01" target="*next1" color="ts11" width="300" x="640" y="400" text="次へ→"]
[s]

*next1
[glink name="se01" storage=scene1.ks color="ts11" width="420" x="200" y="100" text="あああ"]
[glink name="se01" storage=wishOfF.ks color="ts11" width="420" x="640" y="100" text="いいい"]
[glink name="se01" storage=Euthanasia.ks color="ts11" width="420" x="200" y="200" text="ううう"]
[glink name="se01" storage=Euthanasia.ks color="ts11" width="420" x="640" y="200" text="えええ"]
[glink name="se01" storage=Euthanasia.ks color="ts11" width="420" x="200" y="300" text="おおお"]
[glink name="se01" storage=Euthanasia.ks color="ts11" width="420" x="640" y="300" text="かかか"]
[glink name="se01" target="*main" color="ts11" width="300" x="320" y="400" text="←前へ"]
[glink name="se01" target="*next1" color="ts11" width="300" x="640" y="400" text="次へ→"]
[s]