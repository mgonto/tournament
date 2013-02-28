//
//  TTransientSchedule.m
//  Tournament
//
//  Created by Nicolas Purita on 2/20/13.
//
//

#import "TTransientSchedule.h"

#define daySeconds 60 * 60 * 24

@implementation TTransientSchedule

#pragma mark - NSCoding Protocol

- (id)init {
    self = [super init];
    if (self) {
        self.startDate = [NSDate date];
        self.endDate = [[NSDate date] dateByAddingTimeInterval:15 * daySeconds];
        self.periodicity = kOnceWeekly;
        self.daysOfMatch = @[S(@"MONDAY"), S(@"TUESDAY"), S(@"WEDNESDAY"), S(@"THURSDAY"), S(@"FRIDAY"), S(@"SATURDAY")];
        self.timeStartRange = @"18:30";
        self.timeEndRange = @"23:30";
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.startDate = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(startDate))];
        self.endDate = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(endDate))];
        self.periodicity = [aDecoder decodeIntegerForKey:NSStringFromSelector(@selector(periodicity))];
        self.daysOfMatch = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(daysOfMatch))];
        self.timeStartRange = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(timeStartRange))];
        self.timeEndRange = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(timeEndRange))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.startDate forKey:NSStringFromSelector(@selector(startDate))];
    [aCoder encodeObject:self.endDate forKey:NSStringFromSelector(@selector(endDate))];
    [aCoder encodeInteger:self.periodicity forKey:NSStringFromSelector(@selector(periodicity))];
    [aCoder encodeObject:self.daysOfMatch forKey:NSStringFromSelector(@selector(daysOfMatch))];
    [aCoder encodeObject:self.timeStartRange forKey:NSStringFromSelector(@selector(timeStartRange))];
    [aCoder encodeObject:self.timeEndRange forKey:NSStringFromSelector(@selector(timeEndRange))];
}

@end
