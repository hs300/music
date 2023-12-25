//
//  DiscoveryButtonCell.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/24.
//

#import "DiscoveryButtonCell.h"
#import "IconTitleButtonData.h"
#import "DiscoveryButtonView.h"
@implementation DiscoveryButtonCell

- (void)initView{
    [super initView];
    self.backgroundColor = [UIColor redColor];
    _scrollView = [UIScrollView new];
    _scrollView.contentInset = UIEdgeInsetsMake(0, 13, 0, 13);
    [_scrollView setShowsVerticalScrollIndicator:NO];
    [_scrollView setShowsHorizontalScrollIndicator:NO];
    _scrollView.myWidth = MyLayoutSize.fill;
    _scrollView.myHeight = 100;
    [self.container addSubview:_scrollView];
    
    _contentContainer = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    _contentContainer.gravity = MyGravity_Vert_Center;
    _contentContainer.myHeight = 100;
    [_scrollView addSubview:_contentContainer];
    
}

- (void)bind:(ButtonData *)data{
    if ([[self.contentContainer subviews] count] > 0) {
        return;
    }
    
    CGFloat containerWith = (SCREEN_WIDTH - 10 * 2) / 5.5;
    for (IconTitleButtonData *it in data.datum) {
        DiscoveryButtonView *view = [DiscoveryButtonView new];
        view.myWidth = containerWith;
        [view showWithTitle:it.title icon:it.icon];
        [self.contentContainer addSubview:view];
    }
}

@end
