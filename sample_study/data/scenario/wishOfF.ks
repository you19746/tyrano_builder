*start

; 初期化

[stopse]
[stopbgm]
[cm]
[clearfix]
[start_keyconfig]

; 背景表示
[bg storage="wishOfF/scene1.jpg" time="1000"]

; BGM
[playbgm storage="異端審問.mp3"]

; SE
[playse storage="zattou.mp3"]

; ウインドウ表示
[layopt layer="message0" visible="true"]

;文字が表示される領域を調整
[position layer="message0" page="fore" marginr="200"]

[wait time=1000]

; キャラ設定
[chara_new name="rouba" storage="chara/rouba.png" jname="老婆"]

; メッセージ
エフ氏は全くもって運のない人生を歩んできた。[p][click]
今までくじ引きの類で当たりを引いたことはなかったし、おみくじなんかを引いた日には全て凶だった。[p][click]
周りの人は面白がって、逆に運がいいんじゃないかと言ったが、[l][r][click]
エフ氏にとってそれは何の慰めにもならなかった。[p][click]

; 背景切り替え
[bg storage="wishOfF/scene2.jpg" time="1000" method="fadeIn"]

; メッセージ
ある日、会社から帰ってくる道の途中でエフ氏の足元に鳥のフンが落ちてきた。[p][click]
鳥のフンが落ちてくるのはエフ氏にとってはもはや日常であった。[l][click]会社への行きの道ではなく帰りであったのはちょっと運がいいぐらいだ。[p][click]
しかし、そんなことを考えながら歩いていると、[l][r][click]

; サウンド
[playse storage="crash.mp3" buf="1"]
[wait time=1000]

; 背景切り替え
[bg storage="wishOfF/scene3.jpg" time="1000" method="fadeIn"]

; メッセージ
エフ氏の身体に急に衝撃が走った。[p][click]
交差点で自転車と接触したのだ。[p][click]

痛みにうずくまっていると、すぐにその自転車に乗っていた老婆が自転車から降りてきた。[p][click]

; キャラ表示
[chara_show name="rouba" time="1000" width="1000" height="1298" left="272" top="-25"]

; キャラ
; メッセージ
#老婆
申し訳ございません。お兄さん、大丈夫ですか？[p][click]
#エフ氏
大丈夫です。私の運が悪いだけですので、お気になさらないよう[p][click]
#老婆
いえ、私の不注意です。救急車をお呼びしましょうか？[p][click]
#エフ氏
大丈夫です。そんなに痛くないので[p][click]

; サウンド
#
そう言ってエフ氏は立ち上がり、その老婆に会釈した。[p][click]
エフ氏がそのままそこを立ち去ろうとすると、老婆がエフ氏の後ろからまた声をかけた。[p][click]

; メッセージ
#老婆
本当にすみません。償いとして何か願い事をひとつ叶えてあげます[p][click]
#
エフ氏は耳を疑いながら振り返った。[p][click]
#エフ氏
願い事、ですか？[p][click]
#老婆
はい、願い事です。私はどんな願いでも叶えてあげられます[p][click]

; キャラ非表示
[chara_hide name="rouba" time="100"]
; BGM
; 背景切り替え
[bg storage="wishOfF/scene4.jpg" time="1000" method="fadeIn"]
#
エフ氏は少しだけ頭にきた。[p][click]
自転車でひかれるだけならまだしも、さらに馬鹿にされているのだ。[l][r][click]
願い事が叶うなんて、そんなことはあり得るはずがないのだ。[p][click]

; 背景切り替え
[bg storage="wishOfF/scene3.jpg" time="1000" method="fadeIn"]
; キャラ表示
[chara_show name="rouba" time="1000" width="1000" height="1298" left="272" top="-25"]

