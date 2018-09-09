class BattIcon extends IconPosition {

    public function initialize(arg1width, arg2prev, arg3cw, arg4lh) {
        IconPosition.initialize(arg1width, arg2prev, arg3cw, arg4lh);
    }

    public function arrange(startPosition) {
        if (Application.getApp().getProperty("AlwaysShowBatteryIcon") || 50 >= System.getSystemStats().battery) {
            IconPosition.arrange(startPosition, true);
        } else {
            IconPosition.arrange(startPosition, false);
        }
    }

    public function print(c, leftOffset) {
        if (IconPosition.onStandby()) {
            var iconImage = null;
            var b = System.getSystemStats().battery;
            if (10 >= b) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B10W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B10B);
                }
            } else if (20 >= b) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B20W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B20B);
                }
            } else if (30 >= b) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B30W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B30B);
                }
            } else if (40 >= b) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B40W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B40B);
                }
            } else if (50 >= b) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B50W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B50B);
                }
            } else if (60 >= b) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B60W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B60B);
                }
            } else if (70 >= b) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B70W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B70B);
                }
            } else if (80 >= b) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B80W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B80B);
                }
            } else if (90 >= b) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B90W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B90B);
                }
            } else {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B100W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B100B);
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