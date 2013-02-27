//
//  UIImage+ResizableImages.h
//  Observing
//
//  Created by Hernan Zalazar on 12/6/12.
//  Copyright (c) 2012 UPhoenix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ResizableImages)

+ (UIImage*)resizableImageNamed:(NSString*) imageName capInsets:(UIEdgeInsets) capInsets;
+ (UIImage*)resizableImageNamed:(NSString*) imageName capInsets:(UIEdgeInsets) capInsets resizeMode:(UIImageResizingMode) resizeMode;

@end
