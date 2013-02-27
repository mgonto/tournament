//
//  UIViewController+CustomNavigation.m
//  Observing
//
//  Created by Hernan Zalazar on 1/14/13.
//  Copyright (c) 2013 UPhoenix. All rights reserved.
//

#import "UIViewController+CustomNavigation.h"

@implementation UIViewController (CustomNavigation)

- (void)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIBarButtonItem *)setCustomBackButtonWithTitle:(NSString *)title {
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:S(@"BACK_BUTTON") style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    [backButton setBackgroundImage:[UIImage resizableImageNamed:@"back-black" capInsets:UIEdgeInsetsMake(0, 15, 0, 15)]
                               forState:UIControlStateNormal
                             barMetrics:UIBarMetricsDefault];
    [backButton setTitlePositionAdjustment:UIOffsetMake(4, 0) forBarMetrics:UIBarMetricsDefault];
    return backButton;
}

- (UIBarButtonItem *)setCustomBackButton {
    return [self setCustomBackButtonWithTitle:NSLocalizedString(@"BACK_BUTTON", @"Back")];
}
@end
