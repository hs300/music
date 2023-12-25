//
//  TermServiceDailogController.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/10.
//

#import "BaseController.h"
#import <QMUIKit/QMUIKit.h>
#import "MyLayout/MyLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface TermServiceDailogController : BaseController
@property(nonatomic, strong)QMUIModalPresentationViewController *modalController;
@property(nonatomic, strong)MyBaseLayout *viewLayout;
@property(nonatomic, strong)MyBaseLayout *contentContainer;

@property(nonatomic, strong)UILabel *textView;
@property(nonatomic, strong)UITextView *content;
@property(nonatomic, strong)QMUIButton *yesBtn;
@property(nonatomic, strong)QMUIButton *noBtn;

- (void)show;
- (void)hide;

@end

NS_ASSUME_NONNULL_END
