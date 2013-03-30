//
//  TStadiumViewController.h
//  Tournament
//
//  Created by Nicolas Purita on 3/6/13.
//
//

#import <UIKit/UIKit.h>
#import "TStadium.h"

@interface TStadiumViewController : UITableViewController

@property (copy, nonatomic) void(^creationSuccess)(TStadium *newStadium);

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *zoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *squares;

- (IBAction)saveNewStadium:(id)sender;
- (IBAction)next:(UITextField *)textfield;
- (IBAction)startEditing:(UITextField *)sender;

@end
