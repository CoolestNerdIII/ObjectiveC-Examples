//
//  Stack.h
//  Stack
//
//  Created by Paul Wilson on 11/9/13.
//  Copyright (c) 2013 PW Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject
-(void)push:(id)obj;
-(id)pop;
-(NSUInteger)size;
-(id)peek;
-(BOOL)isEmpty;

@end
