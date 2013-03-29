//
//  TStadiumViewController.m
//  Tournament
//
//  Created by Nicolas Purita on 3/6/13.
//
//

#import "TStadiumViewController.h"
#import "TModelValidator.h"
#import <QuartzCore/QuartzCore.h>

@interface TStadiumViewController () <UIGestureRecognizerDelegate>

@property (strong, nonatomic) UITapGestureRecognizer *gestureRecognizer;
@property (weak, nonatomic) UITextField *active;

@end

@implementation TStadiumViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [self setCustomBackButton];
    
    for (UIView *square in self.squares) {
        square.layer.borderColor = [UIColor grayColor].CGColor;
        square.layer.borderWidth = 1.0;
    }
    
    self.gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
    self.gestureRecognizer.cancelsTouchesInView = NO;
    self.gestureRecognizer.delegate = self;
    [self.tableView addGestureRecognizer:self.gestureRecognizer];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveNewStadium:(id)sender {
    TRemoteStadium *newStadium = [[TRemoteStadium alloc] init];
    newStadium.stadiumName = self.nameTextField.text;
    newStadium.neighborhood = self.zoneTextField.text;
    newStadium.address = self.addressTextField.text;
    newStadium.phone = self.phoneTextField.text;
    
    NSString *errorMessage = [TModelValidator validateStadium:newStadium];
    if (errorMessage.length == 0) {
        self.creationSuccess(newStadium);
    }else{
        [TErrorHandler showErrorMessage:errorMessage title:S(@"ERROR_STADIUM_CREATION_TITLE") inView:self.view];
    }
    
}

- (IBAction)next:(UITextField *)textfield {
    UITextField *next = nil;
    if (self.active == self.nameTextField) {
        next = self.zoneTextField;
    } else if(self.active == self.zoneTextField) {
        next = self.addressTextField;
    } else if (self.active == self.addressTextField) {
        next = self.phoneTextField;
    }
    
    [next becomeFirstResponder];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:next.tag inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (IBAction)startEditing:(UITextField *)sender {
    self.active = sender;
}

- (IBAction)hideKeyboard:(id)sender {
    [self.active resignFirstResponder];
    self.active = nil;
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if(([touch.view isKindOfClass:[UITextField class]]) && (gestureRecognizer == self.gestureRecognizer))
    {
        return NO;
    }
    return YES;
}


@end
