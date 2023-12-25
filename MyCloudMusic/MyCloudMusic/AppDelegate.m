//
//  AppDelegate.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/10.
//

#import "AppDelegate.h"
#import "SplashController.h"
#import "GuideController.h"
#import "MainController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initNetwork];
    
    //SplashController *controller = [SplashController new];
    //GuideController *c2 = [[GuideController alloc] init];
    MainController *c2 = [[MainController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = c2;
    [self.window makeKeyAndVisible];
    
 
    
    return YES;
}

- (void)initNetwork{
#if DEBUG
    
#endif
    [MSNetwork openLog];
    [MSNetwork setBaseURL:ENDPOINT];
    [MSNetwork setRequestTimeoutInterval:10.0f];
    [MSNetwork setRequestSerializer:MSRequestSerializerJSON];
}


@end
