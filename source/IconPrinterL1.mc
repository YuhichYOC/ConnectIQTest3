class IconPrinterL1 {

    private var containerWidth;

    private var s;

    private var f;

    public function init(cw, lh) {
        containerWidth = cw;
        s = new StepsIcon(44, null, cw, lh);
        f = new FloorsIcon(44, s, cw, lh);
        var sp = [ 0, 0 ];
        s.arrange(sp);
        f.arrange(sp);
    }

    public function print(l) {
        if (l.success()) {
            var c = l.context();
            s.print(c, leftOffset(s));
            f.print(c, leftOffset(f));
            if (Application.getApp().getProperty("ShowIconPaletteRectangle")) {
                c.setColor(Application.getApp().getProperty("SecondHandColor"), Graphics.COLOR_TRANSPARENT);
                c.drawRectangle(0, 0, containerWidth, 20);
            }
        }
    }

    private function leftOffset(arg) {
        var lp = arg.linePosition();
        var tw = 0;
        var ls = s.leftSpacer();
        if (s.onStandby() && s.linePosition() == lp) {
            tw += s.width() + ls;
        }
        if (f.onStandby() && f.linePosition() == lp) {
            tw += f.width() + ls;
        }
        if (0 < tw) {
            tw -= ls;
        }
        return containerWidth / 2 - tw / 2;
    }

}