//
//  Test+Utils.m
//  MultipleChoice
//
//  Created by JJ Garzella on 4/19/14.
//  Copyright (c) 2014 JJ Garzella. All rights reserved.
//

#import "Test+Utils.h"

@implementation Test (Utils)

+ (Test *)testWithQuestions:(NSOrderedSet *)questions
     inManagedObjectContext:(NSManagedObjectContext *)context
{
    Test *test = [NSEntityDescription insertNewObjectForEntityForName:@"Test"
                                               inManagedObjectContext:context];
    
    
    test.questions = questions;
    
    return test;
}

@end
