//
//  UIColor+CustomBuilders.m
//  Observing
//
//  Created by Hernan Zalazar on 12/11/12.
//  Copyright (c) 2012 UPhoenix. All rights reserved.
//

#import "UIColor+CustomBuilders.h"

@implementation UIColor (CustomBuilders)

+ (UIColor *)colorWithRGBValuesForRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [UIColor colorWithRGBValuesForRed:red green:green blue:blue alpha:1.0f];
}

+ (UIColor *)colorWithRGBValuesForRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}
@end
