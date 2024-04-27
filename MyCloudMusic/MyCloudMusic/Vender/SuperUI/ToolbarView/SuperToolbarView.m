//
//  SuperToolbarView.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/31.
//

#import "SuperToolbarView.h"

@implementation SuperToolbarView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView{
    self.myWidth = MyLayoutSize.fill;
    self.heightSize.equalTo(@50);
    [self addSubview:self.rightContainer];
    [self addSubview:self.centerContainer];
    [self.centerContainer addSubview: self.titleView];
    [self addSubview:self.rightContainer];
}

- (MyLinearLayout *)leftContainer{
    if(!_leftContainer){
        _leftContainer = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Horz];
        _leftContainer.gravity = MyGravity_Vert_Center;
        _leftContainer.leftPos.equalTo(@(12));
        _leftContainer.rightPos.equalTo(self.centerContainer.leftPos).offset(10);
        _leftContainer.myHeight = MyLayoutSize.fill;
    }
    return _leftContainer;
}

- (MyLinearLayout *)rightContainer{
    if (!_rightContainer) {
        _rightContainer = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Horz];
        _rightContainer.subviewSpace = PADDING_MEDDLE;
        _rightContainer.gravity = MyGravity_Horz_Right | MyGravity_Vert_Center;
        _rightContainer.rightPos.equalTo(@(12));
        _rightContainer.leftPos.equalTo(self.centerContainer.rightPos).offset(10);
        _rightContainer.myHeight = MyLayoutSize.fill;
    }
    
    return _rightContainer;
}


- (MyLinearLayout *)centerContainer{
    if (!_centerContainer) {
        _centerContainer = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Horz];
        _centerContainer.gravity = MyGravity_Vert_Center;
        _centerContainer.myCenterX = 0;
        _centerContainer.myCenterY = 0;
        _centerContainer.myWidth = MyLayoutSize.wrap;
        _centerContainer.myHeight = MyLayoutSize.fill;
    }
    return _centerContainer;
}

- (UILabel *)titleView{
    if (!_titleView) {
        _titleView = [UILabel new];
        _titleView.myWidth = MyLayoutSize.wrap;
        _titleView.myHeight = MyLayoutSize.wrap;
        _titleView.numberOfLines = 1;
        _titleView.font = [UIFont systemFontOfSize:TEXT_LARGE3];
    }
    return _titleView;
}

- (SuperToolbarView*)addLeftItem:(UIView *)data{
    [self.leftContainer addSubview:data];
    return self;
}

- (SuperToolbarView*)addRightItem:(UIView *)data{
    [self.rightContainer addSubview:data];
    return self;
}

- (SuperToolbarView*)addcontentItem:(UIView *)data{
    [self.centerContainer addSubview:data];
    
    return self;
}

@end
