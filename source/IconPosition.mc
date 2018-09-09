class IconPosition {

    private var ls;

    private var ts;

    private var w;

    private var p;

    private var containerWidth;

    private var lineHeight;

    private var l;

    private var t;

    private var line;

    public function initialize(arg1width, arg2prev, arg3cw, arg4lh) {
        ls = 3;
        ts = 1;
        w = arg1width;
        p = arg2prev;
        containerWidth = arg3cw;
        lineHeight = arg4lh;
        l = 0;
        t = 0;
        line = 0;
    }

    public function leftSpacer() {
        return ls;
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
            l = p.left() + p.width() + ls;
            t = p.top();
            line = p.linePosition();
            if (containerWidth < l) {
                t -= (ts + lineHeight);
                l = 0;
                line -= 1;
            }
        }
        if (!standby) {
            w = 0;
        }
    }

}
