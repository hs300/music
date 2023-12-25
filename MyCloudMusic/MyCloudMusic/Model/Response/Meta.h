//
//  Meta.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/17.
//

#import "SuperBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface Meta : SuperBase
@property (nonatomic, assign)int total;
@property(nonatomic, assign)int pages;
@property(nonatomic, assign)int size;
@property(nonatomic, assign)int page;
@property(nonatomic, assign)int next;
@end

NS_ASSUME_NONNULL_END
