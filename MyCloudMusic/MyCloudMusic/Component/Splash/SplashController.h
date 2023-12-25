//
//  SplashControllerViewController.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/10.
//

#import <UIKit/UIKit.h>
#import "BaseLogicController.h"
#import "TermServiceDailogController.h"
NS_ASSUME_NONNULL_BEGIN

@interface SplashController : BaseLogicController
@property(nonatomic, strong)TermServiceDailogController *dialog;
@end

NS_ASSUME_NONNULL_END
