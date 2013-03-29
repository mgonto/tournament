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
    
    if (stadium.name.length == 0) {
        [errorMessage appendString:S(@"ERROR_EMPTY_STADIUM_NAME")];
        [errorMessage appendString:@"\n"];
    }
    
    if (stadium.name.length < kMinStadiumNameLength || stadium.name.length > kMaxStadiumNameLength) {
        [errorMessage appendString:S(@"ERROR_LENGTH_STADIUM_NAME")];
        [errorMessage appendString:@"\n"];
    }
    
    if (stadium.zone.length < kMinStadiumZoneLength || stadium.zone.length > kMaxStadiumZoneLength) {
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
