//
//  UIImage+ResizableImages.m
//  Observing
//
//  Created by Hernan Zalazar on 12/6/12.
//  Copyright (c) 2012 UPhoenix. All rights reserved.
//

#import "UIImage+ResizableImages.h"

@implementation UIImage (ResizableImages)

+ (UIImage*)resizableImageNamed:(NSString *)imageName capInsets:(UIEdgeInsets)capInsets {
    return [[UIImage imageNamed:imageName] resizableImageWithCapInsets:capInsets];
}

+ (UIImage*)resizableImageNamed:(NSString*) imageName capInsets:(UIEdgeInsets) capInsets resizeMode:(UIImageResizingMode) resizeMode {
    return [[UIImage imageNamed:imageName] resizableImageWithCapInsets:capInsets resizingMode:resizeMode];
}

@end
