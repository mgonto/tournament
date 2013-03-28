//
//  TShareTournamentViewController.m
//  Tournament
//
//  Created by Nicolas Purita on 3/27/13.
//
//

#import "TShareTournamentViewController.h"

@interface TShareTournamentViewController ()

@end

@implementation TShareTournamentViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationItem.hidesBackButton = YES;
}

- (IBAction)addExtraInformation:(id)sender {
    [self.navigationController pushViewControllerWithIdentifier:@"CTExtraInformation" fromStoryboard:@"CreateTournament" block:nil];
}

@end
