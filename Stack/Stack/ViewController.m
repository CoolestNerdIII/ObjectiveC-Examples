//
//  ViewController.m
//  Stack
//
//  Created by Paul Wilson on 11/9/13.
//  Copyright (c) 2013 PW Development. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSString *op;
    int val;
    id ob;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    Stack *s1 = [[Stack alloc]init];
    
    NSLog(@"%@", s1);
    [s1 push:[NSNumber numberWithInt:1]];
    [s1 push:[NSNumber numberWithInt:2]];
    [s1 push:[NSString stringWithFormat:@"Plus"]];
    NSLog(@"%@",[s1 description]);
    
    ob = [s1 pop];
    if ([ob isKindOfClass:[NSString class]]) {
        <#statements#>
    }
    
    
    NSString *op = [s1 pop];
    NSLog(op);
    //[s1 pop];
    NSLog(@"%@",[s1 pop]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
