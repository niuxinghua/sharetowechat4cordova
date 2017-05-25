# sharetowechat4cordova
一个分享多图到微信的cordova插件
使用方法 cordova plugin add  sharePics
js调用  


sharePics.sharePics(alertSuccess,alertFail,["http://pic33.nipic.com/20130916/3420027_192919547000_2.jpg"]);
                }
            
            function alertSuccess(msg) {
                alert(msg);
            }
            
            function alertFail(msg) {
                alert(msg);
            }
