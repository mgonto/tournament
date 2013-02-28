//
//  TDateSelectionViewController.m
//  Tournament
//
//  Created by Nicolas Purita on 2/27/13.
//
//

#import "TDateSelectionViewController.h"
#import "TRemoteTournament.h"
#import "TTransientSchedule.h"
#import "TTournamentModel.h"

@interface TDateSelectionViewController ()

@property (weak, nonatomic) TRemoteTournament *tournament;
@property (strong, nonatomic) NSIndexPath *selectedCell;

@end

@implementation TDateSelectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [self setCustomBackButton];
    [self.datePicker addTarget:self action:@selector(didFinishWithDateSelection:) forControlEvents:UIControlEventValueChanged];
    [self.datePicker setMinimumDate:[NSDate date]];
    
    self.selectedCell = [NSIndexPath indexPathForRow:0 inSection:0];
    
    self.tournament = [[[TTournament application] model] inProgressTournament];
}

- (void)back:(id)sender {
    if ([self areDatesValid]) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [YRDropdownView showDropdownInView:self.view
                                     title:S(@"START_END_DATE_ERROR_TITLE")
                                    detail:S(@"START_END_DATE_ERROR_MESSAGE")
                                     image:nil
                           backgroundImage:nil
                           titleLabelColor:[UIColor blackColor]
                          detailLabelColor:[UIColor blackColor]
                                  animated:YES
                                 hideAfter:2.0];
    }
}

- (BOOL)areDatesValid {
    return [self.tournament.schedule.startDate timeIntervalSinceDate:self.tournament.schedule.endDate] < 0;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"DateCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = S(@"START_DATE");
        cell.detailTextLabel.text = [NSDateFormatter localizedStringFromDate:self.tournament.schedule.startDate
                                                                   dateStyle:NSDateFormatterMediumStyle
                                                                   timeStyle:NSDateFormatterNoStyle];
    }else{
        cell.textLabel.text = S(@"END_DATE");
        cell.detailTextLabel.text = [NSDateFormatter localizedStringFromDate:self.tournament.schedule.endDate
                                                                   dateStyle:NSDateFormatterMediumStyle
                                                                   timeStyle:NSDateFormatterNoStyle];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDate *dateToShow = indexPath.row == 0 ? self.tournament.schedule.startDate : self.tournament.schedule.endDate;
    [self.datePicker setDate:dateToShow];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedCell = indexPath;
    return indexPath;
}

- (IBAction)didFinishWithDateSelection:(UIDatePicker *)sender {
    if (self.selectedCell.row == 0) {
        self.tournament.schedule.startDate = self.datePicker.date;
    }else{
        self.tournament.schedule.endDate = self.datePicker.date;
    }
    
    [self.tableView reloadRowsAtIndexPaths:@[self.selectedCell] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
