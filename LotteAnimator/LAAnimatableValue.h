//
//  LAAnimatableValue.h
//  LotteAnimator
//
//  Created by brandon_withrow on 7/19/16.
//  Copyright © 2016 Brandon Withrow. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LAAnimatableValue <NSObject>

- (nullable CAKeyframeAnimation *)animationForKeyPath:(nonnull NSString *)keypath;
- (BOOL)hasAnimation;

@end
