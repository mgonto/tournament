//
//  TCreateTournamentFifthViewController.m
//  Tournament
//
//  Created by Nicolas Purita on 3/6/13.
//
//

#import "TCreateTournamentForthViewController.h"
#import "TTournamentConfigurations.h"
#import "TStadiumViewController.h"
#import "TRemoteStadium.h"

typedef NS_ENUM(NSInteger, kSearchScope) {
    kSearchScopeAll,
    kSearchScopeName,
    kSearchScopeZone
};

@interface TCreateTournamentForthViewController ()

@property (weak, nonatomic) NSMutableArray *stadiums;
@property (strong, nonatomic) NSMutableArray *filtered;
@property (strong, nonatomic) NSMutableArray *selectedStadiums;

@end

@implementation TCreateTournamentForthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.stadiums = [[[TTournament application] configurations] stadiums];
    self.filtered = [NSMutableArray array];
    self.selectedStadiums = [NSMutableArray array];
    
    [self.searchDisplayController.searchResultsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"StadiumCell"];
    [self.searchDisplayController.searchResultsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"AddStadiumCell"];
    
    __weak TCreateTournamentForthViewController *weakSelf = self;
    self.beforeBackBlock = ^(void) {
        __strong TCreateTournamentForthViewController *strongSelf = weakSelf;
        if ([strongSelf.searchDisplayController isActive]) {
            [strongSelf.searchDisplayController setActive:NO];
        }
    };
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"NewStadium"]) {
        TStadiumViewController *stadiumViewController = segue.destinationViewController;
        __weak TCreateTournamentForthViewController *weakSelf = self;
        stadiumViewController.creationSuccess = ^(TRemoteStadium *newStadium){
            __strong TCreateTournamentForthViewController *strongSelf = weakSelf;
            if (newStadium) {
                [strongSelf.stadiums addObject:newStadium];
            }
            [strongSelf.navigationController popViewControllerAnimated:YES];
        };
        if ([self.searchDisplayController.searchBar isFirstResponder]) {
            [self.searchDisplayController setActive:NO];
            NSIndexPath *selectedIndexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            [self.searchDisplayController.searchResultsTableView deselectRowAtIndexPath:selectedIndexPath animated:YES];
        }else{
            NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
            [self.tableView deselectRowAtIndexPath:selectedIndexPath animated:YES];
        }
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int items = 1;
    if (tableView == self.tableView) {
        items += self.stadiums.count;
    }else if (tableView == self.searchDisplayController.searchResultsTableView){
        items += self.filtered.count;
    }
    return items;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *stadiumCell = @"StadiumCell";
    static NSString *addStadiumCell = @"AddStadiumCell";
    
    UITableViewCell *cell = nil;
    if (indexPath.row == [self tableView:tableView numberOfRowsInSection:0] - 1) {
        cell = [self.tableView dequeueReusableCellWithIdentifier:addStadiumCell forIndexPath:indexPath];
    }else{
        cell = [self.tableView dequeueReusableCellWithIdentifier:stadiumCell forIndexPath:indexPath];
        TRemoteStadium *stadium = tableView == self.searchDisplayController.searchResultsTableView ? self.filtered[indexPath.row] : self.stadiums[indexPath.row];
        cell.textLabel.text = stadium.stadiumName;
        cell.detailTextLabel.text = stadium.neighborhood;
        if ([self.selectedStadiums containsObject:stadium]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }else{
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row != [self tableView:tableView numberOfRowsInSection:0] - 1) {
        UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
        TRemoteStadium *stadium = (tableView == self.searchDisplayController.searchResultsTableView ? self.filtered[indexPath.row] : self.stadiums[indexPath.row]);
        if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            [self.selectedStadiums removeObject:stadium];
        }else{
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            [self.selectedStadiums addObject:stadium];
        }
        
        if (tableView == self.searchDisplayController.searchResultsTableView) {
            self.searchDisplayController.searchBar.text = nil;
        }
    }
    [tableView reloadData];
}

#pragma mark Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText scope:(kSearchScope)scope {
	
    [self.filtered removeAllObjects]; // First clear the filtered array.
    if (scope == kSearchScopeAll) {
        [self.filtered addObjectsFromArray:[self.stadiums filteredArrayUsingPredicate:
                                            [NSPredicate predicateWithFormat:@"(SELF.stadiumName contains[cd] %@) OR (SELF.neighborhood contains[cd] %@)", searchText, searchText]]];
    }else if (scope == kSearchScopeName) {
        [self.filtered addObjectsFromArray:[self.stadiums filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(SELF.stadiumName contains[cd] %@)", searchText]]];
    }else if (scope == kSearchScopeZone) {
        [self.filtered addObjectsFromArray:[self.stadiums filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(SELF.neighborhood contains[cd] %@)", searchText]]];        
    }
}

#pragma mark - UISearchDisplayDelegate

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    [self filterContentForSearchText:controller.searchBar.text scope:searchOption];
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    [self filterContentForSearchText:searchString scope:controller.searchBar.selectedScopeButtonIndex];
    return YES;
}

@end
