//
//  CustomController.m
//  GestureRecognizer
//
//  Created by CPU11716 on 1/13/20.
//  Copyright © 2020 CPU11716. All rights reserved.
//

#import "CustomController.h"

@interface CustomController ()
@property (weak, nonatomic) IBOutlet UILabel *btnRecognize;

@end

@implementation CustomController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ZGestureRecognize * zGestureRecognize = [[ZGestureRecognize alloc] initWithTarget:self action:@selector(handleZGestureReconize:)];
    [self.view addGestureRecognizer:zGestureRecognize];
    
    NGestureRecognize * nGestureRecognize = [[NGestureRecognize alloc] initWithTarget:self action:@selector(handleNGestureRecognize:)];
    [self.view addGestureRecognizer:nGestureRecognize];
}

- (void)handleZGestureReconize:(ZGestureRecognize*)gesture {
    [self.btnRecognize setText:@"Z"];
}

- (void)handleNGestureRecognize:(NGestureRecognize*)gesture {
     [self.btnRecognize setText:@"N"];
}

@end
