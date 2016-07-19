//
//  LAShapeLayerView.m
//  LotteAnimator
//
//  Created by Brandon Withrow on 7/13/16.
//  Copyright © 2016 Brandon Withrow. All rights reserved.
//

#import "LAShapeLayerView.h"
#import "CAAnimationGroup+LAAnimatableGroup.h"

@implementation LAShapeLayerView {
  LAShapeTransform *_transform;
  LAShapeStroke *_stroke;
  LAShapeFill *_fill;
  LAShapePath *_path;
  
  CAShapeLayer *_fillLayer;
  CAShapeLayer *_strokeLayer;
  
  CAAnimationGroup *_animation;
  CAAnimationGroup *_strokeAnimation;
  CAAnimationGroup *_fillAnimation;
}

- (instancetype)initWithShape:(LAShapePath *)shape
                         fill:(LAShapeFill *)fill
                       stroke:(LAShapeStroke *)stroke
                    transform:(LAShapeTransform *)transform {
  self = [super init];
  if (self) {
    _path = shape;
    _stroke = stroke;
    _fill = fill;
    _transform = transform;
    
    self.frame = _transform.compBounds;
    self.anchorPoint = _transform.anchor.initialPoint;
    self.opacity = _transform.opacity.initialValue.floatValue;
    self.position = _transform.position.initialPoint;
    
    _fillLayer = [CAShapeLayer layer];
    _fillLayer.path = _path.shapePath.initialShape.CGPath;
    _fillLayer.fillColor = _fill.color.initialColor.CGColor;
    _fillLayer.opacity = _fill.opacity.initialValue.floatValue;
    [self addSublayer:_fillLayer];
    
    _strokeLayer = [CAShapeLayer layer];
    _strokeLayer.path = _path.shapePath.initialShape.CGPath;
    _strokeLayer.strokeColor = _stroke.color.initialColor.CGColor;
    _strokeLayer.opacity = _stroke.opacity.initialValue.floatValue;
    _strokeLayer.lineWidth = _stroke.width.initialValue.floatValue;
    _strokeLayer.fillColor = nil;
    [self addSublayer:_strokeLayer];
    [self _buildAnimation];
    
  }
  return self;
}

- (void)_buildAnimation {
  if (_transform) {
    _animation = [CAAnimationGroup animationGroupForAnimatablePropertiesWithKeyPaths:@{@"opacity" : _transform.opacity,
                                                                                       @"transform.rotation" : _transform.rotation,
                                                                                       @"position" : _transform.position,
                                                                                       @"anchorPoint" : _transform.anchor}];
  }
  
  if (_stroke) {
    _strokeAnimation = [CAAnimationGroup animationGroupForAnimatablePropertiesWithKeyPaths:@{@"strokeColor" : _stroke.color,
                                                                                             @"opacity" : _stroke.opacity,
                                                                                             @"lineWidth" : _stroke.width,
                                                                                             @"path" : _path.shapePath}];
  }
  
  if (_fill) {
    _fillAnimation = [CAAnimationGroup animationGroupForAnimatablePropertiesWithKeyPaths:@{@"fillColor" : _fill.color,
                                                                                           @"opacity" : _fill.opacity,
                                                                                           @"path" : _path.shapePath}];
  }
}

- (void)startAnimation {
  if (_animation) {
    [self addAnimation:_animation forKey:@"LotteAnimation"];
  }
  if (_strokeAnimation) {
    [_strokeLayer addAnimation:_strokeAnimation forKey:@""];
  }
  
  if (_fillAnimation) {
    [_fillLayer addAnimation:_fillAnimation forKey:@""];
  }
}

@end
