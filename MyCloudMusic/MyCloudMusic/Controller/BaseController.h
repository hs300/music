//
//  BaseController.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseController : UIViewController

- (void)initViews;

- (void)initDatum;

- (void)initListeners;
@end

NS_ASSUME_NONNULL_END
