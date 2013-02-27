//
//  TSportsViewController.h
//  Tournament
//
//  Created by Nicolas Purita on 2/26/13.
//
//

#import <UIKit/UIKit.h>
#import "TSport.h"

@interface TSportsViewController : UITableViewController

@property (copy, nonatomic) void(^completion)(TSport *sport);

@end
