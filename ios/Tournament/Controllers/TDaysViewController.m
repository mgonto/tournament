//
//  TDaysViewController.m
//  Tournament
//
//  Created by Nicolas Purita on 2/27/13.
//
//

#import "TDaysViewController.h"
#import "TTournamentConfigurations.h"
#import "TTournamentModel.h"
#import "TSchedule.h"
#import "TTourney.h"

@interface TDaysViewController ()

@property (weak, nonatomic) TTourney *tournament;
@property (strong, nonatomic) NSArray *days;
@property (strong, nonatomic) NSMutableArray *selectedDays;

@end

@implementation TDaysViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TTournamentApplication *application = [TTournamentApplication application];
    
    self.tournament = [[application model] inProgressTournament];
    self.days = [NSArray arrayWithArray:[application.configurations.days allKeys]];
    self.selectedDays = [NSMutableArray arrayWithArray:self.tournament.schedule.daysOfMatch];
    
    self.navigationItem.leftBarButtonItem = [self setCustomBackButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)back:(id)sender {
    if (self.selectedDays.count == 0) {
        self.tournament.schedule.daysOfMatch = @[];
    }else{
        self.tournament.schedule.daysOfMatch = [NSArray arrayWithArray:self.selectedDays];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.days.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DayCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.days[indexPath.row];
    if ([self.selectedDays containsObject:cell.textLabel.text]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *futureSelectedDay = self.days[indexPath.row];
    if (![self.selectedDays containsObject:futureSelectedDay]) {
        [self.selectedDays addObject:futureSelectedDay];
    }else{
        [self.selectedDays removeObject:futureSelectedDay];
    }

    [tableView reloadData];

}

@end
