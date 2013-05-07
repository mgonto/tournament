//
//  TPointsCell.m
//  Tournament
//
//  Created by Nicolas Purita on 2/23/13.
//
//

#import "TPointsCell.h"

#import <QuartzCore/QuartzCore.h>

@implementation TPointsCell

- (void)awakeFromNib {
    self.square.layer.borderColor = [UIColor grayColor].CGColor;
    self.square.layer.borderWidth = 1.0;
}

- (IBAction)didEndEditingPoints:(id)sender {
    [self.pointsTextField resignFirstResponder];
    self.completion(self.pointsKey, [self.pointsTextField.text intValue]);
}

@end
