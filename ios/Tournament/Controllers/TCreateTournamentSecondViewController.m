//
//  TCreateTournamentSecondViewController.m
//  Tournament
//
//  Created by Nicolas Purita on 2/23/13.
//
//

#import "TCreateTournamentSecondViewController.h"
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
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
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
    headerView.backgroundColor = [UIColor whiteColor];

    if (section == kModalitySection || section == kPointsSection) {
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, RectWidth(headerView) - 20, RectHeight(headerView))];
        title.textColor = [UIColor grayColor];
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
            [strongSelf.tournament.points setObject:@(points) forKey:pointsKey];
        };
        
        cell = pointsCell;
    }
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (IBAction)didChangeModality:(UISegmentedControl *)sender {
}
@end
