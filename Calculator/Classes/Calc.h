//
//  Calc.h
//  Calculator
//
//  Created by Krzysiek on 09-04-25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface Calc : UIViewController {
	float result;
	IBOutlet UILabel *calculatorScreen;
	int currentOperation;
	float currentNumber;
}
-(IBAction)buttonDigitPressed:(id)sender;
-(IBAction)buttonOperationPressed:(id)sender;
-(IBAction)cancelInput;
-(IBAction)cancelOperation;
@end
