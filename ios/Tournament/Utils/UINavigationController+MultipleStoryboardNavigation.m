//
//  UINavigationController+MultipleStoryboardNavigation.m
//  Tournament
//
//  Created by Nicolas Purita on 3/17/13.
//

#import "UINavigationController+MultipleStoryboardNavigation.h"

@implementation UINavigationController (MultipleStoryboardNavigation)

- (void)pushViewControllerWithIdentifier:(NSString *)viewControllerIdentifier fromStoryboard:(NSString *)storyboard block:(void (^)(id))block {
    UIViewController *controller = [UIStoryboard instantiateViewControllerWithIdentifier:viewControllerIdentifier fromStoryboard:storyboard];
    block(controller);
    [self pushViewController:controller animated:YES];
}

@end
