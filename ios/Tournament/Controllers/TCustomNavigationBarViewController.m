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
    
    self.customNavigationBar.customDelegate = self;
}

#pragma mark - TCustomNavigationBarDelegate

- (void)didSelectInbox:(UIButton *)button {
    
}

- (void)didSelectNotification:(UIButton *)button {
    
}

- (void)didSelectNewTournament:(UIButton *)button {

}

@end
