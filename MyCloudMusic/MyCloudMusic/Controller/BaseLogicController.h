//
//  BaseLogicController.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/10.
//

#import "BaseCommonController.h"
#import "MyLayout/MyLayout.h"
NS_ASSUME_NONNULL_BEGIN

@interface BaseLogicController : BaseCommonController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)NSMutableArray *datum;

@property (nonatomic, strong)MyBaseLayout *rootContainer;
@property (nonatomic, strong)MyBaseLayout *container;
@property (nonatomic, strong)MyBaseLayout *frameContainer;
@property (nonatomic, strong)MyBaseLayout *superHeaderContainer;
@property (nonatomic, strong)MyBaseLayout *superHeaderContentContainer;
@property (nonatomic, strong)MyBaseLayout *superFooterContainer;
@property (nonatomic, strong)MyBaseLayout *superFoooterContentContaier;
@property (nonatomic, strong)UITableView *tableView;

- (void)initRelativeLayoutSafeArea;

- (void)initLinearLayout;

- (void)initLinearLayoutSafeArea;

- (void)initTableViewSafeArea;

- (void)initDefaultTableViewDivider;

- (void)loadData:(BOOL)isPlaceholder;

- (void)loadData;
@end

NS_ASSUME_NONNULL_END
