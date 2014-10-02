//
//  ViewController.m
//  MinorityReport
//
//  Created by Richmond on 10/2/14.
//  Copyright (c) 2014 Richmond. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *theFuture;
@property (strong, nonatomic) IBOutlet UIView *thePreCogs;
@property CGPoint originalCenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.originalCenter = self.theFuture.center;
}

-(IBAction)onDrag:(UIPanGestureRecognizer *)panGesture{
    CGPoint point = [panGesture locationInView:self.view];
    self.theFuture.center = point;

    if (panGesture.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:4.0 animations:^{
            self.theFuture.center = self.originalCenter;
            self.theFuture.backgroundColor = [UIColor whiteColor];
        }];
    } else {
        if(CGRectContainsPoint(self.thePreCogs.frame, point)){
            self.theFuture.backgroundColor = [UIColor redColor];
            self.theFuture.text = @"A ficticious and incriminating future";
            [self.theFuture sizeToFit];
        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
