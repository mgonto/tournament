//
//  UIViewController+BlockActioner.m
//  Tournament
//
//  Created by Nicolas Purita on 3/7/13.
//
//

#import "UIViewController+BlockActioner.h"
#import <objc/runtime.h>

static char beforeBackBlockKey;

@implementation UIViewController (BlockActioner)

- (void) setBeforeBackBlock:(backBlock)beforeBackBlock{
    objc_setAssociatedObject(self, &beforeBackBlockKey, beforeBackBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (backBlock) beforeBackBlock {
    return objc_getAssociatedObject(self, &beforeBackBlockKey);
}


@end
