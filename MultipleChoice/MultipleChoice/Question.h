//
//  Question.h
//  MultipleChoice
//
//  Created by JJ Garzella on 3/15/14.
//  Copyright (c) 2014 JJ Garzella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Test;

@interface Question : NSManagedObject

@property (nonatomic, retain) NSString * questionText;
@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) Test *test;

@end
