//
//  UIView+SuperUI.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/30.
//

#import "UIView+SuperUI.h"

@implementation UIView (SupperUI)


- (void)smallRadius{
    self.layer.cornerRadius = SMALL_RADIUS;
    self.layer.borderWidth = 1;
    self.layer.borderColor = [[UIColor colorDivider] CGColor];
}
@end
