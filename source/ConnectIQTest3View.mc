using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;

class ConnectIQTest3View extends WatchUi.WatchFace {

    private var oup;

    function initialize() {
        WatchFace.initialize();
    }

    function onLayout(dc) {
        oup = new OnUpdatePrinter();
        oup.init(dc);
    }

    function onShow() {
    }

    function onUpdate(dc) {
        oup.run(dc);
    }

    function onPartialUpdate(dc) {
        oup.runPartial(dc);
    }

    function onHide() {
    }

    function onExitSleep() {
    }

    function onEnterSleep() {
    }

}
