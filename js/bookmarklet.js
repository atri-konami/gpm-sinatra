(function(){
    var song = document.querySelector('#currently-playing-title');
    var artist = document.querySelector('#player-artist');
    var album = document.querySelector('.player-album');
    var img = document.querySelector('img[slot=image]');
    if (!song || !artist || !img) {
        alert('Please play music.');
        return;
    }
    if (!album) {
        album = '';
    } else {
        album = ' in ' + album.innerHTML;
    }
    song = song.innerHTML;
    artist = artist.innerHTML;
    img = img.src.split('=')[0];
    var text = encodeURIComponent('Now playing: ' + song + ' - ' + artist + album + ' #NowPlaying #GPMNowPlaying');
    window.open('https://gpm.atri-konami.mydns.jp/?text=' + text + '&img_url=' + img, '', 'width=550, height=420');
})();
