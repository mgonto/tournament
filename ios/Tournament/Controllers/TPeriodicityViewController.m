//
//  TPeriodicityViewController.m
//  Tournament
//
//  Created by Nicolas Purita on 2/27/13.
//
//

#import "TPeriodicityViewController.h"
#import "TTournamentConfigurations.h"
#import "TTournamentModel.h"
#import "TSchedule.h"
#import "TTourney.h"

@interface TPeriodicityViewController ()

@property (strong, nonatomic) NSArray *data;
@property (weak, nonatomic) TTourney *tournament;

@end

@implementation TPeriodicityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.data = [NSArray arrayWithArray:[[[TTournamentApplication application] configurations] periodicity]];
    self.tournament = [[[TTournamentApplication application] model] inProgressTournament];
    
    self.navigationItem.leftBarButtonItem = [self setCustomBackButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PeriodicityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.data[indexPath.row];
    if (indexPath.row == self.tournament.schedule.periodicity) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *previousCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.tournament.schedule.periodicity inSection:0]];
    previousCell.accessoryType = UITableViewCellAccessoryNone;
    
    UITableViewCell *currentCell = [tableView cellForRowAtIndexPath:indexPath];
    currentCell.accessoryType = UITableViewCellAccessoryCheckmark;
    self.tournament.schedule.periodicity = indexPath.row;
    
    double delayInSeconds = 0.2;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.navigationController popViewControllerAnimated:YES];
    });
}

@end
