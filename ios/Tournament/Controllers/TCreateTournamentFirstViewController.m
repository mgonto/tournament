//
//  TCreateTournamentFirstViewController.m
//  Tournament
//
//  Created by Nicolas Purita on 2/19/13.
//
//

#import "TCreateTournamentFirstViewController.h"
#import "TTourney.h"
#import "TTournamentModel.h"

#import <QuartzCore/QuartzCore.h>

@interface TCreateTournamentFirstViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) TTourney *tournament;
@property (weak, nonatomic) UITextField *active;
@property (strong, nonatomic) UITapGestureRecognizer *gestureRecognizer;

@end

@implementation TCreateTournamentFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
    self.gestureRecognizer.cancelsTouchesInView = NO;
    self.gestureRecognizer.delegate = self;
    [self.tableView addGestureRecognizer:self.gestureRecognizer];
    
    for (UIView *squares in self.textFieldFrames) {
        squares.layer.borderColor = [UIColor grayColor].CGColor;
        squares.layer.borderWidth = 1.0;
    }
    
    self.tournament = [[[TTournamentApplication application] model] inProgressTournament];
    
    self.tournamentName.text = self.tournament.name;

    if (self.tournament.inscriptionCost > 0) {
        self.inscriptionCost.text = [NSString stringWithFormat:@"%.2f", self.tournament.inscriptionCost];
    }
    if (self.tournament.matchPrice > 0) {
        self.matchPrice.text = [NSString stringWithFormat:@"%.2f", self.tournament.matchPrice];
    }
    self.typeOfTournament.selectedSegmentIndex = self.tournament.privacy;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.tournament.name = self.tournamentName.text;
    self.tournament.inscriptionCost = [self.inscriptionCost.text floatValue];
    self.tournament.matchPrice = [self.matchPrice.text floatValue];
    self.tournament.privacy = self.typeOfTournament.selectedSegmentIndex;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)next:(UITextField *)sender {
    UITextField *next = nil;
    if (self.active == self.tournamentName) {
        next = self.inscriptionCost;
    }else if (self.active == self.inscriptionCost) {
        next = self.matchPrice;
    }
    [next becomeFirstResponder];
}

- (IBAction)startEditing:(UITextField *)sender {
    self.active = sender;
}

- (IBAction)hideKeyboard:(id)sender {
    [self.active resignFirstResponder];
    self.active = nil;
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if(([touch.view isKindOfClass:[UITextField class]]) && (gestureRecognizer == self.gestureRecognizer))
    {
        return NO;
    }
    return YES;
}

@end
