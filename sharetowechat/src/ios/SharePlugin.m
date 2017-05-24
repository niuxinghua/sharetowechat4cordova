//
//  TestPlugin.m
//  testCordova
//
//  Created by Administrator on 16/9/20.#0	0x000000010ea068e6 in -[SharePlugin testWithTitle:] at /Users/niuxinghua/Desktop/sharetoWeChat/testCordovaPro/platforms/ios/testCordova/Plugins/com.catchzeng.testplugin/SharePlugin.m:19

//
//

#import "SharePlugin.h"


@implementation SharePlugin

-(void)sharetoWeChat:(CDVInvokedUrlCommand *)command{
    if (command.arguments.count>0) {
        //customize argument
        _urllist = [[NSMutableArray alloc]initWithArray:command.arguments];
        _imagelist = [[NSMutableArray alloc]init];
        _url2image = [[NSMutableDictionary alloc]init];
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group =  dispatch_group_create();
      [_urllist enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        dispatch_group_enter(group);
          dispatch_async(queue, ^{
              NSURL *url1 = [NSURL URLWithString:obj];
              NSData *data1 = [NSData dataWithContentsOfURL:url1];
              UIImage *image1 = [UIImage imageWithData:data1];
              if (image1) {
                  [_url2image setObject:image1 forKey:obj];
              }
              dispatch_group_leave(group);
          });
      }];
        dispatch_group_notify(group,
                              dispatch_get_main_queue(), ^{
                                  for (int i=0; i<[_urllist count]; i++) {
                                      [_imagelist addObject:[_url2image valueForKey:[_urllist objectAtIndex:i]]];
                                  }
                                   NSLog(@"%@",_url2image);
                                  NSArray *activityItems = _imagelist;
                                  UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
                                  [self.viewController presentViewController:activityVC animated:TRUE completion:nil];
                              });

}
}

@end
