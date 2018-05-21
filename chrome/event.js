chrome.tabs.onUpdated.addListener(
    (tabId, changeInfo, tab) => {
        if (tab.url.includes("https://play.google.com")){
            chrome.pageAction.show(tabId);
        }
    });

chrome.pageAction.onClicked.addListener(
    (tab) => {
        chrome.tabs.sendMessage(
            tab.id,
            {
                clicked: true
            },
            (res) => { 
                console.log(res);
                if (res.ok) {
                    window.open('https://gpm.atri-konami.mydns.jp/?text=' + res.text + '&img_url=' + res.img, '', 'width=550, height=420');
                }
            }
        );
    });
