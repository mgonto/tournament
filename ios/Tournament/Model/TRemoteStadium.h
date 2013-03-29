//
//  TTransientStadium.h
//  Tournament
//
//  Created by Nicolas Purita on 2/20/13.
//
//

#import <Foundation/Foundation.h>

@interface TRemoteStadium : NSObject <NSCoding>

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *stadiumName;
@property (strong, nonatomic) NSString *neighborhood;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *phone;

+ (id) stadiumWithName:(NSString *)name neighbour:(NSString *)zone address:(NSString *)address phone:(NSString *)phone;

@end
