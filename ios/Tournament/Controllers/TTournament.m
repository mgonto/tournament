//
//  TTournament.m
//  Tournament
//
//  Created by Nicolas Purita on 2/20/13.
//
//

#import "TTournament.h"
#import "TTournamentModel.h"
#import "TTournamentUserDefaults.h"
#import "TTournamentConfigurations.h"

@interface TTournament ()

@property (strong, nonatomic) TTournamentModel *model;
@property (strong, nonatomic) TTournamentUserDefaults *userDefaults;
@property (strong, nonatomic) TTournamentConfigurations *configurations;

@end

@implementation TTournament

- (id)init {
    self = [super init];
    if (self) {
        _model = [[TTournamentModel alloc] init];
        _userDefaults = [[TTournamentUserDefaults alloc] init];
        _configurations = [[TTournamentConfigurations alloc] init];
    }
    return self;
}

+ (TTournament *)application {
    static TTournament *application = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        application = [[TTournament alloc] init];
    });
    return application;
}

@end
