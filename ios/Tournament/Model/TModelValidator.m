//
//  TStadiumValidator.m
//  Tournament
//
//  Created by Nicolas Purita on 3/28/13.
//
//

#import "TModelValidator.h"
#import "TRemoteStadium.h"

#define kMinStadiumNameLength       5
#define kMinStadiumZoneLength       5
#define kMinStadiumAddressLength    5
#define kMinStadiumPhoneLength      8

#define kMaxStadiumNameLength       120
#define kMaxStadiumZoneLength       120
#define kMaxStadiumAddressLength    120
#define kMaxStadiumPhoneLength      20

@implementation TModelValidator

+ (NSString *) validateStadium:(TRemoteStadium *)stadium {
    NSMutableString *errorMessage = [NSMutableString string];
    
    if (stadium.stadiumName.length == 0) {
        [errorMessage appendString:S(@"ERROR_EMPTY_STADIUM_NAME")];
        [errorMessage appendString:@"\n"];
    }
    
    if (stadium.stadiumName.length < kMinStadiumNameLength || stadium.stadiumName.length > kMaxStadiumNameLength) {
        [errorMessage appendString:S(@"ERROR_LENGTH_STADIUM_NAME")];
        [errorMessage appendString:@"\n"];
    }
    
    if (stadium.neighborhood.length < kMinStadiumZoneLength || stadium.neighborhood.length > kMaxStadiumZoneLength) {
        [errorMessage appendString:S(@"ERROR_LENGTH_STADIUM_ZONE")];
        [errorMessage appendString:@"\n"];
    }
    
    if (stadium.address.length < kMinStadiumAddressLength || stadium.address.length > kMaxStadiumAddressLength) {
        [errorMessage appendString:S(@"ERROR_LENGTH_STADIUM_ADDRESS")];
        [errorMessage appendString:@"\n"];
    }
    
    if (stadium.phone.length < kMinStadiumPhoneLength || stadium.phone.length > kMaxStadiumPhoneLength) {
        [errorMessage appendString:S(@"ERROR_LENGTH_STADIUM_PHONE")];
        [errorMessage appendString:@"\n"];
    }
    
    return errorMessage;
}

@end
