//
//  DiscoveryButtonView.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/24.
//

#import "DiscoveryButtonView.h"

@implementation DiscoveryButtonView

- (instancetype)init
{
    self = [super initWithOrientation:MyOrientation_Vert];
    [self initViews];
    
    return self;
}

- (void)initViews{
    self.myWidth = MyLayoutSize.wrap;
    self.myHeight = MyLayoutSize.wrap;
    self.subviewSpace = 10;
    self.gravity = MyGravity_Horz_Center;
    
    MyRelativeLayout *iconContainer = [MyRelativeLayout new];
    iconContainer.myWidth = 50;
    iconContainer.myHeight = 50;
    [self addSubview:iconContainer];
    
    [iconContainer addSubview:self.iconView];
    [iconContainer addSubview:self.tipView];
    
    [self addSubview:self.titleView];
}

- (void)showWithTitle:(NSString *)title icon:(UIImage *)icon{
    self.titleView.text = title;
    self.iconView.image = icon;
}

-(UILabel *)titleView{
    if (!_titleView) {
        _titleView = [UILabel new];
        _titleView.myWidth = MyLayoutSize.wrap;
        _titleView.myHeight = MyLayoutSize.wrap;
        _titleView.numberOfLines = 0;
        _titleView.text = @"每日推荐";
        _titleView.font = [UIFont systemFontOfSize:13];
        _titleView.textColor = [UIColor colorOnSurface];
    }
    
    return _titleView;
}

-(UILabel *)tipView{
    if(!_tipView){
        _tipView = [UILabel new];
        _tipView.myWidth = MyLayoutSize.wrap;
        _tipView.myHeight = MyLayoutSize.wrap;
        _tipView.numberOfLines = 0;
        _tipView.font = [UIFont systemFontOfSize:13];
        _tipView.textColor = [UIColor colorLightWhite];
        _tipView.myCenterX = 0;
        _tipView.myCenterY = 3;
    }
    return _tipView;
}

-(UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [UIImageView new];
        _iconView.myWidth = 50;
        _iconView.myHeight = 50;
        _iconView.image = R.image.dayRecommend;
    }
    return _iconView;
}

@end
