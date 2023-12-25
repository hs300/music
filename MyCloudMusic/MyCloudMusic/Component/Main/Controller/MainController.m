//
//  MainController.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/17.
//

#import "MainController.h"
#import "RoomController.h"
#import "FeedController.h"
#import "MeController.h"
#import "DiscoveryController.h"
#import "VideoController.h"
#import "UIImage+SuperUI.h"
@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.tintColor = [UIColor primaryColor];
    self.tabBar.translucent = YES;
    
    if (@available(iOS 13,*)) {
        UITabBarAppearance *app = [self.tabBar.standardAppearance copy];
        app.backgroundImage = [UIImage imageWithColor :[UIColor clearColor]];
    }
    
    [self addChildViewController:[DiscoveryController new] title:R.string.localizable.discovery imageName:@"Discovery"];
    [self addChildViewController:[VideoController new] title:R.string.localizable.discovery imageName:@"Video"];
    [self addChildViewController:[FeedController new] title:R.string.localizable.discovery imageName:@"Me"];
    [self addChildViewController:[FeedController new] title:R.string.localizable.feed imageName:@"Feed"];
    [self addChildViewController:[RoomController new] title:R.string.localizable.live imageName:@"Live"];
}

-(void)addChildViewController:(UIViewController *)target title:(NSString *)title imageName:(NSString *)imageName{
    target.tabBarItem.title = title;
    target.tabBarItem.image = [UIImage imageNamed:imageName];
    target.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@Selected", imageName]];
    [target.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorSurface]} forState:UIControlStateSelected];
    target.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2);
    [self addChildViewController:target];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSLog(@"--------");
}

@end
