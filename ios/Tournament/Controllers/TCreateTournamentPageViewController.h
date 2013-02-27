//
//  TCreateTournamentPageViewController.h
//  Tournament
//
//  Created by Nicolas Purita on 2/24/13.
//
//

#import <UIKit/UIKit.h>

@interface TCreateTournamentPageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *cancelButton;

- (IBAction)next:(id)sender;

@end
