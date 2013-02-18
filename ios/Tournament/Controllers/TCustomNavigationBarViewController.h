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

@end
