//
//  UIStoryboard+ViewControllerInstantiate.h
//  Tournament
//
//  Created by Nicolas Purita on 3/17/13.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (ViewControllerInstantiate)

+ (id) instantiateViewControllerWithIdentifier:(NSString*) identifier fromStoryboard:(NSString*) storyboardName;
+ (id) instantiateInitialViewControllerFromStoryboard:(NSString*) storyboardName;

@end
