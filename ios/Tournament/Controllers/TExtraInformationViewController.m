//
//  TCreateTournamentForthViewController.m
//  Tournament
//
//  Created by Nicolas Purita on 3/2/13.
//
//

#import "TExtraInformationViewController.h"
#import "TTourney.h"
#import "TTournamentModel.h"
#import <QuartzCore/QuartzCore.h>

@interface TExtraInformationViewController ()

@property (weak, nonatomic) TTourney *tournament;

@end

@implementation TExtraInformationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tournament = [[[TTournamentApplication application] model] inProgressTournament];
    
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
