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
@class TTournamentConfigurations;

@interface TTournamentApplication : NSObject

#pragma mark - Singleton Application objects

- (TTournamentModel *)model;
- (TTournamentUserDefaults *)userDefaults;
- (TTournamentConfigurations *)configurations;

+ (TTournamentApplication *) application;

@end
