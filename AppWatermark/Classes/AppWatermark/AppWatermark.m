
#import "AppWatermark.h"

#import "AppDelegate.h"

//注意，真机上水印比在虚拟机上显示的更显眼。
//推荐值
//#define WATERMARK_COLOR  [[UIColor redColor] colorWithAlphaComponent:0.05]
//更显眼，只用于测试。
#define WATERMARK_COLOR  [[UIColor redColor] colorWithAlphaComponent:0.5]

static UIView *watermarkView;

@implementation AppWatermark

+(void)addWatermark:(NSString*)watermark{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    UIWindow *window = appDelegate.window;
    
    if(!watermarkView){
        watermarkView = [UIView new];
        watermarkView.frame = window.bounds;
        [window addSubview:watermarkView];
        watermarkView.userInteractionEnabled = NO;
    }
    
    if(watermark){
        UIImage *drawImg = [self watemarkWithText:watermark];
        UIImage *rotageImg = [self rotatedImage:drawImg];
        watermarkView.backgroundColor = [UIColor colorWithPatternImage:rotageImg];
    }
}

+ (UIImage*)watemarkWithText:(NSString*)watemarkText {
    UIFont *font = [UIFont systemFontOfSize:10.0];
    
    NSDictionary *attributes = @{NSFontAttributeName:font
                                 ,NSForegroundColorAttributeName:WATERMARK_COLOR
                                 ,NSKernAttributeName:@(3)       //字间距
                                 };
    
    //字符串的size
    CGSize size = [watemarkText sizeWithAttributes:attributes];
    //加上向上取整 ceilf()就能解决了
    CGSize adjustedSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
    
    UIGraphicsBeginImageContextWithOptions(adjustedSize, NO, 0);

    int w = adjustedSize.width;
    int h = adjustedSize.height;
    [watemarkText drawInRect:CGRectMake(0,0,w,h) withAttributes:attributes];
  
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//使水印旋转45度。
+ (UIImage*)rotatedImage:(UIImage*)image
{
    CGFloat rotation = -M_PI_4;
    
    //一行只有一个水印
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = 0;
    {
        CGFloat minH = image.size.width*M_SQRT2 + 20;
        //界面最多显示4行水印
        CGFloat quarterH = [UIScreen mainScreen].bounds.size.height/4.0;
        h = fmax(minH,quarterH);
    }
    
    CGRect destRect = CGRectMake(0, 0, w, h);
    CGSize destinationSize = destRect.size;
    
    UIGraphicsBeginImageContextWithOptions(destinationSize, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, destinationSize.width / 2.0f, destinationSize.height / 2.0f);
    CGContextRotateCTM(context, rotation);
    [image drawInRect:CGRectMake(-image.size.width / 2.0f
                                 , -image.size.height / 2.0f
                                 , image.size.width
                                 , image.size.height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
