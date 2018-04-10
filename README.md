# gpm-sinatra
GooglePlayMusicのNowPlayingをTweet

# (現在の)動作環境
OS: Ubuntu 17.10
Webサーバ: nginx/1.12.1 (Ubuntu) built with OpenSSL 1.0.2g  1 Mar 2016
Ruby: 2.5.1
Webブラウザ: バージョン: 65.0.3325.181（Official Build） （64 ビット）

# 利用方法(クライアント)

1. [Google Play Music](https://play.google.com/music/listen)にアクセス

2. 任意の音楽を再生する![Imgur](https://i.imgur.com/VBaK4vS.png)

3.[bookmarklet](javascript:!function(){var a=document.querySelector("#currently-playing-title").innerHTML,b=document.querySelector("#player-artist").innerHTML,c=document.querySelector(".player-album").innerHTML,d=document.querySelector("img[slot=image]").src.split("=")[0],e=encodeURIComponent("Now playing: "+a+" - "+b+" in "+c+" #NowPlaying");window.open("http://gpm.atri-konami.mydns.jp/?text="+e+"&img_url="+d,"","width=550, height=420")}();)をブックマークに登録して，実行する

4. Twitterの認証を行う

5. Tweetする![Imgur](https://i.imgur.com/W9cyStr.png)

# 利用方法(サーバ)

Under construction.

# License
MIT
