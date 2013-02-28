//
//  TDateSelectionViewController.h
//  Tournament
//
//  Created by Nicolas Purita on 2/27/13.
//
//

#import <UIKit/UIKit.h>

@interface TDateSelectionViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)didFinishWithDateSelection:(UIDatePicker *)sender;

@end
