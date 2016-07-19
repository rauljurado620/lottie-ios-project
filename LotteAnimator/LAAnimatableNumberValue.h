//
//  LAAnimatableNumberValue.h
//  LotteAnimator
//
//  Created by brandon_withrow on 6/23/16.
//  Copyright © 2016 Brandon Withrow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LAAnimatableValue.h"

@interface LAAnimatableNumberValue : NSObject <LAAnimatableValue>

- (instancetype)initWithNumberValues:(NSDictionary *)numberValues frameRate:(NSNumber *)frameRate;
- (void)remapValuesFromMin:(NSNumber *)fromMin
                   fromMax:(NSNumber *)fromMax
                     toMin:(NSNumber *)toMin
                     toMax:(NSNumber *)toMax;

@property (nonatomic, readonly) NSNumber *initialValue;

@end
