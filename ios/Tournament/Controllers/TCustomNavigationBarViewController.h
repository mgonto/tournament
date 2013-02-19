//
//  TCustomNavigationBarViewController.h
//  Tournament
//
//  Created by Nicolas Purita on 2/17/13.
//
//

#import <UIKit/UIKit.h>

@interface TCustomNavigationBarViewController : UIViewController <TCustomNavigationBarDelegate>

@property (weak, nonatomic) IBOutlet TCustomNavigationBar *customNavigationBar;

- (IBAction)cancelTournamentCreation:(UIStoryboardSegue *)segue;
- (IBAction)finishedTournamentCreation:(UIStoryboardSegue *)segue;

@end
