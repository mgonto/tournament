//
//  TTournamentsViewController.m
//  Tournament
//
//  Created by Nicolas Purita on 2/17/13.
//
//

#import "TTournamentsViewController.h"

@interface TTournamentsViewController ()

@property (strong, nonatomic) NSArray *myTournaments;
@property (strong, nonatomic) NSArray *openTournaments;

@end

@implementation TTournamentsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tournamentCellId = @"TournamentCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tournamentCellId forIndexPath:indexPath];
    
    return cell;
}


@end
