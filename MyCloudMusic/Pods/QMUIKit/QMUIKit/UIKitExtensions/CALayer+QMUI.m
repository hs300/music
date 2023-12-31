/**
 * Tencent is pleased to support the open source community by making QMUI_iOS available.
 * Copyright (C) 2016-2021 THL A29 Limited, a Tencent company. All rights reserved.
 * Licensed under the MIT License (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
 * http://opensource.org/licenses/MIT
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
 */

//
//  CALayer+QMUI.m
//  qmui
//
//  Created by QMUI Team on 16/8/12.
//

#import "CALayer+QMUI.h"
#import "UIView+QMUI.h"
#import "QMUICore.h"
#import "QMUILog.h"
#import "UIColor+QMUI.h"

@interface CALayer ()

@property(nonatomic, assign) float qmui_speedBeforePause;

@end

@implementation CALayer (QMUI)

QMUISynthesizeFloatProperty(qmui_speedBeforePause, setQmui_speedBeforePause)
QMUISynthesizeCGFloatProperty(qmui_originCornerRadius, setQmui_originCornerRadius)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 由于其他方法需要通过调用 qmuilayer_setCornerRadius: 来执行 swizzle 前的实现，所以这里暂时用 ExchangeImplementations
        ExchangeImplementations([CALayer class], @selector(setCornerRadius:), @selector(qmuilayer_setCornerRadius:));
        
        ExtendImplementationOfNonVoidMethodWithoutArguments([CALayer class], @selector(init), CALayer *, ^CALayer *(CALayer *selfObject, CALayer *originReturnValue) {
            selfObject.qmui_speedBeforePause = selfObject.speed;
            selfObject.qmui_maskedCorners = QMUILayerAllCorner;
            return originReturnValue;
        });
        
        OverrideImplementation([CALayer class], @selector(setBounds:), ^id(__unsafe_unretained Class originClass, SEL originCMD, IMP (^originalIMPProvider)(void)) {
            return ^(CALayer *selfObject, CGRect bounds) {
                
                // 对非法的 bounds，Debug 下中 assert，Release 下会将其中的 NaN 改为 0，避免 crash
                if (CGRectIsNaN(bounds)) {
                    QMUIAssert(NO, @"CALayer (QMUI)", @"%@ setBounds:%@，参数包含 NaN，已被拦截并处理为 0。%@", selfObject, NSStringFromCGRect(bounds), [NSThread callStackSymbols]);
                    if (!IS_DEBUG) {
                        bounds = CGRectSafeValue(bounds);
                    }
                }
                
                // call super
                void (*originSelectorIMP)(id, SEL, CGRect);
                originSelectorIMP = (void (*)(id, SEL, CGRect))originalIMPProvider();
                originSelectorIMP(selfObject, originCMD, bounds);
            };
        });
        
        OverrideImplementation([CALayer class], @selector(setPosition:), ^id(__unsafe_unretained Class originClass, SEL originCMD, IMP (^originalIMPProvider)(void)) {
            return ^(CALayer *selfObject, CGPoint position) {
                
                // 对非法的 position，Debug 下中 assert，Release 下会将其中的 NaN 改为 0，避免 crash
                if (isnan(position.x) || isnan(position.y)) {
                    QMUIAssert(NO, @"CALayer (QMUI)", @"%@ setPosition:%@，参数包含 NaN，已被拦截并处理为 0。%@", selfObject, NSStringFromCGPoint(position), [NSThread callStackSymbols]);
                    if (!IS_DEBUG) {
                        position = CGPointMake(CGFloatSafeValue(position.x), CGFloatSafeValue(position.y));
                    }
                }
                
                // call super
                void (*originSelectorIMP)(id, SEL, CGPoint);
                originSelectorIMP = (void (*)(id, SEL, CGPoint))originalIMPProvider();
                originSelectorIMP(selfObject, originCMD, position);
            };
        });
    });
}

