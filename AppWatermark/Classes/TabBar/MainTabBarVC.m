
#import "MainTabBarVC.h"

#import "AppWatermark.h"

#import "AppDelegate.h"

@implementation MainTabBarVC
{
    BOOL _firstAppear;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _firstAppear = YES;
    
    UIViewController* indexVC = [[UIViewController alloc]init];
    indexVC.title = @"首页";
    indexVC.view.backgroundColor = [UIColor whiteColor];
    UINavigationController* indexNav = [[UINavigationController alloc] initWithRootViewController:indexVC];
    indexNav.navigationBar.translucent = YES;
    
    UIViewController* mineIndexVC = [[UIViewController alloc]init];
    mineIndexVC.title = @"我的";
    UINavigationController* mineNav = [[UINavigationController alloc] initWithRootViewController:mineIndexVC];
    mineNav.navigationBar.translucent = YES;
    
    
    self.viewControllers = @[indexNav,mineNav];

    
    NSArray* _imgNormals= @[@"tab-home-normal",@"tab-my-normal"];
    NSArray* _imgLight = @[@"tab-home-light",@"tab-my-light"];
    NSArray* tabTitles = @[@"首页",@"我"];
    for(int i =0;i<self.viewControllers.count;i++){
        UIViewController* tabVc = self.viewControllers[i];
        
    
        UIImage* img = IMG(_imgNormals[i]);
        //保持图标原有的色彩，而不受barTintColor的影响。
        img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UIImage* imgSeled = IMG(_imgLight[i]);
        imgSeled = [imgSeled imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UITabBarItem* barItem = [[UITabBarItem alloc] initWithTitle:tabTitles[i] image:img selectedImage:imgSeled];
        
        //设置title字体
        [barItem setTitleTextAttributes:@{
                                          NSForegroundColorAttributeName:COLOR(0x9b9b9b)
                                          ,NSFontAttributeName:[UIFont systemFontOfSize:9]
                                          }
                               forState:UIControlStateNormal];
        
        [barItem setTitleTextAttributes:@{NSForegroundColorAttributeName:COLOR(0xfd5345)}
                               forState:UIControlStateSelected];
        
        
        tabVc.tabBarItem = barItem;
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear: animated];
    
    if(_firstAppear){
        _firstAppear = NO;

        //应用增加水印
        NSString *userName = @"";
//        userName = @"一个短的水印";
        userName = @"我是一个特别长特别长特别长的水印";
        [AppWatermark addWatermark:userName];
    }
}


@end
