//
//  DiscoverySongCell.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/31.
//

#import "DiscoverySongCell.h"

@implementation DiscoverySongCell

- (void)initView{
    [super initView];
    self.backgroundColor = [UIColor redColor];
    
    self.container.subviewSpace = 10;
    [self.container addSubview:self.iconView];
    [self.container addSubview:self.rightContainer];
    
    [self.rightContainer addSubview:self.titleView];
    [self.rightContainer addSubview:self.infoView];
}

-(void)bind:(Song *)data position:(int)position{
    [ImageUtil show:_iconView uri:data.icon];
    _titleView.text = data.title;
    _infoView.text = [NSString stringWithFormat:@"%@- %@", data.singer.nickname, @"zhuan ji minzi"];
    self.container.padding = UIEdgeInsetsMake(PADDING_MEDDLE, PADDING_OUTER, PADDING_MEDDLE, PADDING_OUTER);
}

- (UIImageView *)iconView{
    if(!_iconView){
        _iconView = [UIImageView new];
        _iconView.myWidth = 51;
        _iconView.myHeight = 51;
        _iconView.image = R.image.dayRecommend;
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
        [_iconView smallRadius];
    }
    return _iconView;
}

- (MyLinearLayout *)rightContainer{
    if (!_rightContainer) {
        _rightContainer = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Vert];
        _rightContainer.myWidth = MyLayoutSize.fill;
        _rightContainer.myHeight = MyLayoutSize.wrap;
        _rightContainer.subviewSpace = PADDING_SMALL;
        _rightContainer.weight = 1;
    }
    return _rightContainer;
}

- (UILabel *)titleView{
    if (!_titleView) {
        _titleView = [UILabel new];
        _titleView.myWidth = MyLayoutSize.fill;
        _titleView.myHeight = MyLayoutSize.wrap;
        _titleView.numberOfLines = 2;
        _titleView.text = @"歌单标题";
        _titleView.font = [UIFont systemFontOfSize:14];
        _titleView.textColor = [UIColor greenColor];
    }
    return _titleView;
}

- (UILabel *)infoView{
    if (_infoView) {
        _infoView = [UILabel new];
        _infoView.myHeight = MyLayoutSize.wrap;
        _infoView.myWidth = MyLayoutSize.fill;
        _infoView.numberOfLines = 2;
        _infoView.text = @"songer info";
        _infoView.font = [UIFont systemFontOfSize:12];
        _infoView.textColor = [UIColor black80];
    }
    return _infoView;
}

@end
