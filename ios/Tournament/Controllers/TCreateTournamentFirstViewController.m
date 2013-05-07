//
//  TCreateTournamentFirstViewController.m
//  Tournament
//
//  Created by Nicolas Purita on 2/19/13.
//
//

#import "TCreateTournamentFirstViewController.h"
#import "TRemoteTournament.h"
#import "TTournamentModel.h"

#import <QuartzCore/QuartzCore.h>

@interface TCreateTournamentFirstViewController ()

@property (weak, nonatomic) TRemoteTournament *tournament;

@end

@implementation TCreateTournamentFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (UIView *squares in self.textFieldFrames) {
        squares.layer.borderColor = [UIColor grayColor].CGColor;
        squares.layer.borderWidth = 1.0;
    }
    
    self.tournament = [[[TTournament application] model] inProgressTournament];
    
    self.tournamentName.text = self.tournament.name;
    self.inscriptionCost.text = [NSString stringWithFormat:@"%.2f", self.tournament.inscriptionCost];
    self.matchPrice.text = [NSString stringWithFormat:@"%.2f", self.tournament.matchPrice];
    self.typeOfTournament.selectedSegmentIndex = self.tournament.type;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.tournament.name = self.tournamentName.text;
    self.tournament.inscriptionCost = [self.inscriptionCost.text floatValue];
    self.tournament.matchPrice = [self.matchPrice.text floatValue];
    self.tournament.type = self.typeOfTournament.selectedSegmentIndex;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
