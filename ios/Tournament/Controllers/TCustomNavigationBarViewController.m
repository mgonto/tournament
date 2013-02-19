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
    [self.navigationController presentViewController:viewController animated:YES completion:nil];
}

#pragma mark - Unwind Segues

- (IBAction)cancelTournamentCreation:(UIStoryboardSegue *)segue {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)finishedTournamentCreation:(UIStoryboardSegue *)segue {
    //TODO
}


@end
