//
//  TTournamentModelSpec.m
//  Tournament
//
//  Created by Nicolas Purita on 3/29/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Kiwi.h"
#import "TTournamentModel.h"
#import "TTourney.h"

SPEC_BEGIN(TTournamentModelSpec)

describe(@"Tournament_Model_Singleton", ^{
    
    __block TTournamentModel *model;
    __block TTourney *tourney;
    
    beforeAll(^{
        model = [TTournamentModel nullMock];
        tourney = [[TTourney alloc] init];
    });
    
    describe(NSStringFromSelector(@selector(createNewTournament)), ^{
       
        __block TTourney *tourney2;
        
        beforeEach(^{
            tourney2 = [[TTourney alloc] init];
            [[model stubAndReturn:tourney times:theValue(1) afterThatReturn:tourney2] createNewTournament];
        });
        
        context(@"When Create a New Tournament", ^{
            
            it(@"should create and return new one", ^{
                TTourney *newTourney = [model createNewTournament];
                [newTourney shouldNotBeNil];
            });
            
            it(@"should return new one", ^{
                TTourney *newTourney1 = [model createNewTournament];
                [newTourney1 shouldNotBeNil];
                
                TTourney *newTourney2 = [model createNewTournament];
                [newTourney2 shouldNotBeNil];
                
                [[newTourney1 shouldNot] equal:newTourney2];
            });
        });
    });
    
    describe(NSStringFromSelector(@selector(inProgressTournament)), ^{

        beforeEach(^{
            [model stub:@selector(createNewTournament) andReturn:tourney];
        });
        
        context(@"when I ask for current tournament and have no current one", ^{
           
            it(@"should return nill", ^{
                [[model inProgressTournament] shouldBeNil];
            });
            
        });
        
        context(@"When Ask for current tournament", ^{
            
            beforeEach(^{
                [model stub:@selector(inProgressTournament) andReturn:tourney];
            });
            
            it(@"should return the same in progress", ^{
                TTourney *newTourney = [model createNewTournament];
                [[[model inProgressTournament] should] equal:newTourney];
            });
            
        });
    });
});

SPEC_END