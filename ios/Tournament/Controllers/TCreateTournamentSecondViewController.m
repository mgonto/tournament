//
//  TCreateTournamentSecondViewController.m
//  Tournament
//
//  Created by Nicolas Purita on 2/23/13.
//
//

#import "TCreateTournamentSecondViewController.h"
#import "TSportsViewController.h"
#import "TRemoteTournament.h"
#import "TSportCell.h"
#import "TPointsCell.h"
#import "TSport.h"
#import "TTournamentModel.h"

typedef NS_ENUM(NSInteger, kStatsSection) {
    kSportSection,
    kModalitySection,
    kPointsSection
};

@interface TCreateTournamentSecondViewController ()

@property (weak, nonatomic) TRemoteTournament *tournament;

@end

@implementation TCreateTournamentSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tournament = [[[TTournament application] model] inProgressTournament];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SelectSport"]) {
        TSportsViewController *sportViewController = segue.destinationViewController;
        __weak TCreateTournamentSecondViewController *weakSelf = self;
        sportViewController.completion = ^(TSport *sport){
            __strong TCreateTournamentSecondViewController *strongSelf = weakSelf;
            strongSelf.tournament.sport = sport;
            [strongSelf.tableView reloadData];
        };
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int rows = 0;
    switch (section) {
        case kSportSection: case kModalitySection:
            rows = 1;
            break;
        case kPointsSection:
            rows = self.tournament.sport.defaultPoints.allKeys.count;
            break;
    }
    return rows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section != kSportSection ? 40 : 15;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, RectWidth(self.tableView), 40)];
    headerView.backgroundColor = [UIColor clearColor];

    if (section == kModalitySection || section == kPointsSection) {
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, RectWidth(headerView) - 20, RectHeight(headerView))];
        title.textColor = [UIColor colorWithWhite:0.322 alpha:1.000];
        title.backgroundColor = [UIColor clearColor];
        title.font = [UIFont boldSystemFontOfSize:17];
        title.text = section == kModalitySection ? S(@"MODALITY_TITLE") : S(@"POINTS_TITLE");
        
        [headerView addSubview:title];
    }
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *sportId = @"SportCell";
    static NSString *modalityId = @"ModalityCell";
    static NSString *pointsId = @"PointsCell";
    
    UITableViewCell *cell = nil;
    
    if (indexPath.section == kSportSection) {
        TSportCell *sportCell = [tableView dequeueReusableCellWithIdentifier:sportId forIndexPath:indexPath];
        sportCell.sport.text = self.tournament.sport.name;
        cell = sportCell;
    }else if(indexPath.section == kModalitySection) {
        cell = [tableView dequeueReusableCellWithIdentifier:modalityId forIndexPath:indexPath];
    }else {
        TPointsCell *pointsCell = [tableView dequeueReusableCellWithIdentifier:pointsId forIndexPath:indexPath];
        pointsCell.pointsTitle.text = S(self.tournament.sport.defaultPoints.allKeys[indexPath.row]);
        NSNumber *points = [self.tournament.sport.defaultPoints objectForKey:pointsCell.pointsTitle.text];
        pointsCell.pointsTextField.text = [NSString stringWithFormat:@"%d", [points intValue]];
        __weak TCreateTournamentSecondViewController *weakSelf = self;
        pointsCell.completion = ^(NSString *pointsKey, int points){
            __strong TCreateTournamentSecondViewController *strongSelf = weakSelf;
            [strongSelf.tournament.sport.defaultPoints setObject:@(points) forKey:pointsKey];
        };
        
        cell = pointsCell;
    }
    
    return cell;
}

#pragma mark - Private Methods

- (IBAction)didChangeModality:(UISegmentedControl *)sender {
    self.tournament.mode = sender.selectedSegmentIndex;
}

@end
