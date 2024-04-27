//
//  BaseCollectionViewCell.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/30.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self innerInit];
    }
    return self;
}

- (void)innerInit{
    [self initView];
    [self initDatum];
    [self initListeners];
}

- (void)initView{
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    self.container = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Vert];
    self.container.myWidth = MyLayoutSize.fill;
    self.container.myHeight = MyLayoutSize.wrap;
    [self.contentView addSubview:self.container];
}
- (void)initDatum{
    
}
- (void)initListeners{
    
}
- (MyOrientation)getContainerOrientation{
    return MyOrientation_Horz;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority{
    return [self.container systemLayoutSizeFittingSize:targetSize];
}


@end
