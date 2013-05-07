//
//  TTournamentModel.h
//  Tournament
//
//  Created by Nicolas Purita on 2/20/13.
//
//

#import <Foundation/Foundation.h>

@class TRemoteTournament;

@interface TTournamentModel : NSObject

- (TRemoteTournament *) createNewTournament;
- (TRemoteTournament *) inProgressTournament;
- (void) finishCurrentTournament;
- (void) clearTournamentInProgress;

@end
