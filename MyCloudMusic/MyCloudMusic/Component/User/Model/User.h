//
//  User.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/31.
//

#import "SuperCommon.h"

NS_ASSUME_NONNULL_BEGIN

@interface User : SuperCommon
@property(nonatomic, strong)NSString *nickname;
@property(nonatomic, strong)NSString *icon;
@property(nonatomic, strong)NSString *phone;
@property(nonatomic, strong)NSString *email;
@property(nonatomic, strong)NSString *password;
@property(nonatomic, strong)NSString *wechatId;
@property(nonatomic, strong)NSString *qqId;
@property(nonatomic, strong)NSString *appleId;
@property(nonatomic, strong)NSString *code;
@property(nonatomic, strong)NSString *province;
@property(nonatomic, strong)NSString *city;
@property(nonatomic, strong)NSString *cityCode;
@property(nonatomic, strong)NSString *area;
@property(nonatomic, strong)NSString *areaCode;
@property(nonatomic, assign)long followingsCount;
@property(nonatomic, assign)long followersCount;
@property(nonatomic, strong)NSString *following;

@property(nonatomic, assign)int gender;
@property(nonatomic, strong)NSString *birthday;
@property(nonatomic, strong)NSString *device;
@property(nonatomic, strong)NSString *push;
@property(nonatomic, assign)int platform;
@property(nonatomic, strong)NSString *roomId;
@property(nonatomic, strong)NSString *roles;
@property(nonatomic, strong)NSString *punyin;
@property(nonatomic, strong)NSString *pinyinFirst;
@property(nonatomic, strong)NSString *first;

@end

NS_ASSUME_NONNULL_END
