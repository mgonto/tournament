//
//  TTournamentConfigurations.h
//  Tournament
//
//  Created by Nicolas Purita on 2/23/13.
//
//

#import <Foundation/Foundation.h>

extern NSString *const TWinPoints;
extern NSString *const TLosePoints;
extern NSString *const TTiePoints;

typedef NS_ENUM(NSInteger, kTournamentPrivacy) {
    kPublic,
    kPrivate
};

typedef NS_ENUM(NSInteger, kTournamentMode) {
    kHome,
    kHomeAndAway
};

typedef NS_ENUM(NSInteger, kSport) {
    kSoccer,
    kBasketball,
    kOther
};

@interface TTournamentConfigurations : NSObject

@property (strong, nonatomic) NSArray *sports;
@property (strong, nonatomic, readonly) NSDictionary *days;
@property (strong, nonatomic) NSArray *periodicity;
@property (strong, nonatomic) NSMutableArray *stadiums;

@end
