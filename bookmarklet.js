(function(){
    var song = document.querySelector("#currently-playing-title").innerHTML;
    var artist = document.querySelector("#player-artist").innerHTML;
    var album = document.querySelector(".player-album").innerHTML;
    var img = document.querySelector("img.image").src.split('=')[0];
    var text = encodeURIComponent("Now playing: " + song + " - " + artist + " in " + album + " #NowPlaying");
    window.open('http://gpm.atrikona.ml/?text=' + text + '&img_url=' + img, '', 'width=550, height=420');
})();
