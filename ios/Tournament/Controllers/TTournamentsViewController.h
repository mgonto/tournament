//
//  TTournamentsViewController.h
//  Tournament
//
//  Created by Nicolas Purita on 2/17/13.
//
//

#import <UIKit/UIKit.h>
#import "TCustomNavigationBarViewController.h"

@interface TTournamentsViewController : TCustomNavigationBarViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
