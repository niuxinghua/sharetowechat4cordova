module.exports = {
   sharePics: function (successCallback,fail,pictures) {
        cordova.exec(successCallback, fail,"sharePics","sharePics",pictures);
    }	
};
