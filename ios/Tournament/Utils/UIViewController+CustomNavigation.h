//
//  UIViewController+CustomNavigation.h
//  Observing
//
//  Created by Hernan Zalazar on 1/14/13.
//  Copyright (c) 2013 UPhoenix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CustomNavigation)

- (IBAction)back:(id)sender;
- (UIBarButtonItem *)setCustomBackButton;
- (UIBarButtonItem *)setCustomBackButtonWithTitle:(NSString *)title;

@end
