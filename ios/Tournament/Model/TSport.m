//
//  TSport.m
//  Tournament
//
//  Created by Nicolas Purita on 2/23/13.
//
//

#import "TSport.h"

@implementation TSport

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.identifier = [aDecoder decodeIntegerForKey:NSStringFromSelector(@selector(identifier))];
        self.name = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(name))];
        self.defaultPoints = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(defaultPoints))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:self.identifier forKey:NSStringFromSelector(@selector(identifier))];
    [aCoder encodeObject:self.name forKey:NSStringFromSelector(@selector(name))];
    [aCoder encodeObject:self.defaultPoints forKey:NSStringFromSelector(@selector(defaultPoints))];
}

+ (TSport *)initSportWith:(kSport)idenifier name:(NSString *)name availablePoints:(NSDictionary *)defaultPoints {
    TSport *sport = [[[self class] alloc] init];
    sport.identifier = idenifier;
    sport.name = name;
    sport.defaultPoints = [NSMutableDictionary dictionaryWithDictionary:defaultPoints];
    return sport;
}

@end
