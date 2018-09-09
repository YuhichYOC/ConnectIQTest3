class NotifyIcon extends IconPosition {

    public function initialize(arg1width, arg2prev, arg3cw, arg4lh) {
        IconPosition.initialize(arg1width, arg2prev, arg3cw, arg4lh);
    }

    public function arrange(startPosition) {
        if (1 <= System.getDeviceSettings().notificationCount) {
            IconPosition.arrange(startPosition, true);
        } else {
            IconPosition.arrange(startPosition, false);
        }
    }

    public function print(c, leftOffset) {
        if (IconPosition.onStandby()) {
            var iconImage = null;
            var n = System.getDeviceSettings().notificationCount;
            if (3 <= n) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.N3W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.N3B);
                }
            } else if (2 <= n) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.N2W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.N2B);
                }
            } else {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.N1W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.N1B);
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