#エフ氏
おばあさん。おばあさんこそ大丈夫ですか？[l][r][click]
病院に行った方がいいのではないですか？[p][click]
#老婆
願い事が叶うというのは本当です。[l][r][click]
ひとつだけおっしゃってください[p][click]
#
エフ氏は老婆が大真面目な顔をしているのを見て、真面目に取り合うのがアホらしくなった。[p][click]
そこで適当に願い事を言ってみることにした。[p][click]

; キャラ非表示
[chara_hide name="rouba" time="100"]
; 背景切り替え
[bg storage="wishOfF/scene5.jpg" time="1000" method="fadeIn"]

#エフ氏
うーん、それなら私はコーラが好きだから、家の中の水という水を全てコーラにしてくれ。[p][click]
洗面台の水も、お風呂の水も、全ての水をコーラにしたい」[p][click]
#老婆
お兄さんが生きている間中ずっとコーラにした方がいいですか？[p][click]
#エフ氏
そうしてくれるとありがたいよ[p][click]
#老婆
分かりました。それではその願い事叶えます。[l][r][click]
先ほどの事故はすみませんでした[p][click]
#
そう言って老婆はその曲がった腰をさらに曲げて頭を下げた。[p][click]

エフ氏はようやく老婆との無駄な会話から解放され、帰り道を急いだ。[l][r][click]こんな日には全てを忘れて晩酌をするに限る。[p][click]

; キャラ非表示
[chara_hide name="rouba"]
; サウンド停止
[stopse method="fadeOut"]
; 背景切り替え
[bg storage="wishOfF/scene6.jpg" time="1000" method="fadeIn"]
エフ氏は家に帰り、とりあえずコーラを一杯飲んだ。[l][r][click]
エフ氏は炭酸飲料が好きで、仕事終わりのコーラはエフ氏の日課だ。[p][click]

しかし、エフ氏の何よりの楽しみはお風呂での晩酌だ。[l][r][click]
湯船に浸かりながらのビールに勝るものはない。[p][click]

; サウンド
; 背景切り替え
[bg storage="wishOfF/scene7.jpg" time="1000" method="fadeIn"]
エフ氏は1日に訪れる唯一の至福の時を求めて、お風呂場に向かった。[p][click]

まずは湯船にお湯をためる必要がある。[l][r][click]
エフ氏が蛇口を回すと、黒く濁った水が湯船に勢いよく注がれた。[p][click]

#エフ氏
何だこれは。[p][click]

; サウンド
[playse storage="jaguchi.mp3" buf="1"]
#
何かの間違いかと、エフ氏は蛇口を目一杯開けた。[p][click]

; BGM
; 背景切り替え
[bg storage="wishOfF/scene8.jpg" time="1000" method="fadeIn"]

その黒色の液体が、湯船にぶつかると同時にしゅわしゅわと泡を出しているのを見て、エフ氏の血の気は引いた。[p][click]

#エフ氏
これはまさか[p][click]

; サウンドストップ
[stopse]
#
エフ氏はすぐさまトイレに向かった。[p][click]

; 背景切り替え
[bg storage="wishOfF/scene9.jpg" time="1000" method="fadeIn"]
; サウンド
[playse storage="toilet.mp3" buf="1"]
そこでトイレの水を流すと、すぐさま黒色の水が流れた。[l][r][click]
家の水という水が全てコーラに変わったのだ。[p][click]

; サウンド停止
[fadeoutse time="1000" buf="1"]

; 背景切り替え
[bg storage="wishOfF/scene10.jpg" time="1000" method="rotateInDownRight"]
頭のおかしいおばあさんだと思い軽くあしらったことをエフ氏はすぐさま後悔した。[p][click]
さらに、水をコーラに置き換えることが一生続くように願い事をしてしまったことを思い出し、エフ氏の血の気は引いた。[p][click]

願い事を叶えてくれる老婆に、こんな馬鹿な願い事をするなんて、つくづく運のないエフ氏であった。[p][click]
[fadeoutbgm time=3000]
[jump storage="common.ks"]