- (BOOL)qmui_isRootLayerOfView {
    return [self.delegate isKindOfClass:[UIView class]] && ((UIView *)self.delegate).layer == self;
}

- (void)qmuilayer_setCornerRadius:(CGFloat)cornerRadius {
    BOOL cornerRadiusChanged = flat(self.qmui_originCornerRadius) != flat(cornerRadius);// flat 处理，避免浮点精度问题
    self.qmui_originCornerRadius = cornerRadius;
    [self qmuilayer_setCornerRadius:cornerRadius];
    if (cornerRadiusChanged) {
        // 需要刷新border
        if ([self.delegate respondsToSelector:@selector(layoutSublayersOfLayer:)]) {
            UIView *view = (UIView *)self.delegate;
            if (view.qmui_borderPosition > 0 && view.qmui_borderWidth > 0) {
                [view.qmui_borderLayer setNeedsLayout];// 直接调用 layer 的 setNeedsLayout，没有线程限制，如果通过 view 调用则需要在主线程才行
            }
        }
    }
}

static char kAssociatedObjectKey_pause;
- (void)setQmui_pause:(BOOL)qmui_pause {
    if (qmui_pause == self.qmui_pause) {
        return;
    }
    if (qmui_pause) {
        self.qmui_speedBeforePause = self.speed;
        CFTimeInterval pausedTime = [self convertTime:CACurrentMediaTime() fromLayer:nil];
        self.speed = 0;
        self.timeOffset = pausedTime;
    } else {
        CFTimeInterval pausedTime = self.timeOffset;
        self.speed = self.qmui_speedBeforePause;
        self.timeOffset = 0;
        self.beginTime = 0;
        CFTimeInterval timeSincePause = [self convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
        self.beginTime = timeSincePause;
    }
    objc_setAssociatedObject(self, &kAssociatedObjectKey_pause, @(qmui_pause), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)qmui_pause {
    return [((NSNumber *)objc_getAssociatedObject(self, &kAssociatedObjectKey_pause)) boolValue];
}

static char kAssociatedObjectKey_maskedCorners;
- (void)setQmui_maskedCorners:(QMUICornerMask)qmui_maskedCorners {
    BOOL maskedCornersChanged = qmui_maskedCorners != self.qmui_maskedCorners;
    objc_setAssociatedObject(self, &kAssociatedObjectKey_maskedCorners, @(qmui_maskedCorners), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.maskedCorners = (CACornerMask)qmui_maskedCorners;
    if (maskedCornersChanged) {
        // 需要刷新border
        if ([self.delegate respondsToSelector:@selector(layoutSublayersOfLayer:)]) {
            UIView *view = (UIView *)self.delegate;
            if (view.qmui_borderPosition > 0 && view.qmui_borderWidth > 0) {
                [view.qmui_borderLayer setNeedsLayout];// 直接调用 layer 的 setNeedsLayout，没有线程限制，如果通过 view 调用则需要在主线程才行
            }
        }
    }
}

- (QMUICornerMask)qmui_maskedCorners {
    return [objc_getAssociatedObject(self, &kAssociatedObjectKey_maskedCorners) unsignedIntegerValue];
}

static char kAssociatedObjectKey_shadow;
- (void)setQmui_shadow:(NSShadow *)shadow {
    if (shadow) {
        if ([shadow.shadowColor isKindOfClass:UIColor.class]) {
            self.shadowColor = ((UIColor *)shadow.shadowColor).CGColor;
        }
        self.shadowOffset = shadow.shadowOffset;
        self.shadowRadius = shadow.shadowBlurRadius;
        self.shadowOpacity = 1;
    } else if (self.qmui_shadow)  {
        // 仅当之前已经用 qmui_shadow 设置过阴影时，才支持通过 qmui_shadow = nil 来去除阴影，否则什么都不做。
        self.shadowOpacity = 0;
    }
    objc_setAssociatedObject(self, &kAssociatedObjectKey_shadow, shadow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSShadow *)qmui_shadow {
    return (NSShadow *)objc_getAssociatedObject(self, &kAssociatedObjectKey_shadow);
}

static char kAssociatedObjectKey_maskPathBlock;
- (void)setQmui_maskPathBlock:(UIBezierPath * _Nonnull (^)(__kindof CALayer * _Nonnull))qmui_maskPathBlock {
    objc_setAssociatedObject(self, &kAssociatedObjectKey_maskPathBlock, qmui_maskPathBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (qmui_maskPathBlock) {
        [CALayer qmui_hookMaskIfNeeded];
        CAShapeLayer *mask = CAShapeLayer.layer;
        self.mask = mask;
        [self setNeedsLayout];
    } else {
        self.mask = nil;
    }
}

- (UIBezierPath * _Nonnull (^)(__kindof CALayer * _Nonnull))qmui_maskPathBlock {
    return (UIBezierPath * _Nonnull (^)(__kindof CALayer * _Nonnull))objc_getAssociatedObject(self, &kAssociatedObjectKey_maskPathBlock);
}

static char kAssociatedObjectKey_evenOddMaskPathBlock;
- (void)setQmui_evenOddMaskPathBlock:(UIBezierPath * _Nonnull (^)(__kindof CALayer * _Nonnull))qmui_evenOddMaskPathBlock {
    objc_setAssociatedObject(self, &kAssociatedObjectKey_evenOddMaskPathBlock, qmui_evenOddMaskPathBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (qmui_evenOddMaskPathBlock) {
        [CALayer qmui_hookMaskIfNeeded];
        CAShapeLayer *mask = CAShapeLayer.layer;
        mask.fillRule = kCAFillRuleEvenOdd;
        self.mask = mask;
        [self setNeedsLayout];
    } else {
        self.mask = nil;
    }
}

- (UIBezierPath * _Nonnull (^)(__kindof CALayer * _Nonnull))qmui_evenOddMaskPathBlock {
    return (UIBezierPath * _Nonnull (^)(__kindof CALayer * _Nonnull))objc_getAssociatedObject(self, &kAssociatedObjectKey_evenOddMaskPathBlock);
}

+ (void)qmui_hookMaskIfNeeded {
    [QMUIHelper executeBlock:^{
        OverrideImplementation([CALayer class], @selector(layoutSublayers), ^id(__unsafe_unretained Class originClass, SEL originCMD, IMP (^originalIMPProvider)(void)) {
            return ^(CALayer *selfObject) {
                
                // call super
                void (*originSelectorIMP)(id, SEL);
                originSelectorIMP = (void (*)(id, SEL))originalIMPProvider();
                originSelectorIMP(selfObject, originCMD);
                
                if (selfObject.qmui_maskPathBlock && [selfObject.mask isKindOfClass:CAShapeLayer.class]) {
                    ((CAShapeLayer *)selfObject.mask).path = selfObject.qmui_maskPathBlock(selfObject).CGPath;
                }
                if (selfObject.qmui_evenOddMaskPathBlock && [selfObject.mask isKindOfClass:CAShapeLayer.class]) {
                    UIBezierPath *path = [UIBezierPath bezierPathWithRect:selfObject.bounds];
                    UIBezierPath *maskPath = selfObject.qmui_evenOddMaskPathBlock(selfObject);
                    [path appendPath:maskPath];
                    ((CAShapeLayer *)selfObject.mask).path = path.CGPath;
                }
            };
        });
    } oncePerIdentifier:@"CALayer (QMUI) mask"];
}

- (__kindof CALayer *)qmui_layerWithName:(NSString *)name {
    if ([self.name isEqualToString:name]) return self;
    for (CALayer *sublayer in self.sublayers) {
        CALayer *result = [sublayer qmui_layerWithName:name];
        if (result) return result;
    }
    return nil;
}

- (void)qmui_sendSublayerToBack:(CALayer *)sublayer {
    [self insertSublayer:sublayer atIndex:0];
}

- (void)qmui_bringSublayerToFront:(CALayer *)sublayer {
    [self insertSublayer:sublayer atIndex:(unsigned)self.sublayers.count];
}

- (void)qmui_removeDefaultAnimations {
    NSMutableDictionary<NSString *, id<CAAction>> *actions = @{NSStringFromSelector(@selector(bounds)): [NSNull null],
                                                               NSStringFromSelector(@selector(position)): [NSNull null],
                                                               NSStringFromSelector(@selector(zPosition)): [NSNull null],
                                                               NSStringFromSelector(@selector(anchorPoint)): [NSNull null],
                                                               NSStringFromSelector(@selector(anchorPointZ)): [NSNull null],
                                                               NSStringFromSelector(@selector(transform)): [NSNull null],
                                                               BeginIgnoreClangWarning(-Wundeclared-selector)
                                                               NSStringFromSelector(@selector(hidden)): [NSNull null],
                                                               NSStringFromSelector(@selector(doubleSided)): [NSNull null],
                                                               EndIgnoreClangWarning
                                                               NSStringFromSelector(@selector(sublayerTransform)): [NSNull null],
                                                               NSStringFromSelector(@selector(masksToBounds)): [NSNull null],
                                                               NSStringFromSelector(@selector(contents)): [NSNull null],
                                                               NSStringFromSelector(@selector(contentsRect)): [NSNull null],
                                                               NSStringFromSelector(@selector(contentsScale)): [NSNull null],
                                                               NSStringFromSelector(@selector(contentsCenter)): [NSNull null],
                                                               NSStringFromSelector(@selector(minificationFilterBias)): [NSNull null],
                                                               NSStringFromSelector(@selector(backgroundColor)): [NSNull null],
                                                               NSStringFromSelector(@selector(cornerRadius)): [NSNull null],
                                                               NSStringFromSelector(@selector(borderWidth)): [NSNull null],
                                                               NSStringFromSelector(@selector(borderColor)): [NSNull null],
                                                               NSStringFromSelector(@selector(opacity)): [NSNull null],
                                                               NSStringFromSelector(@selector(compositingFilter)): [NSNull null],
                                                               NSStringFromSelector(@selector(filters)): [NSNull null],
                                                               NSStringFromSelector(@selector(backgroundFilters)): [NSNull null],
                                                               NSStringFromSelector(@selector(shouldRasterize)): [NSNull null],
                                                               NSStringFromSelector(@selector(rasterizationScale)): [NSNull null],
                                                               NSStringFromSelector(@selector(shadowColor)): [NSNull null],
                                                               NSStringFromSelector(@selector(shadowOpacity)): [NSNull null],
                                                               NSStringFromSelector(@selector(shadowOffset)): [NSNull null],
                                                               NSStringFromSelector(@selector(shadowRadius)): [NSNull null],
                                                               NSStringFromSelector(@selector(shadowPath)): [NSNull null],
                                                               NSStringFromSelector(@selector(maskedCorners)): [NSNull null],
    }.mutableCopy;
    
    if ([self isKindOfClass:[CAShapeLayer class]]) {
        [actions addEntriesFromDictionary:@{NSStringFromSelector(@selector(path)): [NSNull null],
                                            NSStringFromSelector(@selector(fillColor)): [NSNull null],
                                            NSStringFromSelector(@selector(strokeColor)): [NSNull null],
                                            NSStringFromSelector(@selector(strokeStart)): [NSNull null],
                                            NSStringFromSelector(@selector(strokeEnd)): [NSNull null],
                                            NSStringFromSelector(@selector(lineWidth)): [NSNull null],
                                            NSStringFromSelector(@selector(miterLimit)): [NSNull null],
                                            NSStringFromSelector(@selector(lineDashPhase)): [NSNull null]}];
    }
    
    if ([self isKindOfClass:[CAGradientLayer class]]) {
        [actions addEntriesFromDictionary:@{NSStringFromSelector(@selector(colors)): [NSNull null],
                                            NSStringFromSelector(@selector(locations)): [NSNull null],
                                            NSStringFromSelector(@selector(startPoint)): [NSNull null],
                                            NSStringFromSelector(@selector(endPoint)): [NSNull null]}];
    }
    
    self.actions = actions;
}

+ (void)qmui_performWithoutAnimation:(void (NS_NOESCAPE ^)(void))actionsWithoutAnimation {
    if (!actionsWithoutAnimation) return;
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    actionsWithoutAnimation();
    [CATransaction commit];
}

+ (CAShapeLayer *)qmui_separatorDashLayerWithLineLength:(NSInteger)lineLength
                                            lineSpacing:(NSInteger)lineSpacing
                                              lineWidth:(CGFloat)lineWidth
                                              lineColor:(CGColorRef)lineColor
                                           isHorizontal:(BOOL)isHorizontal {
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = UIColorClear.CGColor;
    layer.strokeColor = lineColor;
    layer.lineWidth = lineWidth;
    layer.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInteger:lineLength], [NSNumber numberWithInteger:lineSpacing], nil];
    layer.masksToBounds = YES;
    
    CGMutablePathRef path = CGPathCreateMutable();
    if (isHorizontal) {
        CGPathMoveToPoint(path, NULL, 0, lineWidth / 2);
        CGPathAddLineToPoint(path, NULL, SCREEN_WIDTH, lineWidth / 2);
    } else {
        CGPathMoveToPoint(path, NULL, lineWidth / 2, 0);
        CGPathAddLineToPoint(path, NULL, lineWidth / 2, SCREEN_HEIGHT);
    }
    layer.path = path;
    CGPathRelease(path);
    
    return layer;
}

+ (CAShapeLayer *)qmui_separatorDashLayerInHorizontal {
    CAShapeLayer *layer = [CAShapeLayer qmui_separatorDashLayerWithLineLength:2 lineSpacing:2 lineWidth:PixelOne lineColor:UIColorSeparatorDashed.CGColor isHorizontal:YES];
    return layer;
}

+ (CAShapeLayer *)qmui_separatorDashLayerInVertical {
    CAShapeLayer *layer = [CAShapeLayer qmui_separatorDashLayerWithLineLength:2 lineSpacing:2 lineWidth:PixelOne lineColor:UIColorSeparatorDashed.CGColor isHorizontal:NO];
    return layer;
}

+ (CALayer *)qmui_separatorLayer {
    CALayer *layer = [CALayer layer];
    [layer qmui_removeDefaultAnimations];
    layer.backgroundColor = UIColorSeparator.CGColor;
    layer.frame = CGRectMake(0, 0, 0, PixelOne);
    return layer;
}

+ (CALayer *)qmui_separatorLayerForTableView {
    CALayer *layer = [self qmui_separatorLayer];
    layer.backgroundColor = TableViewSeparatorColor.CGColor;
    return layer;
}

@end

@interface CAShapeLayer (QMUI_DynamicColor)

@property(nonatomic, strong) UIColor *qcl_originalFillColor;
@property(nonatomic, strong) UIColor *qcl_originalStrokeColor;

@end

@implementation CAShapeLayer (QMUI_DynamicColor)

QMUISynthesizeIdStrongProperty(qcl_originalFillColor, setQcl_originalFillColor)
QMUISynthesizeIdStrongProperty(qcl_originalStrokeColor, setQcl_originalStrokeColor)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        OverrideImplementation([CAShapeLayer class], @selector(setFillColor:), ^id(__unsafe_unretained Class originClass, SEL originCMD, IMP (^originalIMPProvider)(void)) {
            return ^(CAShapeLayer *selfObject, CGColorRef color) {
                
                UIColor *originalColor = [(__bridge id)(color) qmui_getBoundObjectForKey:QMUICGColorOriginalColorBindKey];
                selfObject.qcl_originalFillColor = originalColor;
                
                // call super
                void (*originSelectorIMP)(id, SEL, CGColorRef);
                originSelectorIMP = (void (*)(id, SEL, CGColorRef))originalIMPProvider();
                originSelectorIMP(selfObject, originCMD, color);
            };
        });
        
        OverrideImplementation([CAShapeLayer class], @selector(setStrokeColor:), ^id(__unsafe_unretained Class originClass, SEL originCMD, IMP (^originalIMPProvider)(void)) {
            return ^(CAShapeLayer *selfObject, CGColorRef color) {
                
                UIColor *originalColor = [(__bridge id)(color) qmui_getBoundObjectForKey:QMUICGColorOriginalColorBindKey];
                selfObject.qcl_originalStrokeColor = originalColor;
                
                // call super
                void (*originSelectorIMP)(id, SEL, CGColorRef);
                originSelectorIMP = (void (*)(id, SEL, CGColorRef))originalIMPProvider();
                originSelectorIMP(selfObject, originCMD, color);
            };
        });
    });
}

- (void)qmui_setNeedsUpdateDynamicStyle {
    [super qmui_setNeedsUpdateDynamicStyle];
    
    if (self.qcl_originalFillColor) {
        self.fillColor = self.qcl_originalFillColor.CGColor;
    }
    
    if (self.qcl_originalStrokeColor) {
        self.strokeColor = self.qcl_originalStrokeColor.CGColor;
    }
}

@end

@interface CAGradientLayer (QMUI_DynamicColor)

@property(nonatomic, strong) NSArray <UIColor *>* qcl_originalColors;

@end

@implementation CAGradientLayer (QMUI_DynamicColor)

QMUISynthesizeIdStrongProperty(qcl_originalColors, setQcl_originalColors)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        OverrideImplementation([CAGradientLayer class], @selector(setColors:), ^id(__unsafe_unretained Class originClass, SEL originCMD, IMP (^originalIMPProvider)(void)) {
            return ^(CAGradientLayer *selfObject, NSArray *colors) {
                
           
                void (*originSelectorIMP)(id, SEL, NSArray *);
                originSelectorIMP = (void (*)(id, SEL, NSArray *))originalIMPProvider();
                originSelectorIMP(selfObject, originCMD, colors);
                
                
                __block BOOL hasDynamicColor = NO;
                NSMutableArray *originalColors = [NSMutableArray array];
                [colors enumerateObjectsUsingBlock:^(id color, NSUInteger idx, BOOL * _Nonnull stop) {
                    UIColor *originalColor = [color qmui_getBoundObjectForKey:QMUICGColorOriginalColorBindKey];
                    if (originalColor) {
                        hasDynamicColor = YES;
                        [originalColors addObject:originalColor];
                    } else {
                        [originalColors addObject:[UIColor colorWithCGColor:(__bridge CGColorRef _Nonnull)(color)]];
                    }
                }];
                
                if (hasDynamicColor) {
                    selfObject.qcl_originalColors = originalColors;
                } else {
                    selfObject.qcl_originalColors = nil;
                }
                
            };
        });
    });
}

- (void)qmui_setNeedsUpdateDynamicStyle {
    [super qmui_setNeedsUpdateDynamicStyle];
    
    if (self.qcl_originalColors) {
        NSMutableArray *colors = [NSMutableArray array];
        [self.qcl_originalColors enumerateObjectsUsingBlock:^(UIColor * _Nonnull color, NSUInteger idx, BOOL * _Nonnull stop) {
            [colors addObject:(__bridge id _Nonnull)(color.CGColor)];
        }];
        self.colors = colors;
    }
}

@end
