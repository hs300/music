//
//  BanerClickEvent.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/24.
//

#import <Foundation/Foundation.h>
#import "Ad.h"
NS_ASSUME_NONNULL_BEGIN

@interface BanerClickEvent : NSObject<QTEvent>

@property(nonatomic, strong)Ad *data;

@end

NS_ASSUME_NONNULL_END
