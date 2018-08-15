class BBLayer {

    private var bb;

    private var s;

    private var cont;

    private var w;

    private var h;

    private var cent;

    public function tryAlloc(dc) {
        s = false;
        System.println("BBLayer::tryAlloc");
        if (Toybox.Graphics has :BufferedBitmap) {
            bb = new Graphics.BufferedBitmap( {
                :width => dc.getWidth(),
                :height => dc.getHeight()
            } );
            s = true;
            System.println("BBLayer::tryAlloc success");
            cont = bb.getDc();
            w = cont.getWidth();
            h = cont.getHeight();
            cent = [ w / 2, h / 2 ];
        }
    }

    public function buffer() {
        return bb;
    }

    public function success() {
        return s;
    }

    public function context() {
        return cont;
    }

    public function size() {
        var ret = [ w, h ];
        return ret;
    }

    public function center() {
        return cent;
    }

}
