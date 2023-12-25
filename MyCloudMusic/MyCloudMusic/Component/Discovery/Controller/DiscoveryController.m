//
//  DiscoveryController.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/17.
//

#import "DiscoveryController.h"
#import "BannerData.h"
#import "BanerClickEvent.h"
#import "DiscoveryButtonCell.h"
#import "ButtonData.h"
#import "SheetGroupCell.h"
@interface DiscoveryController ()

@end

@implementation DiscoveryController

- (void)initViews{
    [super initViews];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initTableViewSafeArea];
    
    [self.tableView registerClass:[BannerCell class] forCellReuseIdentifier:BannerCellName];
    
    [self.tableView registerClass:[DiscoveryButtonCell class] forCellReuseIdentifier:DiscoveryBtnCellName];
    
    [self.tableView registerClass:[SheetGroupCell class ] forCellReuseIdentifier:SheetGroupCellName];
}

- (void)initDatum{
    [super initDatum];
    
    [self loadData];
}

- (void)loadData:(BOOL)isPlaceholder{
    [self.datum removeAllObjects];
    
//    [[DefaultRepository shared] bannerAdWithController:self success:^(BaseResponse * _Nonnull baseResponse, Meta * _Nonnull meta, NSArray * _Nonnull data) {
//        BannerData *bannerData = [BannerData new];
//        bannerData.data = data;
//        //[self.datum addObject:bannerData];
//        ButtonData *btnData = [ButtonData new];
//        btnData.datum;
//        [self.datum addObject: btnData];
//        
//        [self.tableView reloadData];
//    }];
    
    
    [self loadSheetData];
}


-(void)loadSheetData{
    [[DefaultRepository shared] sheets:12 controller:self success:^(BaseResponse * _Nonnull baseResponse, Meta * _Nonnull meta, NSArray * _Nonnull data) {
        //添加歌单数据
        SheetData *sheetData=[SheetData new];
        sheetData.datum = data;
        [self.datum addObject:sheetData];
  
        [self.tableView reloadData];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSObject *data = self.datum[indexPath.row];
    ListStyle style = [self typeForItemAtIndexPath:indexPath];
    switch (style) {
        case StyleBanner:{
            BannerCell *cell = [tableView dequeueReusableCellWithIdentifier:BannerCellName forIndexPath:indexPath];
            [cell bind:data];
            return cell;
        }
            
        case StyleButton:{
            DiscoveryButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:DiscoveryBtnCellName forIndexPath:indexPath];
            [cell bind:data];
            return cell;
            
        }
            
        case StyleSheet:{
            SheetGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:SheetGroupCellName forIndexPath:indexPath];
            [cell bind:data];
            return cell;
            
        }
        default:
            return nil;;
    }
    
    
}

- (void)initListeners{
    [super initListeners];
    @weakify(self);
    [QTSubMain(self, BanerClickEvent) next:^(BanerClickEvent *event){
        @strongify(self);
        [self processAdClick:event.data];
    }];
}

- (void)processAdClick:(Ad *)data{
    
}

- (ListStyle)typeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSObject *data = self.datum[indexPath.row];
    if ([data isKindOfClass:[BannerData class]]) {
        return StyleBanner;
    }
    else if([data isKindOfClass:[ButtonData class]]){
        return StyleButton;
    }
    else if ([data isKindOfClass:[SheetData class]]){
        return StyleSheet;
    }
    return StyleNone;
}

@end
