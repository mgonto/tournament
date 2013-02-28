//
//  TRemoteTournament.m
//  Tournament
//
//  Created by Nicolas Purita on 2/20/13.
//
//

#import "TRemoteTournament.h"
#import "TSport.h"
#import "TTransientSchedule.h"

@implementation TRemoteTournament

#pragma mark - NSCoding Protocol

- (id)init {
    self = [super init];
    if (self) {
        _sport = [TSport initSportWith:kSoccer name:S(@"SPORT_SOCCER") availablePoints:@{TWinPoints : @(3), TTiePoints : @(1) , TLosePoints : @(0)}];
        _schedule = [[TTransientSchedule alloc] init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.identifier = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(identifier))];
        self.name = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(name))];
        self.type = [aDecoder decodeIntegerForKey:NSStringFromSelector(@selector(type))];
        self.inscriptionCost = [aDecoder decodeFloatForKey:NSStringFromSelector(@selector(inscriptionCost))];
        self.matchPrice = [aDecoder decodeFloatForKey:NSStringFromSelector(@selector(matchPrice))];
        
        self.sport = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(sport))];
        self.mode = [aDecoder decodeIntegerForKey:NSStringFromSelector(@selector(mode))];
        
        self.schedule = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(schedule))];
        
        self.stadiums = [NSMutableArray arrayWithArray:[aDecoder decodeObjectForKey:NSStringFromSelector(@selector(stadiums))]];
        
        self.extraInformation = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(extraInformation))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.identifier forKey:NSStringFromSelector(@selector(identifier))];
    [aCoder encodeObject:self.name forKey:NSStringFromSelector(@selector(name))];
    [aCoder encodeInteger:self.type forKey:NSStringFromSelector(@selector(type))];
    [aCoder encodeFloat:self.inscriptionCost forKey:NSStringFromSelector(@selector(inscriptionCost))];
    [aCoder encodeFloat:self.matchPrice forKey:NSStringFromSelector(@selector(matchPrice))];
    
    [aCoder encodeObject:self.sport forKey:NSStringFromSelector(@selector(sport))];
    [aCoder encodeInteger:self.mode forKey:NSStringFromSelector(@selector(mode))];
    
    [aCoder encodeObject:self.schedule forKey:NSStringFromSelector(@selector(schedule))];
    
    [aCoder encodeObject:self.stadiums forKey:NSStringFromSelector(@selector(stadiums))];
    
    [aCoder encodeObject:self.extraInformation forKey:NSStringFromSelector(@selector(extraInformation))];
}

@end
