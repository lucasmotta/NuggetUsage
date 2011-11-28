function shareFacebook(p_width, p_height) {

    var d = document;
    var f = "http://www.facebook.com/share";
    var l = d.location;
    var e = encodeURIComponent;
    var t = d.title;
    var p = ".php?src=bm&v=4&i=1277427231&u=" + e(l.href) + "&t=" + e(t);
    var w = p_width || 620;
    var h = p_height || 320;
    var left = (screen.width * .5) - (w * .5);
    var top = (screen.height * .5) - (h * .5);

    try {

        if (!/^(.*.)?facebook.[^.]*$/.test(l.host))
        throw (0);

        share_internal_bookmarklet(p);

    } catch(z) {

        a = function() {
            if (!window.open(f + "r" + p, "sharer", "toolbar=0,status=0,resizable=1,top=" + top + ", left=" + left + ",width=" + w + ",height=" + h + "'"))
            l.href = f + p
        };

        if (/Firefox/.test(navigator.userAgent))
        setTimeout(a, 0);
        else
        a();
    }

    void(0);

}

function shareTwitter(p_url, p_tweet, p_width, p_height) {

    var d = document;
    var f = "http://twitter.com/share";
    var l = p_url;
    var e = encodeURIComponent;
    var t = unescape(p_tweet);
    var p = '?url=' + e(l) + '&text=' + e(t);
    var w = p_width || 620;
    var h = p_height || 320;
    var left = (screen.width * .5) - (w * .5);
    var top = (screen.height * .5) - (h * .5);

    try {

        if (!/^(.*.)?twitter.[^.]*$/.test(l.host))
        throw (0);

        share_internal_bookmarklet(p);

    } catch(z) {

        a = function() {
            if (!window.open(f + p, "twitter", "toolbar=0,status=0,resizable=1,top=" + top + ", left=" + left + ",width=" + w + ",height=" + h + "'"))
            l.href = f + p;
        };

        if (/Firefox/.test(navigator.userAgent))
        setTimeout(a, 0);
        else
        a();
    }

    void(0);

}