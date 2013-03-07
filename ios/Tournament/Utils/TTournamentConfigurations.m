//
//  TTournamentConfigurations.m
//  Tournament
//
//  Created by Nicolas Purita on 2/23/13.
//
//

#import "TTournamentConfigurations.h"
#import "TRemoteTournament.h"
#import "TRemoteStadium.h"
#import "TSport.h"

NSString *const TWinPoints = @"KEY_WIN_POINTS";
NSString *const TLosePoints = @"KEY_LOSE_POINTS";
NSString *const TTiePoints = @"KEY_TIE_POINTS";

@interface TTournamentConfigurations ()

@end

@implementation TTournamentConfigurations

- (id)init {
    self = [super init];
    if (self) {
        _sports = @[
                    [TSport initSportWith:kSoccer name:S(@"SPORT_SOCCER") availablePoints:@{TWinPoints : @(3), TTiePoints : @(1) , TLosePoints : @(0)}],
                    [TSport initSportWith:kSoccer name:S(@"SPORT_BASKETBALL") availablePoints:@{TWinPoints : @(3) , TLosePoints : @(0)}],
                    [TSport initSportWith:kSoccer name:S(@"SPORT_OTHER") availablePoints:@{TWinPoints : @(3), TTiePoints : @(1) , TLosePoints : @(0)}]
        ];
        
        _days = @{S(@"MONDAY"): S(@"MON"),
                  S(@"TUESDAY"): S(@"TUE"),
                  S(@"WEDNESDAY"): S(@"WED"),
                  S(@"THURSDAY"): S(@"THU"),
                  S(@"FRIDAY"): S(@"FRI"),
                  S(@"SATURDAY"): S(@"SAT"),
                  S(@"SUNDAY"): S(@"SUN")
                  };
        
        _periodicity = @[S(@"ONCE_WEEK"),
                         S(@"TWICE_WEEK"),
                         S(@"TWO_WEEKS"),
                         S(@"NONE")];
        
        _stadiums = [NSMutableArray array];
        [self.stadiums addObject:[TRemoteStadium stadiumWithName:@"Open Cangallo"
                                                            zone:@"Villa Crespo"
                                                         address:@"Lavalleja 64"
                                                           phone:@"61234612361"]];
    }
    return self;
}

@end
