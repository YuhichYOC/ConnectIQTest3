class MoveIcon extends IconPosition {

    public function initialize(arg1width, arg2prev, arg3cw, arg4lh) {
        IconPosition.initialize(arg1width, arg2prev, arg3cw, arg4lh);
    }

    public function arrange(startPosition) {
        var m = ActivityMonitor.Info.moveBarLevel;
        if (null != m && 0 < m) {
            IconPosition.arrange(startPosition, true);
        } else {
            IconPosition.arrange(startPosition, false);
        }
    }

    public function print(c, leftOffset) {
        if (IconPosition.onStandby()) {
            var iconImage = null;
            var m = ActivityMonitor.Info.moveBarLevel;
            if (5 <= m) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.M5W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.M5B);
                }
            } else if (4 <= m) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.M4W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.M4B);
                }
            } else if (3 <= m) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.M3W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.M3B);
                }
            } else if (2 <= m) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.M2W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.M2B);
                }
            } else {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.M1W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.M1B);
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