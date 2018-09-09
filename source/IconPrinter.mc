using Toybox.System;

class IconPrinter {

    private var containerWidth;

    private var a;

    private var b;

    private var bt;

    private var dnd;

    private var f;

    private var m;

    private var n;

    private var s;

    public function init(cw, lh) {
        containerWidth = cw;
        a = new AlarmIcon(22, null, cw, lh);
        b = new BattIcon(43, a, cw, lh);
        bt = new BtIcon(18, b, cw, lh);
        dnd = new DndIcon(22, bt, cw, lh);
        f = new FloorsIcon(44, dnd, cw, lh);
        m = new MoveIcon(26, f, cw, lh);
        n = new NotifyIcon(24, m, cw, lh);
        s = new StepsIcon(44, n, cw, lh);
        var sp = [ 0, 21 ];
        a.arrange(sp);
        b.arrange(sp);
        bt.arrange(sp);
        dnd.arrange(sp);
        f.arrange(sp);
        m.arrange(sp);
        n.arrange(sp);
        s.arrange(sp);
    }

    public function print(l) {
        if (l.success()) {
            var c = l.context();
            a.print(c, leftOffset(a));
            b.print(c, leftOffset(b));
            bt.print(c, leftOffset(bt));
            dnd.print(c, leftOffset(dnd));
            f.print(c, leftOffset(f));
            m.print(c, leftOffset(m));
            n.print(c, leftOffset(n));
            s.print(c, leftOffset(s));
        }
    }

    private function leftOffset(arg) {
        var lp = arg.linePosition();
        var tw = 0;
        var ls = a.leftSpacer();
        if (a.onStandby() && a.linePosition() == lp) {
            tw += a.width() + ls;
        }
        if (b.onStandby() && b.linePosition() == lp) {
            tw += b.width() + ls;
        }
        if (bt.onStandby() && bt.linePosition() == lp) {
            tw += bt.width() + ls;
        }
        if (dnd.onStandby() && dnd.linePosition() == lp) {
            tw += dnd.width() + ls;
        }
        if (f.onStandby() && f.linePosition() == lp) {
            tw += f.width() + ls;
        }
        if (m.onStandby() && m.linePosition() == lp) {
            tw += m.width() + ls;
        }
        if (n.onStandby() && n.linePosition() == lp) {
            tw += n.width() + ls;
        }
        if (s.onStandby() && s.linePosition() == lp) {
            tw += s.width() + ls;
        }
        if (0 < tw) {
            tw -= ls;
        }
        return containerWidth / 2 - tw / 2;
    }

}
