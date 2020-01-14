//
//  ZGestureRecognize.m
//  GestureRecognizer
//
//  Created by CPU11716 on 1/13/20.
//  Copyright © 2020 CPU11716. All rights reserved.
//

#import "ZGestureRecognize.h"

@interface ZGestureRecognize()

@property NSInteger strokePart;
@property NSInteger strokePreciseion;
@property CGPoint   firstTap;
@end

@implementation ZGestureRecognize

- (void) reset {
    [super reset];
    self.strokePart = 0;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    self.strokePreciseion = 10;
    
    if (touches.count >1) {
        self.state = UIGestureRecognizerStateFailed;
        return;
    }
    
    self.firstTap = [touches.anyObject locationInView:self.view.superview];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    if (self.state == UIGestureRecognizerStateFailed || self.state == UIGestureRecognizerStateRecognized) {
        return;
    }
    UIView *supperView = self.view.superview;
    CGPoint currentPoint = [touches.anyObject locationInView:supperView];
    CGPoint previousPoint = [touches.anyObject previousLocationInView:supperView];
    
    switch (self.strokePart) {
        case 0:
            if ((currentPoint.x > previousPoint.x) && (currentPoint.x - self.firstTap.x > 30) && (currentPoint.y - self.firstTap.y < self.strokePreciseion)) {
                self.strokePart = 1;
                NSLog(@"strock 1 finish");
            }
            break;
        case 1:
            if ((currentPoint.x < previousPoint.x) && (currentPoint.y > previousPoint.y)) {
                self.strokePart = 2;
                NSLog(@"strock 2 finish");
            }
            break;
        case 2:
            if ((currentPoint.x > previousPoint.x) && (currentPoint.y - previousPoint.y <self.strokePreciseion)) {
                self.strokePart = 3;
                self.state =UIGestureRecognizerStateRecognized;
                NSLog(@"strock 3 finish");
            }
            break;
        default:
            break;
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    [self reset];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    [self reset];
}
@end
