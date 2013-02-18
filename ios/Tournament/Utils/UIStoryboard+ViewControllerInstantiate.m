//
//  UIStoryboard+ViewControllerInstantiate.m
//  Tournament
//
//  Created by Nicolas Purita on 3/17/13.
//

#import "UIStoryboard+ViewControllerInstantiate.h"

@implementation UIStoryboard (ViewControllerInstantiate)

+ (id)instantiateViewControllerWithIdentifier:(NSString *)identifier fromStoryboard:(NSString *)storyboardName {
    return [[UIStoryboard storyboardWithName:storyboardName bundle:nil] instantiateViewControllerWithIdentifier:identifier];
}

+ (id)instantiateInitialViewControllerFromStoryboard:(NSString *)storyboardName {
    return [[UIStoryboard storyboardWithName:storyboardName bundle:nil] instantiateInitialViewController];
}
@end
