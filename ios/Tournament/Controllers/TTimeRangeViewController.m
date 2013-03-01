//
//  TTimeRangeViewController.m
//  Tournament
//
//  Created by Nicolas Purita on 2/28/13.
//
//

#import "TTimeRangeViewController.h"
#import "TRemoteTournament.h"
#import "TTransientSchedule.h"
#import "TTournamentModel.h"

@interface TTimeRangeViewController ()

@property (weak, nonatomic) TRemoteTournament *tournament;
@property (strong, nonatomic) NSIndexPath *selectedCell;
@property (strong, nonatomic) NSDateFormatter *formatter;
@property (strong, nonatomic) NSDate *startTime;
@property (strong, nonatomic) NSDate *endTime;

@end

@implementation TTimeRangeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [self setCustomBackButton];
    [self.timePicker addTarget:self action:@selector(didFinishWithDateSelection:) forControlEvents:UIControlEventValueChanged];
    
    self.selectedCell = [NSIndexPath indexPathForRow:0 inSection:0];
    
    self.tournament = [[[TTournament application] model] inProgressTournament];
    
    self.formatter = [[NSDateFormatter alloc] init];
    [self.formatter setDateFormat:@"HH:mm"];
    
    self.startTime = [self.formatter dateFromString:self.tournament.schedule.timeStartRange];
    self.endTime = [self.formatter dateFromString:self.tournament.schedule.timeEndRange];
}

- (void)back:(id)sender {
    if ([self areTimesValid]) {
        self.tournament.schedule.timeStartRange = [self.formatter stringFromDate:self.startTime];
        self.tournament.schedule.timeEndRange = [self.formatter stringFromDate:self.endTime];
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

- (BOOL)areTimesValid {
    return [self.startTime timeIntervalSinceDate:self.endTime] < 0;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"TimeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = S(@"START_AT");
        cell.detailTextLabel.text = [NSDateFormatter localizedStringFromDate:self.startTime
                                                                   dateStyle:NSDateFormatterNoStyle
                                                                   timeStyle:NSDateFormatterShortStyle];
    }else{
        cell.textLabel.text = S(@"END_AT");
        cell.detailTextLabel.text = [NSDateFormatter localizedStringFromDate:self.endTime
                                                                   dateStyle:NSDateFormatterNoStyle
                                                                   timeStyle:NSDateFormatterShortStyle];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDate *dateToShow = indexPath.row == 0 ? self.startTime : self.endTime;
    [self.timePicker setDate:dateToShow];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedCell = indexPath;
    return indexPath;
}

- (IBAction)didFinishWithDateSelection:(UIDatePicker *)sender {
    if (self.selectedCell.row == 0) {
        self.startTime = self.timePicker.date;
    }else{
        self.endTime = self.timePicker.date;
    }
    
    [self.tableView reloadRowsAtIndexPaths:@[self.selectedCell] withRowAnimation:UITableViewRowAnimationAutomatic];
}


@end
