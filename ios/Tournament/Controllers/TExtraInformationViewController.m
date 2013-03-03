//
//  TCreateTournamentForthViewController.m
//  Tournament
//
//  Created by Nicolas Purita on 3/2/13.
//
//

#import "TExtraInformationViewController.h"
#import "TRemoteTournament.h"
#import "TTournamentModel.h"
#import <QuartzCore/QuartzCore.h>

@interface TExtraInformationViewController ()

@property (weak, nonatomic) TRemoteTournament *tournament;

@end

@implementation TExtraInformationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tournament = [[[TTournament application] model] inProgressTournament];
    
    self.extraInformation.layer.borderColor = [UIColor blackColor].CGColor;
    self.extraInformation.layer.borderWidth = 1.0;
    
    self.navigationItem.leftBarButtonItem = [self setCustomBackButton];
}

- (void)back:(id)sender {
    self.tournament.extraInformation = self.extraInformation.text;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.tournament.extraInformation.length > 0) {
        self.extraInformation.text = self.tournament.extraInformation;
    }
    [self.extraInformation becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
