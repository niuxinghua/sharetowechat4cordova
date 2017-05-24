//
//  TestPlugin.h
//  testCordova
//
//  Created by Administrator on 16/9/20.
//
//

#import <Cordova/CDVPlugin.h>

@interface SharePlugin : CDVPlugin
@property(nonatomic,strong)NSMutableArray *urllist;
@property(nonatomic,strong)NSMutableArray *imagelist;
@property(nonatomic,strong)NSMutableDictionary *url2image;
@property(atomic,assign)int numsofpic;
    
-(void)sharetoWeChat:(CDVInvokedUrlCommand *)command;
    
@end
