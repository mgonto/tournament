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
@class TSport;

@interface TRemoteTournament : NSObject <NSCoding>

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) kTournamentType type;
@property (assign, nonatomic) float inscriptionCost;
@property (assign, nonatomic) float matchPrice;

@property (strong, nonatomic) TSport *sport;
@property (assign, nonatomic) ktournamentMode mode;

@property (strong, nonatomic) TTransientSchedule *schedule;

@property (strong, nonatomic) NSMutableArray *stadiums;

@property (strong, nonatomic) NSString *extraInformation;

@end
