//
//  TTransientStadium.h
//  Tournament
//
//  Created by Nicolas Purita on 2/20/13.
//
//

#import <Foundation/Foundation.h>

@interface TTransientStadium : NSObject <NSCoding>

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *zone;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *phone;

@end
