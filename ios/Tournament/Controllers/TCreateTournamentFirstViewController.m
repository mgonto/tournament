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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
