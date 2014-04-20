//
//  FourImageQuestion.h
//  MultipleChoice
//
//  Created by JJ Garzella on 3/15/14.
//  Copyright (c) 2014 JJ Garzella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Question.h"


@interface FourImageQuestion : Question

@property (nonatomic, retain) id answerA;
@property (nonatomic, retain) id answerB;
@property (nonatomic, retain) id answerC;
@property (nonatomic, retain) id answerD;

@end
