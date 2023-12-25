//
//  SuperDateUtil.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/10.
//

#import "SuperDateUtil.h"

@implementation SuperDateUtil
+ (NSInteger) currentYear{
    NSDate *data = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
    NSDateComponents *d = [cal components:unitFlags fromDate:data];
    
    NSInteger year = [d year];
    
    return year;;
}
@end
