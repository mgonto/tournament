//
//  TStadiumValidator.h
//  Tournament
//
//  Created by Nicolas Purita on 3/28/13.
//
//

#import <Foundation/Foundation.h>

@class TRemoteStadium;

@interface TModelValidator : NSObject

+ (NSString *) validateStadium:(TRemoteStadium *)stadium;

@end
