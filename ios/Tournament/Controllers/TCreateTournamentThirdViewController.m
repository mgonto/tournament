//
//  TCreateTournamentThirdViewController.m
//  Tournament
//
//  Created by Nicolas Purita on 2/26/13.
//
//

#import "TCreateTournamentThirdViewController.h"
#import "TRemoteTournament.h"
#import "TTournamentModel.h"
#import "TTransientSchedule.h"
#import "TTournamentConfigurations.h"
#import <QuartzCore/QuartzCore.h>

@interface TCreateTournamentThirdViewController ()

@property (weak, nonatomic) TRemoteTournament *tournament;
@property (strong, nonatomic) NSDateFormatter *formmatter;

@end

@implementation TCreateTournamentThirdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (UIView *square in self.squares) {
        square.layer.borderColor = [UIColor grayColor].CGColor;
        square.layer.borderWidth = 1.0;
    }
    
    self.tournament = [[[TTournament application] model] inProgressTournament];

    [self reloadInputs];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadInputs];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadInputs {
    self.startsDate.text = [NSDateFormatter localizedStringFromDate:self.tournament.schedule.startDate
                                                          dateStyle:NSDateFormatterMediumStyle
                                                          timeStyle:NSDateFormatterNoStyle];
    self.endDate.text = [NSDateFormatter localizedStringFromDate:self.tournament.schedule.endDate
                                                       dateStyle:NSDateFormatterMediumStyle
                                                       timeStyle:NSDateFormatterNoStyle];
    
    self.periodicity.text = [[[TTournament application] configurations] periodicity][self.tournament.schedule.periodicity];
    
    [self trimDayOfMatchesWithDates:self.tournament.schedule.daysOfMatch];
    self.timeRange.text = [NSString stringWithFormat:@"%@ - %@", self.tournament.schedule.timeStartRange, self.tournament.schedule.timeEndRange];
}

- (void)trimDayOfMatchesWithDates:(NSArray *)days {

    if (days.count == 7) {
        self.playDays.text = S(@"WHOLE_WEEK");
    }else{
        NSString *trimDays = @"";
        
        for (NSString *day in days) {
            NSString *shortDay = [[[[TTournament application] configurations] days] objectForKey:day];
            trimDays = [trimDays stringByAppendingFormat:@"%@,", shortDay];
        }
        
        self.playDays.text = [trimDays substringToIndex:trimDays.length - 1];
    }
}

@end
