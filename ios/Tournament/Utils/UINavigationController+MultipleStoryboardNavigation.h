//
//  UINavigationController+MultipleStoryboardNavigation.h
//  Tournament
//
//  Created by Nicolas Purita on 3/17/13.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (MultipleStoryboardNavigation)

- (void) pushViewControllerWithIdentifier:(NSString *)viewControllerIdentifier fromStoryboard:(NSString *)storyboard block:(void(^)(id viewController)) block;

@end
