//
//  TRemoteShare.h
//  Tournament
//
//  Created by Nicolas Purita on 3/27/13.
//
//

#import <Foundation/Foundation.h>

@interface TRemoteShare : NSObject

@property (assign, nonatomic) BOOL shareOnTwitter;
@property (assign, nonatomic) BOOL shareOnFacebook;
@property (strong, nonatomic) NSArray *emails;

@end
