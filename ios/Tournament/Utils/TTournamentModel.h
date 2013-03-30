//
//  TTournamentModel.h
//  Tournament
//
//  Created by Nicolas Purita on 2/20/13.
//
//

#import <Foundation/Foundation.h>

@class TTourney;

@interface TTournamentModel : NSObject

- (TTourney *) createNewTournament;
- (TTourney *) inProgressTournament;
- (void) finishCurrentTournament;
- (void) clearTournamentInProgress;

@end
