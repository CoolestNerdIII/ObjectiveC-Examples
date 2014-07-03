//
//  Calc.m
//  Calculator
//
//  Created by Krzysiek on 09-04-25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Calc.h"


@implementation Calc

-(IBAction)buttonDigitPressed:(id)sender {
	currentNumber = currentNumber*10 + (float)[sender tag];
	calculatorScreen.text = [NSString stringWithFormat:@"%.2f",currentNumber];
}
-(IBAction)buttonOperationPressed:(id)sender {
	if (currentOperation == 0) result = currentNumber;
	else {
		switch (currentOperation) {
			case 1:
				result = result + currentNumber;
				break;
			case 2:
				result = result - currentNumber;
				break;
			case 3:
				result = result * currentNumber;
				break;
			case 4:
				result = result / currentNumber;
				break;
			case 5:
				currentOperation = 0;
				break;
		}
	}
	currentNumber = 0;
	calculatorScreen.text = [NSString stringWithFormat:@"%.2f",result];
	if ([sender tag] == 0) result = 0;
	currentOperation = [sender tag];
}
-(IBAction)cancelInput {
	currentNumber = 0;
	calculatorScreen.text = @"0.00";
}
-(IBAction)cancelOperation {
	currentNumber = 0;
	calculatorScreen.text = @"0.00";
	currentOperation = 0;
}



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
	[calculatorScreen release];
}


@end
