//
//  TTransientStadium.m
//  Tournament
//
//  Created by Nicolas Purita on 2/20/13.
//
//

#import "TTransientStadium.h"

@implementation TTransientStadium

#pragma mark - NSCoding Protocol

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.identifier = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(identifier))];
        self.name = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(name))];
        self.zone = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(zone))];
        self.address = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(address))];
        self.phone = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(phone))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.identifier forKey:NSStringFromSelector(@selector(identifier))];
    [aCoder encodeObject:self.name forKey:NSStringFromSelector(@selector(name))];
    [aCoder encodeObject:self.zone forKey:NSStringFromSelector(@selector(zone))];
    [aCoder encodeObject:self.address forKey:NSStringFromSelector(@selector(address))];
    [aCoder encodeObject:self.phone forKey:NSStringFromSelector(@selector(phone))];
}

@end
