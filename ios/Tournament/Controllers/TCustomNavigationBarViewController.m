//
//  TCustomNavigationBarViewController.m
//  Tournament
//
//  Created by Nicolas Purita on 2/17/13.
//
//

#import "TCustomNavigationBarViewController.h"

@interface TCustomNavigationBarViewController ()

@end

@implementation TCustomNavigationBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    self.customNavigationBar.customDelegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark - TCustomNavigationBarDelegate

- (void)didSelectInbox:(UIButton *)button {
    
}

- (void)didSelectNotification:(UIButton *)button {
    
}

- (void)didSelectNewTournament:(UIButton *)button {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"CreateTournament" bundle:nil];
    UIViewController *viewController = [storyboard instantiateInitialViewController];
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
