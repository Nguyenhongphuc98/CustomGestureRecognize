//
//  ViewController.m
//  GestureRecognizer
//
//  Created by CPU11716 on 1/13/20.
//  Copyright © 2020 CPU11716. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *monkeyImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *singleTapGestureRicognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapGesture:)];
    [self.monkeyImage addGestureRecognizer:singleTapGestureRicognize];
    
    UIPinchGestureRecognizer *pinchGestureRecognize = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
    [self.monkeyImage addGestureRecognizer:pinchGestureRecognize];
    
    UIRotationGestureRecognizer * rotateGestureRecognize = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotateGesture:)];
    rotateGestureRecognize.delegate = self;
    [self.monkeyImage addGestureRecognizer:rotateGestureRecognize];
}
- (IBAction)handlePan:(UIPanGestureRecognizer *)sender {

        NSLog(@"pan...");
        CGPoint translation = [sender translationInView:self.view];
        UIView *v = sender.view;
        [UIView animateWithDuration:0.1 animations:^{
            v.center = CGPointMake(v.center.x + translation.x, v.center.y + translation.y);
        }];
        [sender setTranslation:CGPointZero inView:self.view];
    
}

- (void)handleSingleTapGesture:(UITapGestureRecognizer*) tapGesture {
    CGFloat newWidth = 200;
    
    if (self.monkeyImage.frame.size.width == 200) {
        newWidth = 100;
    }
    
    UIView *v = tapGesture.view;
    CGPoint center = v.center;
    [UIView animateWithDuration:0.3 animations:^{
        v.frame = CGRectMake(v.frame.origin.x, v.frame.origin.y, newWidth, v.frame.size.height);
        v.center = center;
    }];
    NSLog(@"tap");
}

- (void)handlePinchGesture:(UIPinchGestureRecognizer*)pinchGesture {
    UIView *v = [pinchGesture view];
    v.transform = CGAffineTransformMakeScale(pinchGesture.scale, pinchGesture.scale);
    NSLog(@"pinch");
}

- (void)handleRotateGesture:(UIRotationGestureRecognizer*)rotateGesture {
    UIView *v = rotateGesture.view;
    v.transform = CGAffineTransformMakeRotation(rotateGesture.rotation);
    //rotateGesture.rotation = 0;
    NSLog(@"rotate");
}

//delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
