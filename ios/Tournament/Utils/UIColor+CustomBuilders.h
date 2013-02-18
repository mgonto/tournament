//
//  UIColor+CustomBuilders.h
//  Observing
//
//  Created by Hernan Zalazar on 12/11/12.
//  Copyright (c) 2012 UPhoenix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CustomBuilders)

+ (UIColor*) colorWithRGBValuesForRed:(CGFloat) red green:(CGFloat) green blue:(CGFloat) blue;

+ (UIColor*) colorWithRGBValuesForRed:(CGFloat) red green:(CGFloat) green blue:(CGFloat) blue alpha:(CGFloat) alpha;

@end
