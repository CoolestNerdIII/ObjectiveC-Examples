//
//  Quiz.h
//  QuoteQuiz
//
//  Created by Linda Burke on 3/18/13.
//  Copyright (c) 2013 Razeware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quiz : NSObject

@property (nonatomic, retain) NSMutableArray * movieArray; // Previous Property
@property (nonatomic, assign) NSInteger correctCount;
@property (nonatomic, assign) NSInteger incorrectCount;
@property (nonatomic, assign) NSInteger quizCount;
@property (nonatomic, readonly, strong) NSString * quote;
@property (nonatomic, readonly, strong) NSString * ans1;
@property (nonatomic, readonly, strong) NSString * ans2;
@property (nonatomic, readonly, strong) NSString * ans3;
@property (nonatomic, assign) NSInteger tipCount;
@property (nonatomic, strong) NSString * tip;

-(id) initWithQuiz:(NSString*)plistName; // Previous Method
-(void) nextQuestion: (NSUInteger) idx;
-(BOOL) checkQuestion: (NSUInteger) question forAnswer: (NSUInteger) answer;

@end
