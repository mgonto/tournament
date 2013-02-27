//
//  TSport.h
//  Tournament
//
//  Created by Nicolas Purita on 2/23/13.
//
//

#import <Foundation/Foundation.h>

@interface TSport : NSObject <NSCoding>

@property (assign, nonatomic) kSport identifier;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableDictionary *defaultPoints;

+ (TSport *)initSportWith:(kSport)idenifier name:(NSString *)name availablePoints:(NSDictionary *)defaultPoints;

@end
