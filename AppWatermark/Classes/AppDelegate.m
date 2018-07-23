
#import "AppDelegate.h"

#import "MainTabBarVC.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //导航栏和状态栏设置
    {
        [[UINavigationBar appearance] setBarTintColor:COLOR(0xfe5245)];
        UIColor *color = [UIColor whiteColor];
        [UINavigationBar appearance].tintColor = color;
        [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName:color
                                                             ,NSFontAttributeName: [UIFont systemFontOfSize:17]
                                                             };
        
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    MainTabBarVC* vc = [[MainTabBarVC alloc] init];
    [self.window setRootViewController:vc];
    
    return YES;
}

@end
