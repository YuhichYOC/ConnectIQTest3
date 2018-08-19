class OnUpdatePrinter {

    private var partialAllowed;

    private var awake;

    private var l;

    private var dip;

    private var ip;

    private var hmp;

    private var dap;

    private var sp;

    public function AllowPartial(arg) {
        partialAllowed = arg;
    }

    public function Awaken(arg) {
        awake = arg;
    }

    public function init(argDc) {
        l = new BBLayer();
        l.tryAlloc(argDc);
        dip = new DialPrinter();
        ip = new IconPrinter();
        hmp = new HMHandsPrinter();
        dap = new DatePrinter();
        sp = new SHandPrinter();
        if (l.success()) {
            sp.initSp(l.size(), l.center());
        }
    }

    public function run(dc) {
        if (l.success()) {
            dc.clearClip();
            var clockTime = System.getClockTime();
            dip.printDial(l);
            ip.initIp();
            ip.printIcons(l);
            hmp.initHmp(clockTime);
            hmp.printHMHands(l);
            dap.printDate(l);
            dc.drawBitmap(0, 0, l.buffer());
            if (partialAllowed) {
                sp.printSHandWithClip(dc, clockTime);
            } else if (awake) {
                sp.printSHand(dc, clockTime);
            }
        }
    }

    public function runPartial(dc) {
        if (l.success() && partialAllowed) {
            var clockTime = System.getClockTime();
            dc.drawBitmap(0, 0, l.buffer());
            sp.printSHandWithClip(dc, clockTime);
        }
    }

}
