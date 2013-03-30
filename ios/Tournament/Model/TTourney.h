//
//  TRemoteTournament.h
//  Tournament
//
//  Created by Nicolas Purita on 2/20/13.
//
//

#import <Foundation/Foundation.h>

@class TSchedule;
@class TStadium;
@class TSport;

@interface TTourney : NSObject <NSCoding>

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) kTournamentPrivacy privacy;
@property (assign, nonatomic) float inscriptionCost;
@property (assign, nonatomic) float matchPrice;

@property (strong, nonatomic) TSport *sport;
@property (assign, nonatomic) kTournamentMode mode;

@property (strong, nonatomic) TSchedule *schedule;

@property (strong, nonatomic) NSMutableArray *stadiums;

@property (strong, nonatomic) NSString *extraInformation;

@end
