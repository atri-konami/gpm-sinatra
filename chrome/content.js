chrome.runtime.onMessage.addListener(
    (req, sender, sendResponse) => {
        if (req.clicked) {
            let song = document.querySelector('#currently-playing-title');
            let artist = document.querySelector('#player-artist');
            let album = document.querySelector('.player-album');
            let img = document.querySelector('img[slot=image]');

            if (!song || !artist || !img) {
                alert('Please play music.');
                sendResponse({
                    ok: false
                });

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

            let text = encodeURIComponent('Now playing: ' + song + ' - ' + artist + album + ' #NowPlaying #GPMNowPlaying');
            sendResponse({
                ok: true,
                text: text,
                img: img
            });
        }
    }
);
