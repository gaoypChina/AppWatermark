
/*
  给应用的最上面增加水印层，用户如果截屏的话，图中将带水印。
 
  MIRANDA RIGHTS
  You have the right to remain silent. Anything you say can and will be against
  you in a court of law.
 */

#import <Foundation/Foundation.h>

@interface AppWatermark : NSObject

/**
 应用增加水印图层
 
 在下面的方法中调用显示不出来。
 application: didFinishLaunchingWithOptions:
 
 请在应用主界面的viewDidAppear中调用。
*/
+(void)addWatermark:(NSString*)watermark;

@end
