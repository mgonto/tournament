//
//  TTransientStadium.m
//  Tournament
//
//  Created by Nicolas Purita on 2/20/13.
//
//

#import "TRemoteStadium.h"

@implementation TRemoteStadium

+ (id) stadiumWithName:(NSString *)name neighbour:(NSString *)zone address:(NSString *)address phone:(NSString *)phone {
    TRemoteStadium *stadium = [[[self class] alloc] init];
    stadium.stadiumName = name;
    stadium.neighborhood = zone;
    stadium.address = address;
    stadium.phone = phone;
    
    return stadium;
}

#pragma mark - NSCoding Protocol

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.identifier = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(identifier))];
        self.stadiumName = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(stadiumName))];
        self.neighborhood = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(neighborhood))];
        self.address = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(address))];
        self.phone = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(phone))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.identifier forKey:NSStringFromSelector(@selector(identifier))];
    [aCoder encodeObject:self.stadiumName forKey:NSStringFromSelector(@selector(stadiumName))];
    [aCoder encodeObject:self.neighborhood forKey:NSStringFromSelector(@selector(neighborhood))];
    [aCoder encodeObject:self.address forKey:NSStringFromSelector(@selector(address))];
    [aCoder encodeObject:self.phone forKey:NSStringFromSelector(@selector(phone))];
}

@end
