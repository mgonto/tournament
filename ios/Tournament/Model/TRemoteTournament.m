//
//  TRemoteTournament.m
//  Tournament
//
//  Created by Nicolas Purita on 2/20/13.
//
//

#import "TRemoteTournament.h"

NSString *const TWinPoints = @"kWinPointsKey";
NSString *const TLosePoints = @"kLosePointsKey";
NSString *const TTiePoints = @"kTiePointsKey";

@implementation TRemoteTournament

#pragma mark - NSCoding Protocol

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.identifier = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(identifier))];
        self.name = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(name))];
        self.type = [aDecoder decodeIntegerForKey:NSStringFromSelector(@selector(type))];
        self.inscriptionCost = [aDecoder decodeFloatForKey:NSStringFromSelector(@selector(inscriptionCost))];
        self.matchPrice = [aDecoder decodeFloatForKey:NSStringFromSelector(@selector(matchPrice))];
        
        self.sport = [aDecoder decodeIntegerForKey:NSStringFromSelector(@selector(sport))];
        self.mode = [aDecoder decodeIntegerForKey:NSStringFromSelector(@selector(mode))];
        self.points = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(points))];
        
        self.schedule = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(schedule))];
        
        self.stadiums = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(stadiums))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.identifier forKey:NSStringFromSelector(@selector(identifier))];
    [aCoder encodeObject:self.name forKey:NSStringFromSelector(@selector(name))];
    [aCoder encodeInteger:self.type forKey:NSStringFromSelector(@selector(type))];
    [aCoder encodeFloat:self.inscriptionCost forKey:NSStringFromSelector(@selector(inscriptionCost))];
    [aCoder encodeFloat:self.matchPrice forKey:NSStringFromSelector(@selector(matchPrice))];
    
    [aCoder encodeInteger:self.sport forKey:NSStringFromSelector(@selector(sport))];
    [aCoder encodeInteger:self.mode forKey:NSStringFromSelector(@selector(mode))];
    [aCoder encodeObject:self.points forKey:NSStringFromSelector(@selector(points))];
    
    [aCoder encodeObject:self.schedule forKey:NSStringFromSelector(@selector(schedule))];
    
    [aCoder encodeObject:self.stadiums forKey:NSStringFromSelector(@selector(stadiums))];
}

@end
