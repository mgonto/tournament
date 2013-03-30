//
//  TStadiumValidator.h
//  Tournament
//
//  Created by Nicolas Purita on 3/28/13.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, kErrorTournamentCreation) {
    kNoErrors,
    kErrorNameInvalid,
    kErrorSchedule,
    kErrorStadiums
};

@class TStadium;
@class TTourney;

@interface TModelValidator : NSObject

+ (NSString *) validateStadium:(TStadium *)stadium;
+ (kErrorTournamentCreation) validateTournament:(TTourney *)tournament;

@end
