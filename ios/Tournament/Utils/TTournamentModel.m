//
//  TTournamentModel.m
//  Tournament
//
//  Created by Nicolas Purita on 2/20/13.
//
//

#import "TTournamentModel.h"
#import "TRemoteTournament.h"

@interface TTournamentModel ()

@property (strong, nonatomic) TRemoteTournament *currentTournament;

@end

@implementation TTournamentModel

- (TRemoteTournament *) createNewTournament {
    if (self.currentTournament) {
        DLog(@"Tournament in progress");
    }else{
        self.currentTournament = [[TRemoteTournament alloc] init];
    }
    return self.currentTournament;
}

- (TRemoteTournament *) inProgressTournament {
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
