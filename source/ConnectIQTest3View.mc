using Toybox.System;
using Toybox.WatchUi;

var partialUpdatesAllowed = false;

class ConnectIQTest3View extends WatchUi.WatchFace {

    private var oup;

    function initialize() {
        WatchFace.initialize();
        partialUpdatesAllowed = (Toybox.WatchUi.WatchFace has :onPartialUpdate);
    }

    function onLayout(dc) {
        oup = new OnUpdatePrinter();
        oup.init(dc);
    }

    function onShow() {
    }

    function onUpdate(dc) {
        oup.AllowPartial(partialUpdatesAllowed);
        oup.run(dc);
    }

    function onPartialUpdate(dc) {
        oup.AllowPartial(partialUpdatesAllowed);
        oup.runPartial(dc);
    }

    function onHide() {
    }

    function onExitSleep() {
        oup.Awaken(true);
    }

    function onEnterSleep() {
        oup.Awaken(false);
    }

}

class ConnectIQTest3Delegate extends WatchUi.WatchFaceDelegate {

    function initialize() {
        WatchFaceDelegate.initialize();
    }

    function onPowerBudgetExceeded(powerInfo) {
        System.println("Average execution time: " + powerInfo.executionTimeAverage);
        System.println("Allowed execution time: " + powerInfo.executionTimeLimit);
        partialUpdatesAllowed = false;
    }

}
