//
//  SongGroupCell.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/31.
//

#import "SongGroupCell.h"
#import "DiscoverySongCell.h"
@interface SongGroupCell ()<QMUITableViewDelegate, QMUITableViewDataSource>

@end

static float const Height = 51 + 10 * 2;

@implementation SongGroupCell


- (void)initView{
    [super initView];
    
    _tableView = [ViewFactoryUtil tabelView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.separatorColor = [UIColor colorDivider];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.container addSubview:_tableView];
    
    [_tableView registerClass:[DiscoverySongCell class] forCellReuseIdentifier:DiscoverySongCellName];
}

- (void)initDatum{
    [super initDatum];
    self.datum = [NSMutableArray array];
}


-(void)bind:(SongData *)data{
    float viewHeight = data.datum.count * Height;
    self.tableView.myHeight = viewHeight;
    [self.datum removeAllObjects];
    [self.datum addObjectsFromArray:data.datum];
    [self.tableView reloadData];
}

- (MyOrientation)getContainerOrientation{
    return MyOrientation_Vert;
}


- (ItemTitleView *)titleView{
    if (!_titleView) {
        _titleView = [ItemTitleView new];
        _titleView.myWidth = MyLayoutSize.fill;
        _titleView.myHeight = MyLayoutSize.wrap;
        _titleView.titleView.text = R.string.localizable.recommendSheet;
    }
    return _titleView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datum.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Song *data = self.datum[indexPath.row];
    DiscoverySongCell *cell = [tableView dequeueReusableCellWithIdentifier:DiscoverySongCellName forIndexPath:indexPath];
    
    [cell bind:data position:1];
    return cell;
}

@end
