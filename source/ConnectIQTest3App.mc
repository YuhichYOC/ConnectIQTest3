using Toybox.Application as App;

class ConnectIQTest3App extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        if (Toybox.WatchUi has :WatchFaceDelegate) {
            //return [ new ConnectIQTest3View(), new TapDelegate(), new ConnectIQTest3Delegate() ];
            return [ new ConnectIQTest3View(), new ConnectIQTest3Delegate() ];
        } else {
            return [ new ConnectIQTest3View() ];
        }
    }

}