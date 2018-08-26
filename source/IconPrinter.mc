using Toybox.System;

class IconPrinter {

    private var containerWidth;

    private var bPosition;

    private var btPosition;

    private var dndPosition;

    private var nPosition;

    public function init(cw, lh) {
        containerWidth = cw;
        bPosition = new BattIconPosition(38, null, cw, lh);
        btPosition = new BtIconPosition(14, bPosition, cw, lh);
        dndPosition = new DndIconPosition(24, btPosition, cw, lh);
        nPosition = new NotifyIconPosition(26, dndPosition, cw, lh);
        var sp = [ 0, 29 ];
        bPosition.arrange(sp);
        btPosition.arrange(sp);
        dndPosition.arrange(sp);
        nPosition.arrange(sp);
    }

    public function print(l) {
        if (l.success()) {
            var c = l.context();
            printB(c);
            printBt(c);
            printDnd(c);
            printN(c);
        }
    }

    private function printB(c) {
        if (bPosition.onStandby()) {
            var iconImage = null;
            var b = System.getSystemStats().battery;
            if (0 <= b && b <= 10) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B10W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B10B);
                }
            } else if (b <= 20) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B20W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B20B);
                }
            } else if (b <= 30) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B30W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B30B);
                }
            } else if (b <= 40) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B40W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B40B);
                }
            } else {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B50W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.B50B);
                }
            }
            c.drawBitmap(
                bPosition.left() + leftOffset(totalWidth(bPosition.linePosition())),
                bPosition.top(),
                iconImage
            );
            iconImage = null;
        }
    }

    private function printBt(c) {
        if (btPosition.onStandby()) {
            var iconImage = null;
            if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                iconImage = WatchUi.loadResource(Rez.Drawables.BtW);
            } else {
                iconImage = WatchUi.loadResource(Rez.Drawables.BtB);
            }
            c.drawBitmap(
                btPosition.left() + leftOffset(totalWidth(btPosition.linePosition())),
                btPosition.top(),
                iconImage
            );
            iconImage = null;
        }
    }

    private function printDnd(c) {
        if (dndPosition.onStandby()) {
            var iconImage = null;
            if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                iconImage = WatchUi.loadResource(Rez.Drawables.DNDW);
            } else {
                iconImage = WatchUi.loadResource(Rez.Drawables.DNDB);
            }
            c.drawBitmap(
                dndPosition.left() + leftOffset(totalWidth(dndPosition.linePosition())),
                dndPosition.top(),
                iconImage
            );
            iconImage = null;
        }
    }

    private function printN(c) {
        if (nPosition.onStandby()) {
            var iconImage = null;
            var n = System.getDeviceSettings().notificationCount;
            if (1 <= n < 2) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.N1W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.N1B);
                }
            } else if (n < 3) {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.N2W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.N2B);
                }
            } else {
                if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
                    iconImage = WatchUi.loadResource(Rez.Drawables.N3W);
                } else {
                    iconImage = WatchUi.loadResource(Rez.Drawables.N3B);
                }
            }
            c.drawBitmap(
                nPosition.left() + leftOffset(totalWidth(nPosition.linePosition())),
                nPosition.top(),
                iconImage
            );
            iconImage = null;
        }
    }

    private function totalWidth(lp) {
        var ret = 0;
        if (lp == bPosition.linePosition()) {
            ret += bPosition.width();
        }
        if (lp == btPosition.linePosition()) {
            ret += btPosition.width();
        }
        if (lp == dndPosition.linePosition()) {
            ret += dndPosition.width();
        }
        if (lp == nPosition.linePosition()) {
            ret += nPosition.width();
        }
        return ret;
    }

    private function leftOffset(tw) {
        return containerWidth / 2 - tw / 2;
    }

    class IconPosition {

        private var w;

        private var p;

        private var containerWidth;

        private var lineHeight;

        private var l;

        private var t;

        private var line;

        public function initialize(arg1width, arg2prev, arg3cw, arg4lh) {
            w = arg1width;
            p = arg2prev;
            containerWidth = arg3cw;
            lineHeight = arg4lh;
            l = 0;
            t = 0;
            line = 0;
        }

        public function width() {
            return w;
        }

        public function left() {
            return l;
        }

        public function top() {
            return t;
        }

        public function linePosition() {
            return line;
        }

        public function onStandby() {
            if (0 < w) {
                return true;
            } else {
                return false;
            }
        }

        public function arrange(startPosition, standby) {
            if (null == p) {
                l = startPosition[0];
                t = startPosition[1];
            } else {
                l = p.left() + p.width();
                t = p.top();
                line = p.linePosition();
                if (containerWidth < l) {
                    t -= (1 + lineHeight);
                    l = 0;
                    line -= 1;
                }
            }
            if (standby) {
                w += 6;
            } else {
                w = 0;
            }
        }

    }

    class BattIconPosition extends IconPosition {

        public function initialize(arg1width, arg2prev, arg3cw, arg4lh) {
            IconPosition.initialize(arg1width, arg2prev, arg3cw, arg4lh);
        }

        public function arrange(startPosition) {
            if (50 >= System.getSystemStats().battery) {
                IconPosition.arrange(startPosition, true);
            } else {
                IconPosition.arrange(startPosition, false);
            }
        }

    }

    class BtIconPosition extends IconPosition {

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

    }

    class DndIconPosition extends IconPosition {

        public function initialize(arg1width, arg2prev, arg3cw, arg4lh) {
            IconPosition.initialize(arg1width, arg2prev, arg3cw, arg4lh);
        }

        public function arrange(startPosition) {
            if (System.getDeviceSettings().doNotDisturb) {
                IconPosition.arrange(startPosition, true);
            } else {
                IconPosition.arrange(startPosition, false);
            }
        }

    }

    class NotifyIconPosition extends IconPosition {

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

    }

}
