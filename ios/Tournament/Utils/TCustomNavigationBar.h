//
//  TCustomNavigationBar.h
//  Tournament
//
//  Created by Nicolas Purita on 2/14/13.
//
//

#import <UIKit/UIKit.h>

@protocol TCustomNavigationBarDelegate <NSObject>

- (void) didSelectInbox:(UIButton *)button;
- (void) didSelectNotification:(UIButton *)button;
- (void) didSelectNewTournament:(UIButton *)button;

@end

@interface TCustomNavigationBar : UINavigationBar

@property (weak, nonatomic) id<TCustomNavigationBarDelegate> customDelegate;

- (void) setInboxBadgeNumber:(int)number;
- (void) setNotificationsBadgeNumber:(int)number;

@end
