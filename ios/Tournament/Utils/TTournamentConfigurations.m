//
//  TTournamentConfigurations.m
//  Tournament
//
//  Created by Nicolas Purita on 2/23/13.
//
//

#import "TTournamentConfigurations.h"
#import "TRemoteTournament.h"
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
    }
    return self;
}

@end
