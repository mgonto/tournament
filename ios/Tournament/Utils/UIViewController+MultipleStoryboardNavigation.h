//
//  UIViewController+MultipleStoryboardNavigation.h
//  Tournament
//
//  Created by Nicolas Purita on 3/17/13.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MultipleStoryboardNavigation)

- (UIViewController *)controllerWithIdentifier:(NSString *)identifier fromStoryboard:(NSString *)storyboardName;
- (void)presentViewControllerWithIdentifier:(NSString *)identifier fromStoryboard:(NSString*)storyboardName animated:(BOOL)flag completion:(void (^)(void))completion;
- (void)presentInitialViewControllerFromStoryboard:(NSString *)storyboardName animated:(BOOL)flag completion:(void (^)(void))completion;
- (void)presentInitialViewControllerFromStoryboard:(NSString *)storyboardName animated:(BOOL)flag completion:(void (^)(void))completion initialization:(void (^)(id controller)) initialization;

@end
