//
//  TTournament.h
//  Tournament
//
//  Created by Nicolas Purita on 2/20/13.
//
//

#import <Foundation/Foundation.h>

@class TTournamentModel;
@class TTournamentUserDefaults;

@interface TTournament : NSObject

- (TTournamentModel *)model;
- (TTournamentUserDefaults *)userDefaults;

+ (TTournament *) application;

@end
