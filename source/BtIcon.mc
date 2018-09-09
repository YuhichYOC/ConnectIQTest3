class BtIcon extends IconPosition {

    public function initialize(arg1width, arg2prev, arg3cw, arg4lh) {
        IconPosition.initialize(arg1width, arg2prev, arg3cw, arg4lh);
    }

    public function arrange(startPosition) {
        if (System.getDeviceSettings().phoneConnected) {
            IconPosition.arrange(startPosition, true);
        } else {
            IconPosition.arrange(startPosition, false);
        }
    }

    public function print(c, leftOffset) {
        if (IconPosition.onStandby()) {
            var iconImage = null;
            if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                iconImage = WatchUi.loadResource(Rez.Drawables.BtW);
            } else {
                iconImage = WatchUi.loadResource(Rez.Drawables.BtB);
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