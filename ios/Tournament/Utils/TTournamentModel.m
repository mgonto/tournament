//
//  TTournamentModel.m
//  Tournament
//
//  Created by Nicolas Purita on 2/20/13.
//
//

#import "TTournamentModel.h"
#import "TTourney.h"

@interface TTournamentModel ()

@property (strong, nonatomic) TTourney *currentTournament;

@end

@implementation TTournamentModel

- (TTourney *) createNewTournament {
    if (self.currentTournament) {
        DLog(@"Tournament in progress");
    }else{
        self.currentTournament = [[TTourney alloc] init];
    }
    return self.currentTournament;
}

- (TTourney *) inProgressTournament {
    return self.currentTournament;
}

- (void) finishCurrentTournament {
    DLog(@"Finish Tournament creation");
    self.currentTournament = nil;
}

- (void) clearTournamentInProgress {
    DLog(@"Clear Tournament creation because user cancelled");
    self.currentTournament = nil;
}

@end
