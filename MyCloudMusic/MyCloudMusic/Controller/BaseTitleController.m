//
//  BaseTitleController.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/31.
//

#import "BaseTitleController.h"

@interface BaseTitleController ()

@end

@implementation BaseTitleController


- (void)initLinearLayoutSafeArea{
    [super initLinearLayoutSafeArea];
    [self initToolbar];
}


- (void)initRelativeLayoutSafeArea{
    [super initRelativeLayoutSafeArea];
    [self initToolbar];
}

- (BOOL)isAddToolBar{
    return YES;
}

- (void)initToolbar{
    if ([self isAddToolBar]) {
        [self.superHeaderContentContainer addSubview:self.toolbarView];
    }
    
}

- (void)setTitle:(NSString *)title{
    self.toolbarView.titleView.text = title;
}


- (SuperToolbarView *)toolbarView{
    if (!_toolbarView) {
        _toolbarView = [SuperToolbarView new];
    }
    return _toolbarView;
}


- (SuperToolbarView*)addLeftItem:(UIView *)data{
    [self.toolbarView.leftContainer addSubview:data];
    return self.toolbarView;
}

- (SuperToolbarView*)addRightItem:(UIView *)data{
    [self.toolbarView.rightContainer addSubview:data];
    return self.toolbarView;
}

- (SuperToolbarView*)addcontentItem:(UIView *)data{
    [self.toolbarView.centerContainer addSubview:data];
    return self.toolbarView;
}


@end
