//
//  ItemTitleView.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/24.
//

#import "ItemTitleView.h"

@implementation ItemTitleView

- (instancetype)init
{
    self = [super init];
    
    [self initView];
    
    return self;
}

-(void)initView{
    self.myWidth = MyLayoutSize.fill;
    self.myHeight = MyLayoutSize.wrap;
    self.padding = UIEdgeInsetsMake(PADDING_MEDDLE, PADDING_OUTER, PADDING_MEDDLE, PADDING_OUTER);
    self.gravity = MyGravity_Vert_Center;
    [self addSubview: self.titleView];
    [self addSubview:self.moreIconView];
    
}

- (UILabel *)titleView{
    if (!_titleView) {
        _titleView = [UILabel new];
        _titleView.myWidth = MyLayoutSize.wrap;
        _titleView.myHeight = MyLayoutSize.wrap;
        _titleView.myCenterY = 0;
        _titleView.numberOfLines = 1;
        _titleView.font = [UIFont boldSystemFontOfSize:17];
        _titleView.text = R.string.localizable.sheet;
        _titleView.textColor = [UIColor redColor];
        
    }
    return _titleView;
}

-(UIImageView *)moreIconView{
    if (!_moreIconView) {
        _moreIconView = [UIImageView new];
    }
    return _moreIconView;
}

@end
