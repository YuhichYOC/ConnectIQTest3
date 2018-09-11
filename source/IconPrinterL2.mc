class IconPrinterL2 {

    private var containerWidth;

    private var m;

    private var b;

    private var bt;

    public function init(cw, lh) {
        containerWidth = cw;
        m = new MoveIcon(26, null, cw, lh);
        b = new BattIcon(43, m, cw, lh);
        bt = new BtIcon(18, b, cw, lh);
        var sp = [ 0, 0 ];
        m.arrange(sp);
        b.arrange(sp);
        bt.arrange(sp);
    }

    public function print(l) {
        if (l.success()) {
            var c = l.context();
            m.print(c, leftOffset(m));
            b.print(c, leftOffset(b));
            bt.print(c, leftOffset(bt));
            if (Application.getApp().getProperty("ShowIconPaletteRectangle")) {
                c.setColor(Application.getApp().getProperty("SecondHandColor"), Graphics.COLOR_TRANSPARENT);
                c.drawRectangle(0, 0, containerWidth, 20);
            }
        }
    }

    private function leftOffset(arg) {
        var lp = arg.linePosition();
        var tw = 0;
        var ls = m.leftSpacer();
        if (m.onStandby() && m.linePosition() == lp) {
            tw += m.width() + ls;
        }
        if (b.onStandby() && b.linePosition() == lp) {
            tw += b.width() + ls;
        }
        if (bt.onStandby() && bt.linePosition() == lp) {
            tw += bt.width() + ls;
        }
        if (0 < tw) {
            tw -= ls;
        }
        return containerWidth / 2 - tw / 2;
    }

}