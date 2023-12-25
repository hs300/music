//
//  BaseLogicController.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/10.
//

#import "BaseLogicController.h"
@interface BaseLogicController ()

@end

@implementation BaseLogicController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)initLinearLayout{
    _rootContainer =[MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    _rootContainer.myWidth = MyLayoutSize.fill;
    _rootContainer.myHeight = MyLayoutSize.fill;
    _rootContainer.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_rootContainer];
}

- (void)initRelativeLayoutSafeArea{
    [self initLinearLayout];
    [self initHeaderContainer];
    
    _container = [[MyRelativeLayout alloc] init];
    _container.myWidth = MyLayoutSize.fill;
    _container.myHeight = MyLayoutSize.wrap;
    _container.weight = 1;
    _container.backgroundColor = [UIColor clearColor];
    [_rootContainer addSubview:_container];
    [self initFooterContainer];
    
   
    
    
}

- (void)initHeaderContainer{
    _superHeaderContainer = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Vert];
    _superHeaderContainer.backgroundColor = [UIColor clearColor];
    _superHeaderContainer.myWidth = MyLayoutSize.fill;
    _superFooterContainer.myHeight = MyLayoutSize.wrap;
    
    _superHeaderContentContainer = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Horz];
    _superHeaderContentContainer.leadingPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    _superHeaderContentContainer.trailingPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    _superHeaderContentContainer.topPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    _superHeaderContentContainer.myHeight = MyLayoutSize.wrap;
    
    [_rootContainer addSubview:_superHeaderContainer];
    [_superHeaderContainer addSubview:_superHeaderContentContainer];

}

- (void)initFooterContainer{
    _superFooterContainer = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Vert];
    _superFooterContainer.myWidth = MyLayoutSize.fill;
    _superFooterContainer.myHeight = MyLayoutSize.wrap;
    _superFooterContainer.backgroundColor = [UIColor redColor];
    [_rootContainer addSubview:_superFooterContainer];
    
    _superFoooterContentContaier = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Horz];
    _superFoooterContentContaier.bottomPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    _superFoooterContentContaier.trailingPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    _superFoooterContentContaier.leadingPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    _superFoooterContentContaier.myHeight = 0;  //=@(10);
    _superFoooterContentContaier.backgroundColor = [UIColor yellowColor];
    [_superFooterContainer addSubview:_superFoooterContentContaier];
}

- (void)initLinearLayoutSafeArea{
    [self initLinearLayout];
    
    //header
    [self initHeaderContainer];
    
    //frame
    self.frameContainer=[MyRelativeLayout new];
    self.frameContainer.myWidth = MyLayoutSize.fill;
    self.frameContainer.myHeight = MyLayoutSize.wrap;
    self.frameContainer.weight = 1;
    self.frameContainer.backgroundColor = [UIColor clearColor];
    [_rootContainer addSubview:self.frameContainer];
    
    _container = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    _container.myWidth = MyLayoutSize.fill;
    _container.myHeight = MyLayoutSize.fill;
    _container.gravity = MyGravity_Vert_Stretch;
    _container.backgroundColor = [UIColor clearColor];
    [self.frameContainer addSubview:_container];
    
    //footer，一般是底部要显示按钮，例如：购物车界面，商城相关界面
    //当然也可以细分到需要的界面才添加，但这样会增加复杂度
    [self initFooterContainer];
}


- (void)initTableViewSafeArea{
    [self initLinearLayoutSafeArea];
    
    [self createTableView];
    
    [self.container addSubview:self.tableView];
}

- (void)createTableView{
    self.datum = [NSMutableArray array];
    self.tableView = [ViewFactoryUtil tabelView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.weight = 1;
}

- (void)initDefaultTableViewDivider{
    if (self.tableView != nil) {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datum.count;
}

- (void)loadData:(BOOL)isPlaceholder{
    
}

- (void)loadData{
    [self loadData: NO];
}


@end
