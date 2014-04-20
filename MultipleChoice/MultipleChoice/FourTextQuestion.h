//
//  FourTextQuestion.h
//  MultipleChoice
//
//  Created by JJ Garzella on 3/15/14.
//  Copyright (c) 2014 JJ Garzella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Question.h"


@interface FourTextQuestion : Question

@property (nonatomic, retain) NSString * answerA;
@property (nonatomic, retain) NSString * answerB;
@property (nonatomic, retain) NSString * answerC;
@property (nonatomic, retain) NSString * answerD;

@end
