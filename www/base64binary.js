
window.decodeData = {
	fileUtil : function(base64binaryString, fileNameString, success, fail) {

		cordova.exec(
			function (success){
				console.log("Download Complete")
		           	},
				fail,
				"DecodeUtil",
				"decodeUitl",
				[base64string, newFileName]);
	}
};
