//
//  TTournament.m
//  Tournament
//
//  Created by Nicolas Purita on 2/20/13.
//
//

#import "TTournamentApplication.h"
#import "TTournamentModel.h"
#import "TTournamentUserDefaults.h"
#import "TTournamentConfigurations.h"

@interface TTournamentApplication ()

@property (strong, nonatomic) TTournamentModel *model;
@property (strong, nonatomic) TTournamentUserDefaults *userDefaults;
@property (strong, nonatomic) TTournamentConfigurations *configurations;

@end

@implementation TTournamentApplication

- (id)init {
    self = [super init];
    if (self) {
        _model = [[TTournamentModel alloc] init];
        _userDefaults = [[TTournamentUserDefaults alloc] init];
        _configurations = [[TTournamentConfigurations alloc] init];
    }
    return self;
}

+ (TTournamentApplication *)application {
    static TTournamentApplication *application = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        application = [[TTournamentApplication alloc] init];
    });
    return application;
}

@end
