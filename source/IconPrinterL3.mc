class IconPrinterL3 {

    private var containerWidth;

    private var a;

    private var d;

    private var n;

    public function init(cw, lh) {
        containerWidth = cw;
        a = new AlarmIcon(22, null, cw, lh);
        d = new DndIcon(22, a, cw, lh);
        n = new NotifyIcon(24, d, cw, lh);
        var sp = [ 0, 0 ];
        a.arrange(sp);
        d.arrange(sp);
        n.arrange(sp);
    }

    public function print(l) {
        if (l.success()) {
            var c = l.context();
            a.print(c, leftOffset(a));
            d.print(c, leftOffset(d));
            n.print(c, leftOffset(n));
            if (Application.getApp().getProperty("ShowIconPaletteRectangle")) {
                c.setColor(Application.getApp().getProperty("SecondHandColor"), Graphics.COLOR_TRANSPARENT);
                c.drawRectangle(0, 0, containerWidth, 20);
            }
        }
    }

    private function leftOffset(arg) {
        var lp = arg.linePosition();
        var tw = 0;
        var ls = a.leftSpacer();
        if (a.onStandby() && a.linePosition() == lp) {
            tw += a.width() + ls;
        }
        if (d.onStandby() && d.linePosition() == lp) {
            tw += dnd.width() + ls;
        }
        if (n.onStandby() && n.linePosition() == lp) {
            tw += n.width() + ls;
        }
        if (0 < tw) {
            tw -= ls;
        }
        return containerWidth / 2 - tw / 2;
    }

}