//
//  TTimeRangeViewController.h
//  Tournament
//
//  Created by Nicolas Purita on 2/28/13.
//
//

#import <UIKit/UIKit.h>

@interface TTimeRangeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
