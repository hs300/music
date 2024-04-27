//
//  SheetGroupCell.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/24.
//

#import "SheetGroupCell.h"
#import "SheetCell.h"
@interface SheetGroupCell()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
    
@property (nonatomic, assign)int spanCount;
@property (nonatomic, assign)CGFloat cellWidth;
@property (nonatomic, assign)CGFloat cellHeight;
@end

@implementation SheetGroupCell
-(void)initView{
    [super initView];
    self.backgroundColor = [UIColor greenColor];
    
    [self.container addSubview:self.titleView];
    
    _collectionView = [ViewFactoryUtil collectionView];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.container addSubview:_collectionView];
    [_collectionView registerClass:[SheetCell class] forCellWithReuseIdentifier:SheetCellName];
}


- (void)initDatum{
    [super initDatum];
    self.spanCount = 3;
    self.datum = [NSMutableArray array];
}

-(void)bind:(SheetData *)data{
    //_collectionView registerClass:<#(nullable Class)#> forCellWithReuseIdentifier:<#(nonnull NSString *)#>
    _cellWidth = (SCREEN_WIDTH - PADDING_OUTER * 2 - (self.spanCount - 1) * 5) / self.spanCount;
    _cellHeight = _cellWidth + 5 + 40;
    int rows = ceil([data.datum count] * 1.0 / self.spanCount);
    
    float viewHeight = rows * (_cellHeight + PADDING_MEDDLE);
    
    self.collectionView.myHeight = viewHeight;
    
    [self.datum removeAllObjects];
    [self.datum addObjectsFromArray:data.datum];
    [self.collectionView reloadData];
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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.datum.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    Sheet *data = self.datum[indexPath.row];
    SheetCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SheetCellName forIndexPath:indexPath];
    [cell bind:data];
    return cell;
}



- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, PADDING_OUTER, 10, PADDING_OUTER);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return PADDING_MEDDLE;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return PADDING_SMALL;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(_cellWidth, _cellHeight);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_delegate) {
        Sheet *data = self.datum[indexPath.row];
        [_delegate sheetClick:data];
    }
}


@end
