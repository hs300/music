//
//  SplashControllerViewController.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/10.
//

#import "SplashController.h"
#import "MyLayout/MyLayout.h"
#import "SuperDateUtil.h"
#import "R.h"

@interface SplashController ()

@end


@implementation SplashController

- (void)initViews{
    [super initViews];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initRelativeLayoutSafeArea];
    
    UIImageView *bannerView = [[UIImageView alloc] init];
    bannerView.myWidth = 75;
    bannerView.myHeight = 309;
    bannerView.myTop = 120;
    bannerView.myCenterX = 0;
    bannerView.image = [UIImage imageNamed:@"SplashBanner"];
    [self.container addSubview: bannerView];
    
    UILabel *agreementView = [[UILabel alloc] init];
    NSInteger year = [SuperDateUtil currentYear];
    

    agreementView.text = [R.string.localizable copyright:year];
    agreementView.myWidth = MyLayoutSize.wrap;
    agreementView.myHeight = 15;
    agreementView.myCenterX = 0;
    agreementView.myBottom = 20;
    agreementView.font = [UIFont systemFontOfSize:12];
    agreementView.textColor = [UIColor grayColor];
    [self.container addSubview:agreementView];
    
    
    UIImageView *logoView = [[UIImageView alloc] init];
    logoView.myWidth = 188;
    logoView.myHeight = 31;
    logoView.bottomPos.equalTo(agreementView.topPos).offset(16);
    logoView.myCenterX = 0;
    logoView.image = [UIImage imageNamed:@"SplashLogo"];
    [self.container addSubview: logoView];
    
    
}


- (void)initDatum{
    [super initDatum];
    
    
    [self showTermsServiceAgreementDialog];
    
}

- (void)showTermsServiceAgreementDialog{
    [self.dialog show];
}

- (TermServiceDailogController *)dialog{
    if (!_dialog) {
        _dialog = [[TermServiceDailogController alloc] init];
        
    }
    return _dialog;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
