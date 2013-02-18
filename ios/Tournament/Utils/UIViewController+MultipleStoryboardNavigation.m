//
//  UIViewController+MultipleStoryboardNavigation.m
//  Tournament
//
//  Created by Nicolas Purita on 3/17/13.
//

#import "UIViewController+MultipleStoryboardNavigation.h"

@implementation UIViewController (MultipleStoryboardNavigation)

- (UIViewController *)controllerWithIdentifier:(NSString *)identifier fromStoryboard:(NSString *)storyboardName {
    UIViewController* viewController = [UIStoryboard instantiateViewControllerWithIdentifier:identifier fromStoryboard:storyboardName];
    return viewController;
}

- (void)presentViewControllerWithIdentifier:(NSString *)identifier fromStoryboard:(NSString *)storyboardName animated:(BOOL)flag completion:(void (^)(void))completion {
    [self presentViewController:[self controllerWithIdentifier:identifier fromStoryboard:storyboardName]
                       animated:flag
                     completion:completion];
}

- (void)presentInitialViewControllerFromStoryboard:(NSString *)storyboardName animated:(BOOL)flag completion:(void (^)(void))completion {
    UIViewController* viewController = [UIStoryboard instantiateInitialViewControllerFromStoryboard:storyboardName];
    [self presentViewController:viewController animated:flag completion:completion];
}

- (void)presentInitialViewControllerFromStoryboard:(NSString *)storyboardName animated:(BOOL)flag completion:(void (^)(void))completion initialization:(void (^)(id controller))initialization {
    UIViewController* viewController = [UIStoryboard instantiateInitialViewControllerFromStoryboard:storyboardName];
    if (initialization) {
        initialization(viewController);
    }
    [self presentViewController:viewController animated:flag completion:completion];
}
@end
