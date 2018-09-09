class StepsIcon extends IconPosition {

    public function initialize(arg1width, arg2prev, arg3cw, arg4lh) {
        IconPosition.initialize(arg1width, arg2prev, arg3cw, arg4lh);
    }

    public function arrange(startPosition) {
        var s = ActivityMonitor.Info.steps;
        var g = ActivityMonitor.Info.stepGoal;
        if (null != s && null != g) {
            IconPosition.arrange(startPosition, true);
        } else {
            IconPosition.arrange(startPosition, false);
        }
    }

    public function print(c, leftOffset) {
        if (IconPosition.onStandby()) {
            var iconImage = null;
            var p = (ActivityMonitor.Info.steps * 100) / ActivityMonitor.Info.stepGoal;
            if (100 <= p) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.S100W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.S100B);
                }
            } else if (80 <= p) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.S80W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.S80B);
                }
            } else if (60 <= p) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.S60W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.S60B);
                }
            } else if (40 <= p) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.S40W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.S40B);
                }
            } else if (20 <= p) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.S20W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.S20B);
                }
            } else {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.S00W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.S00B);
                }
            }
            c.drawBitmap(
                IconPosition.left() + leftOffset,
                IconPosition.top(),
                iconImage
            );
            iconImage = null;
        }
    }

}