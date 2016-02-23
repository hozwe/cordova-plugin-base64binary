/**
 * Created by josue on 5/19/15.
 */
window.ExternalFileUtil = {
    openWith : function(base64string, newFileName, uti, success, fail) {

        cordova.exec(
            function (success){
                stopThirdSpinner();
                console.log("Download Complete")},
            fail,
            "OpenWith", //calls Native class plug in
            "openWith", //js call back
            [base64string, newFileName, uti]);
    }
};
