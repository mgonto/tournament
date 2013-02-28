//
//  TCreateTournamentThirdViewController.h
//  Tournament
//
//  Created by Nicolas Purita on 2/26/13.
//
//

#import <UIKit/UIKit.h>

@interface TCreateTournamentThirdViewController : UITableViewController

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *squares;
@property (weak, nonatomic) IBOutlet UILabel *startsDate;
@property (weak, nonatomic) IBOutlet UILabel *endDate;
@property (weak, nonatomic) IBOutlet UILabel *periodicity;
@property (weak, nonatomic) IBOutlet UILabel *playDays;
@property (weak, nonatomic) IBOutlet UILabel *timeRange;

@end
