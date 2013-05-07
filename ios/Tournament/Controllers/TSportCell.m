//
//  TSportCell.m
//  Tournament
//
//  Created by Nicolas Purita on 2/23/13.
//
//

#import "TSportCell.h"

#import <QuartzCore/QuartzCore.h>

@implementation TSportCell

- (void)awakeFromNib {
    self.square.layer.borderColor = [UIColor grayColor].CGColor;
    self.square.layer.borderWidth = 1.0;
}

@end
