using Toybox.System;
using Toybox.WatchUi;

var partialUpdatesAllowed = false;

var minutesDuringRunPartial = 0;

class ConnectIQTest3View extends WatchUi.WatchFace {

    private var oup;

    function initialize() {
        WatchFace.initialize();
        partialUpdatesAllowed = (Toybox.WatchUi.WatchFace has :onPartialUpdate);
        minutesDuringRunPartial = 0;
    }

    function onLayout(dc) {
        oup = new OnUpdatePrinter();
        oup.init(dc);
    }

    function onShow() {
    }

    function onUpdate(dc) {
        if (!partialUpdatesAllowed) {
            oup.AllowPartial(false);
        } else if (0 > Application.getApp().getProperty("MinutesShowSecondHand")) {
            // NOP
        } else if (Application.getApp().getProperty("MinutesShowSecondHand") < minutesDuringRunPartial) {
            oup.AllowPartial(false);
        } else {
            ++minutesDuringRunPartial;
        }
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

    function onTap(e) {
        minutesDuringRunPartial = 0;
    }

}

/*
class TapDelegate extends WatchUi.InputDelegate {

    function initialize() {
    }

    function onTap(e) {
        minutesDuringRunPartial = 0;
    }

}
*/

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
