class FloorsIcon extends IconPosition {

    public function initialize(arg1width, arg2prev, arg3cw, arg4lh) {
        IconPosition.initialize(arg1width, arg2prev, arg3cw, arg4lh);
    }

    public function arrange(startPosition) {
        var f = ActivityMonitor.Info.floorsClimbed;
        var g = ActivityMonitor.Info.floorsClimbedGoal;
        if (null != f && null != g) {
            IconPosition.arrange(startPosition, true);
        } else {
            IconPosition.arrange(startPosition, false);
        }
    }

    public function print(c, leftOffset) {
        if (IconPosition.onStandby()) {
            var iconImage = null;
            var p = (ActivityMonitor.Info.floorsClimbed * 100) / ActivityMonitor.Info.floorsClimbedGoal;
            if (100 <= p) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.F100W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.F100B);
                }
            } else if (80 <= p) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.F80W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.F80B);
                }
            } else if (60 <= p) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.F60W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.F60B);
                }
            } else if (40 <= p) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.F40W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.F40B);
                }
            } else if (20 <= p) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.F20W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.F20B);
                }
            } else {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.F00W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.F00B);
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