//
//  TCreateTournamentFirstViewController.h
//  Tournament
//
//  Created by Nicolas Purita on 2/19/13.
//
//

#import <UIKit/UIKit.h>

@interface TCreateTournamentFirstViewController : UITableViewController

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *textFieldFrames;
@property (weak, nonatomic) IBOutlet UITextField *tournamentName;
@property (weak, nonatomic) IBOutlet UITextField *inscriptionCost;
@property (weak, nonatomic) IBOutlet UITextField *matchPrice;
@property (weak, nonatomic) IBOutlet UISegmentedControl *typeOfTournament;


@end
