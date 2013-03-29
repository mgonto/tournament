//
//  TErrorHandler.m
//  Tournament
//
//  Created by Nicolas Purita on 3/29/13.
//
//

#import "TErrorHandler.h"

@implementation TErrorHandler

+ (void) showErrorMessage:(NSString *)errorMessage title:(NSString *)title inView:(UIView *)view {
    
    float hideAfter = 0;
    if (errorMessage.length <= 20) {
        hideAfter = 1.5;
    }else if (errorMessage.length <= 50){
        hideAfter = 2.5;
    }else{
        hideAfter = 4;
    }
    
    [YRDropdownView showDropdownInView:view
                                 title:title
                                detail:errorMessage
                                 image:nil
                       backgroundImage:nil
                       titleLabelColor:[UIColor colorWithRGBValuesForRed:35 green:179 blue:41]
                      detailLabelColor:nil
                              animated:YES
                             hideAfter:hideAfter];
}

@end