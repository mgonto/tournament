//
//  TTransientSchedule.m
//  Tournament
//
//  Created by Nicolas Purita on 2/20/13.
//
//

#import "TTransientSchedule.h"

@implementation TTransientSchedule

//@property (strong, nonatomic) NSDate *startDate;
//@property (strong, nonatomic) NSDate *endDate;
//@property (assign, nonatomic) kPeriodicity periodicity;
//@property (strong, nonatomic) NSArray *daysOfMatch;
//@property (strong, nonatomic) NSString *matchSchedule;


#pragma mark - NSCoding Protocol

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.startDate = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(startDate))];
        self.endDate = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(endDate))];
        self.periodicity = [aDecoder decodeIntegerForKey:NSStringFromSelector(@selector(periodicity))];
        self.daysOfMatch = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(daysOfMatch))];
        self.matchSchedule = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(matchSchedule))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.startDate forKey:NSStringFromSelector(@selector(startDate))];
    [aCoder encodeObject:self.endDate forKey:NSStringFromSelector(@selector(endDate))];
    [aCoder encodeInteger:self.periodicity forKey:NSStringFromSelector(@selector(periodicity))];
    [aCoder encodeObject:self.daysOfMatch forKey:NSStringFromSelector(@selector(daysOfMatch))];
    [aCoder encodeObject:self.matchSchedule forKey:NSStringFromSelector(@selector(matchSchedule))];
}

@end
