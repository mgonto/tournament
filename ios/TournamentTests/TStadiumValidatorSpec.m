//
//  TStadiumValidatorSpec.m
//  Tournament
//
//  Created by Nicolas Purita on 3/29/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Kiwi.h"
#import "TModelValidator.h"
#import "TRemoteStadium.h"

SPEC_BEGIN(TStadiumValidatorSpec)

describe(@"Stadium_Validator", ^{
    
    __block TRemoteStadium *stadium;
    
    beforeEach(^{
        stadium = [TRemoteStadium nullMock];
    });
    
    describe(NSStringFromSelector(@selector(validateStadium:)), ^{
       
        context(@"when I check the name", ^{
            
            beforeEach(^{
                [stadium stub:@selector(neighborhood) andReturn:@"Zones"];
                [stadium stub:@selector(address) andReturn:@"Address"];
                [stadium stub:@selector(phone) andReturn:@"15132512351"];
            });
            
            it(@"should be invalid if it is empty", ^{
                [stadium stub:@selector(stadiumName) andReturn:@""];
                [[[TModelValidator validateStadium:stadium] should] equal:[NSString stringWithFormat:@"%@\n%@\n", S(@"ERROR_EMPTY_STADIUM_NAME"), S(@"ERROR_LENGTH_STADIUM_NAME")]];
            });
            
            it(@"should be invalid if it has less than 5 characters", ^{
                [stadium stub:@selector(stadiumName) andReturn:@"asdd"];
                [[[TModelValidator validateStadium:stadium] should] equal:[NSString stringWithFormat:@"%@\n", S(@"ERROR_LENGTH_STADIUM_NAME")]];
            });
            
            it(@"should be invalid if it has more than 120 characters", ^{
                [stadium stub:@selector(stadiumName) andReturn:@"0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789"];
                [[[TModelValidator validateStadium:stadium] should] equal:[NSString stringWithFormat:@"%@\n", S(@"ERROR_LENGTH_STADIUM_NAME")]];
            });
            
            it(@"should be valid", ^{
                [stadium stub:@selector(stadiumName) andReturn:@"Jose Amalfitani"];
                [[[TModelValidator validateStadium:stadium] should] equal:@""];
            });
        });
        
        context(@"when I check the neighborhood", ^{

            beforeEach(^{
                [stadium stub:@selector(stadiumName) andReturn:@"Jose Amalfitani"];
                [stadium stub:@selector(address) andReturn:@"Address"];
                [stadium stub:@selector(phone) andReturn:@"15132512351"];
            });
            
            it(@"should be invalid if it has less than 5 characters", ^{
                [stadium stub:@selector(neighborhood) andReturn:@"1234"];
                [[[TModelValidator validateStadium:stadium] should] equal:[NSString stringWithFormat:@"%@\n", S(@"ERROR_LENGTH_STADIUM_ZONE")]];
            });
            
            it(@"should be invalid if it has more than 120 characters", ^{
                [stadium stub:@selector(neighborhood) andReturn:@"0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789"];
                [[[TModelValidator validateStadium:stadium] should] equal:[NSString stringWithFormat:@"%@\n", S(@"ERROR_LENGTH_STADIUM_ZONE")]];
            });
            
            it(@"should be valid", ^{
                [stadium stub:@selector(neighborhood) andReturn:@"Villa luro"];
                [[[TModelValidator validateStadium:stadium] should] equal:@""];
            });
        });
        
        context(@"when I check the address", ^{
            
            beforeEach(^{
                [stadium stub:@selector(stadiumName) andReturn:@"Jose Amalfitani"];
                [stadium stub:@selector(neighborhood) andReturn:@"Villa Luro"];
                [stadium stub:@selector(phone) andReturn:@"15132512351"];
            });
            
            it(@"should be invalid if it has less than 5 characters", ^{
                [stadium stub:@selector(address) andReturn:@"1234"];
                [[[TModelValidator validateStadium:stadium] should] equal:[NSString stringWithFormat:@"%@\n", S(@"ERROR_LENGTH_STADIUM_ADDRESS")]];
            });
            
            it(@"should be invalid if it has more than 120 characters", ^{
                [stadium stub:@selector(address) andReturn:@"0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789"];
                [[[TModelValidator validateStadium:stadium] should] equal:[NSString stringWithFormat:@"%@\n", S(@"ERROR_LENGTH_STADIUM_ADDRESS")]];
            });
            
            it(@"should be valid", ^{
                [stadium stub:@selector(address) andReturn:@"Juan B. Justo 1234"];
                [[[TModelValidator validateStadium:stadium] should] equal:@""];
            });
        });
        
        context(@"when I check the phone", ^{
            
            beforeEach(^{
                [stadium stub:@selector(stadiumName) andReturn:@"Jose Amalfitani"];
                [stadium stub:@selector(address) andReturn:@"Juan B. Justo 1234"];
                [stadium stub:@selector(neighborhood) andReturn:@"Villa Luro"];
            });
            
            it(@"should be invalid if it has less than 8 characters", ^{
                [stadium stub:@selector(phone) andReturn:@"1234"];
                [[[TModelValidator validateStadium:stadium] should] equal:[NSString stringWithFormat:@"%@\n", S(@"ERROR_LENGTH_STADIUM_PHONE")]];
            });
            
            it(@"should be invalid if it has more than 20 characters", ^{
                [stadium stub:@selector(phone) andReturn:@"0123456789012345678901"];
                [[[TModelValidator validateStadium:stadium] should] equal:[NSString stringWithFormat:@"%@\n", S(@"ERROR_LENGTH_STADIUM_PHONE")]];
            });
            
            it(@"should be valid", ^{
                [stadium stub:@selector(phone) andReturn:@"12561713112"];
                [[[TModelValidator validateStadium:stadium] should] equal:@""];
            });
        });
        
    });
});

SPEC_END