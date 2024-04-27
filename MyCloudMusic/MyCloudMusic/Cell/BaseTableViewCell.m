//
//  BaseTableViewCell.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/19.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self inierInit];
    }
    
    return self;
}

- (void)inierInit{
    [self initView];
    [self initDatum];
    [self initListeners];

}

- (void)initView{
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.container = [[MyLinearLayout alloc] initWithOrientation: [self getContainerOrientation]];
    self.container.myWidth = MyLayoutSize.fill;
    self.container.myHeight = MyLayoutSize.wrap;
    self.container.gravity = MyGravity_Vert_Center;
    self.container.subviewSpace = PADDING_MEDDLE;
    [self.contentView addSubview:self.container];
}
- (void)initDatum{
    
}
- (void)initListeners{
    
}
- (MyOrientation)getContainerOrientation{
    return MyOrientation_Vert;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority{
    return [self.container systemLayoutSizeFittingSize:targetSize];
}


@end
