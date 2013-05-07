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

@interface TCreateTournamentPageViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, strong) UIPageViewController* pageViewController;
@property (nonatomic, strong) NSArray* viewControllers;

@end

@implementation TCreateTournamentPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TCreateTournamentFirstViewController *firstStep = [self.storyboard instantiateViewControllerWithIdentifier:@"CTMainData"];
    TCreateTournamentSecondViewController *secondStep = [self.storyboard instantiateViewControllerWithIdentifier:@"CTSport"];
    
    self.viewControllers = @[firstStep, secondStep];
    
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
    NSUInteger index = [self.viewControllers indexOfObject:viewController];
    if (index == NSNotFound || (index + 1) >= self.viewControllers.count) {
        return nil;
    } else {
        return [self.viewControllers objectAtIndex:(index + 1)];
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self.viewControllers indexOfObject:viewController];
    if (index == NSNotFound || index == 0) {
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

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
    
    if (completed) {
        //TODO Send Request to server and Dismiss Modal.
    }
}

@end
