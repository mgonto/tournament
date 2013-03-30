//
//  TTransientSchedule.h
//  Tournament
//
//  Created by Nicolas Purita on 2/20/13.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, kPeriodicity) {
    kOnceWeekly,
    kTwiceInWeek,
    kTwoWeeks,
    kNone
};

@interface TSchedule : NSObject <NSCoding>

@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;
@property (assign, nonatomic) kPeriodicity periodicity;
@property (strong, nonatomic) NSArray *daysOfMatch;
@property (strong, nonatomic) NSString *timeStartRange;
@property (strong, nonatomic) NSString *timeEndRange;


@end
