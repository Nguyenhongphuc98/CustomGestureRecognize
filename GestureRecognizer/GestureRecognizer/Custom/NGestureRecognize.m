//
//  AGestureRecognize.m
//  GestureRecognizer
//
//  Created by CPU11716 on 1/13/20.
//  Copyright © 2020 CPU11716. All rights reserved.
//

#import "NGestureRecognize.h"
@interface NGestureRecognize()
@property CGPoint startPoint;
@property NSInteger strockCount;
@end

@implementation NGestureRecognize

- (void)reset {
    [super reset];
    self.strockCount = 0;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    if (touches.count > 1) {
        self.state = UIGestureRecognizerStateFailed;
        return;
    }
    
    self.startPoint = [touches.anyObject locationInView:self.view.superview];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    if (self.state == UIGestureRecognizerStateFailed || self.state == UIGestureRecognizerStateRecognized) {
        return;
    }
    
    UIView *parent = self.view.superview;
    CGPoint currentPoint = [touches.anyObject locationInView:parent];
    CGPoint previousPoint = [touches.anyObject previousLocationInView:parent];
    
    switch (self.strockCount) {
        case 0:
            if (currentPoint.y < previousPoint.y && (self.startPoint.y - currentPoint.y > 30)) {
                NSLog(@"part 1");
                self.strockCount = 1;
            }
            break;
            
        case 1:
            if (currentPoint.y > previousPoint.y && (currentPoint.x > previousPoint.x)) {
                NSLog(@"part 2");
                self.strockCount = 2;
            }
            break;
            
        case 2:
            if (currentPoint.y < previousPoint.y) {
                NSLog(@"part 3");
                self.strockCount = 3;
                self.state = UIGestureRecognizerStateRecognized;
            }
            break;
            
        default:
            break;
    }
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    [self reset];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    [self reset];
}
@end
