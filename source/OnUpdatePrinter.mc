class OnUpdatePrinter {

    private var partialAllowed;

    private var awake;

    private var dialLayer;

    private var basicPalette = [
        Graphics.COLOR_BLACK,
        Graphics.COLOR_WHITE,
    ];

    private var dip;

    private var hmp;

    private var dSize;

    private var dateLayer;

    private var dap;

    private var dPos;

    private var iSize;

    private var iconLayer;

    private var ip;

    private var iPos;

    private var sp;

    public function AllowPartial(arg) {
        partialAllowed = arg;
    }

    public function Awaken(arg) {
        awake = arg;
    }

    public function init(argDc) {
        dialLayer = new BBLayer();
        dialLayer.tryAllocWithPalette(argDc, basicPalette);
        dip = new DialPrinter();
        hmp = new HMHandsPrinter();
        dSize = [ argDc.getWidth(), Graphics.getFontHeight(Graphics.FONT_SMALL) ];
        dateLayer = new BBLayer();
        dateLayer.tryAllocWithSize(argDc, dSize);
        dap = new DatePrinter();
        dPos = [ 0, argDc.getHeight() * 3 / 5 ];
        iSize = [ argDc.getWidth() * 5 / 6, 28 * 2 + 1 ];
        iconLayer = new BBLayer();
        iconLayer.tryAllocWithSize(argDc, iSize);
        ip = new IconPrinter();
        iPos = [ argDc.getWidth() * 1 / 12, argDc.getHeight() / 7 ];
        sp = new SHandPrinter();
        if (dialLayer.success()) {
            sp.init(dialLayer.size(), dialLayer.center());
        }
    }

    public function run(dc) {
        dc.clearClip();
        dip.print(dialLayer);
        hmp.init(System.getClockTime());
        hmp.print(dialLayer);
        if (dialLayer.success()) {
            dc.drawBitmap(0, 0, dialLayer.buffer());
        }
        if (dateLayer.success()) {
            var dateLayerC = dateLayer.context();
            dateLayerC.drawBitmap(-(dPos[0]), -(dPos[1]), dialLayer.buffer());
            dap.print(dateLayer);
            dc.drawBitmap(dPos[0], dPos[1], dateLayer.buffer());
        }
        if (iconLayer.success()) {
            var iconLayerC = iconLayer.context();
            iconLayerC.drawBitmap(-(iPos[0]), -(iPos[1]), dialLayer.buffer());
            ip.init(iSize[0], 28);
            ip.print(iconLayer);
            dc.drawBitmap(iPos[0], iPos[1], iconLayer.buffer());
        }
        if (partialAllowed) {
            sp.printWithClip(dc, System.getClockTime());
        } else if (awake) {
            sp.print(dc, System.getClockTime());
        }
    }

    public function runPartial(dc) {
        if (partialAllowed) {
            if (dialLayer.success()) {
                dc.drawBitmap(0, 0, dialLayer.buffer());
            }
            if (dateLayer.success()) {
                dc.drawBitmap(dPos[0], dPos[1], dateLayer.buffer());
            }
            if (iconLayer.success()) {
                dc.drawBitmap(iPos[0], iPos[1], iconLayer.buffer());
            }
            sp.printWithClip(dc, System.getClockTime());
        }
    }

}
