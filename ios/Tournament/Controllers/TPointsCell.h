//
//  TPointsCell.h
//  Tournament
//
//  Created by Nicolas Purita on 2/23/13.
//
//

#import <UIKit/UIKit.h>

@interface TPointsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *pointsTitle;
@property (weak, nonatomic) IBOutlet UIView *square;
@property (weak, nonatomic) IBOutlet UITextField *pointsTextField;
@property (copy, nonatomic) NSString *pointsKey;
@property (copy, nonatomic) void(^completion)(NSString *pointsKey, int points);

- (IBAction)didEndEditingPoints:(id)sender;

@end
