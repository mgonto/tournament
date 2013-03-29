//
//  TErrorHandler.h
//  Tournament
//
//  Created by Nicolas Purita on 3/29/13.
//
//

#import <Foundation/Foundation.h>

@interface TErrorHandler : NSObject

+ (void) showErrorMessage:(NSString *)errorMessage title:(NSString *)title inView:(UIView *)view;

@end
