//
//  TCreateTournamentPageViewController.m
//  Tournament
//
//  Created by Nicolas Purita on 2/24/13.
//
//

#import "TCreateTournamentPageViewController.h"
#import "TCreateTournamentFirstViewController.h"
#import "TCreateTournamentSecondViewController.h"
#import "TCreateTournamentThirdViewController.h"
#import "TExtraInformationViewController.h"

@interface TCreateTournamentPageViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, strong) UIPageViewController* pageViewController;
@property (nonatomic, strong) NSArray* viewControllers;
@property (nonatomic, strong) UIBarButtonItem *backButton;

@end

@implementation TCreateTournamentPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.backButton = [self setCustomBackButton];
    
    TCreateTournamentFirstViewController *firstStep = [self.storyboard instantiateViewControllerWithIdentifier:@"CTMainData"];
    TCreateTournamentSecondViewController *secondStep = [self.storyboard instantiateViewControllerWithIdentifier:@"CTSport"];
    TCreateTournamentThirdViewController *thirdStep = [self.storyboard instantiateViewControllerWithIdentifier:@"CTSchedule"];
    TExtraInformationViewController *fifthStep = [self.storyboard instantiateViewControllerWithIdentifier:@"CTExtraInformation"];
    
    self.viewControllers = @[firstStep, secondStep, thirdStep, fifthStep];
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                              navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                            options:nil];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    [self.pageViewController setViewControllers:@[firstStep] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
    
    CGRect pageFrame = self.view.bounds;
    self.pageViewController.view.frame = pageFrame;
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
    [self.view bringSubviewToFront:self.pageViewController.view];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    [self changeCancelButtonIntoBackButton];
    NSUInteger index = [self.viewControllers indexOfObject:viewController];
    if (index == NSNotFound || (index + 1) >= self.viewControllers.count) {
        [self changeNextButtonIntoDoneButton];
        return nil;
    } else {
        return [self.viewControllers objectAtIndex:(index + 1)];
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {

    [self changeDoneButtonIntoNextButton];
    NSUInteger index = [self.viewControllers indexOfObject:viewController];
    if (index == NSNotFound || index == 0) {
        [self changeBackButtonIntoCancelButton];
        return nil;
    } else {
        return [self.viewControllers objectAtIndex:(index - 1)];
    }
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return self.viewControllers.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return pageViewController.viewControllers.count == 0 ? 0 : [self.viewControllers indexOfObject:pageViewController.viewControllers[0]];
}

#pragma mark - UIPageViewControllerDelegate

#pragma mark - Private methods

- (void)changeNextButtonIntoDoneButton {
    self.navigationItem.rightBarButtonItem.title = S(@"DONE_BUTTON");
}

- (void)changeDoneButtonIntoNextButton {
    self.navigationItem.rightBarButtonItem.title = S(@"NEXT_BUTTON");
}

- (void)changeBackButtonIntoCancelButton {
    self.navigationItem.leftBarButtonItem = self.cancelButton;
}

- (void)changeCancelButtonIntoBackButton {
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.leftBarButtonItem = self.backButton;
}

- (IBAction)next:(id)sender {
    UIViewController* viewController = [self pageViewController:self.pageViewController viewControllerAfterViewController:self.pageViewController.viewControllers[0]];
    if (viewController) {
        if ([viewController isEqual:self.viewControllers.lastObject]) {
            [self changeNextButtonIntoDoneButton];
        }
        [self.pageViewController setViewControllers:@[viewController] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    } else {
//        if ([[TTournament application] isSessionAvailable]) {
//             TODO Create tournament request.
//        }else{
//             TODO show authentication form.
//    s    }
    }
}

- (IBAction)back:(id)sender {
    UIViewController* viewController = [self pageViewController:self.pageViewController viewControllerBeforeViewController:self.pageViewController.viewControllers[0]];
    if (viewController) {
        if ([viewController isEqual:self.viewControllers[0]]) {
            [self changeBackButtonIntoCancelButton];
        }
        [self.pageViewController setViewControllers:@[viewController] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    }
}


@end
