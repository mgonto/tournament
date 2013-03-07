//
//  UIViewController+BlockActioner.h
//  Tournament
//
//  Created by Nicolas Purita on 3/7/13.
//
//

#import <UIKit/UIKit.h>

typedef void(^backBlock)(void);

@interface UIViewController (BlockActioner)

@property (copy, nonatomic) backBlock beforeBackBlock;

@end
