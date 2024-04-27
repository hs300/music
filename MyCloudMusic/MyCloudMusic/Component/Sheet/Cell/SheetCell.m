//
//  SheetCell.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/30.
//

#import "SheetCell.h"

@implementation SheetCell


- (void)initView{
    [super initView];
    self.backgroundColor = [UIColor clearColor];
    
    self.container.subviewSpace = PADDING_SMALL;
    self.container.backgroundColor = [UIColor clearColor];
    [self.container addSubview:self.iconView];
    [self.container addSubview:self.titleView];
}

- (UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [UIImageView new];
        _iconView.myWidth = MyLayoutSize.fill;
        _iconView.heightSize.equalTo(_iconView.widthSize);
        _iconView.image = R.image.dayRecommend;
        _iconView.clipsToBounds=YES;
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
        [_iconView smallRadius];
    }
    
    return _iconView;
}

- (UILabel *)titleView{
    if (!_titleView) {
        _titleView = [UILabel new];
        _titleView.myWidth = MyLayoutSize.fill;
        _titleView.myHeight = MyLayoutSize.wrap;
        _titleView.numberOfLines = 2;
        _titleView.text = @"xxxxxxxxxxxxx";
        _titleView.font = [UIFont systemFontOfSize:TEXT_MEDDLE];
        _titleView.textColor = [UIColor whiteColor];
    }
    return _titleView;
}


-(void)bind:(Sheet *)data{
    _titleView.text = data.title;
    [ImageUtil show:_iconView uri:data.icon];
}

@end
