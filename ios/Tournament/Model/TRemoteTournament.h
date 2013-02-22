//
//  TRemoteTournament.h
//  Tournament
//
//  Created by Nicolas Purita on 2/20/13.
//
//

#import <Foundation/Foundation.h>

@class TTransientSchedule;
@class TTransientStadium;

extern NSString *const TWinPoints;
extern NSString *const TLosePoints;
extern NSString *const TTiePoints;

typedef NS_ENUM(NSInteger, kTournamentType) {
    kPublic,
    kPrivate
};

typedef NS_ENUM(NSInteger, ktournamentMode) {
    kHome,
    kHomeAndAway
};

typedef NS_ENUM(NSInteger, kSport) {
    kSoccer,
    kBasketball,
    kOther
};

@interface TRemoteTournament : NSObject <NSCoding>

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) kTournamentType type;
@property (assign, nonatomic) float inscriptionCost;
@property (assign, nonatomic) float matchPrice;

@property (assign, nonatomic) kSport sport;
@property (assign, nonatomic) ktournamentMode mode;
@property (strong, nonatomic) NSDictionary *points;

@property (strong, nonatomic) TTransientSchedule *schedule;

@property (strong, nonatomic) NSArray *stadiums;

@end
