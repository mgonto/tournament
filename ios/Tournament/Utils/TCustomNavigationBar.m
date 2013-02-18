//
//  TCustomNavigationBar.m
//  Tournament
//
//  Created by Nicolas Purita on 2/14/13.
//
//

#import "TCustomNavigationBar.h"

#import <JSBadgeView/JSBadgeView.h>

#define kButtonHeight   20
#define kButtonWidth    20

@interface TCustomNavigationBar ()

@property (strong, nonatomic) UIButton *inbox;
@property (strong, nonatomic) JSBadgeView *inboxBadgeView;
@property (strong, nonatomic) UIButton *notifications;
@property (strong, nonatomic) JSBadgeView *notificationsBadgeView;
@property (strong, nonatomic) UIButton *createButton;

@end

@implementation TCustomNavigationBar

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        self.barStyle = UIBarStyleBlackOpaque;
        
        _inbox = [[UIButton alloc] initWithFrame:CGRectMake(20, 15, kButtonWidth, kButtonHeight)];
        _inbox.backgroundColor = [UIColor redColor];
        [_inbox addTarget:self action:@selector(showInbox:) forControlEvents:UIControlEventTouchUpInside];
        
        _inboxBadgeView = [[JSBadgeView alloc] initWithParentView:self.inbox alignment:JSBadgeViewAlignmentTopLeft];
        _inboxBadgeView.badgePositionAdjustment = CGPointMake(0, 0);
        
        _notifications = [[UIButton alloc] initWithFrame:CGRectMake(RectX(self.inbox) + RectWidth(self.inbox) + 30, RectY(self.inbox), kButtonWidth, kButtonHeight)];
        _notifications.backgroundColor = [UIColor yellowColor];
        [_notifications addTarget:self action:@selector(showNotifications:) forControlEvents:UIControlEventTouchUpInside];
        
        _notificationsBadgeView = [[JSBadgeView alloc] initWithParentView:self.notifications alignment:JSBadgeViewAlignmentTopLeft];
        _notificationsBadgeView.badgePositionAdjustment = CGPointMake(0, 0);
        
        _createButton = [[UIButton alloc] initWithFrame:CGRectMake(RectLastXPoint(self.notifications) + 50, RectY(self.inbox), 150, kButtonHeight)];
        _createButton.backgroundColor = [UIColor blueColor];
        [_createButton addTarget:self action:@selector(createNewTournament:) forControlEvents:UIControlEventTouchUpInside];
        [_createButton setTitle:S(@"New Tournament") forState:UIControlStateNormal];
        
        [self addSubview:self.inbox];
        [self addSubview:self.notifications];
        [self addSubview:self.createButton];
        
    }
    return self;
}

- (void) showInbox:(UIButton *)button {
    if ([self.customDelegate respondsToSelector:@selector(didSelectInbox:)]) {
        [self.customDelegate didSelectInbox:button];
    }
}

- (void) showNotifications:(UIButton *)button {
    if ([self.customDelegate respondsToSelector:@selector(didSelectNotification:)]) {
        [self.customDelegate didSelectNotification:button];
    }
}

- (void) createNewTournament:(UIButton *)button {
    if ([self.customDelegate respondsToSelector:@selector(didSelectNewTournament:)]) {
        [self.customDelegate didSelectNewTournament:button];
    }
}

- (void)setInboxBadgeNumber:(int)number {
    self.inboxBadgeView.badgeText = number > 0 ? [NSString stringWithFormat:@"%d", number] : nil;
}

- (void)setNotificationsBadgeNumber:(int)number {
    self.notificationsBadgeView.badgeText = number > 0 ? [NSString stringWithFormat:@"%d", number] : nil;
}

@end
