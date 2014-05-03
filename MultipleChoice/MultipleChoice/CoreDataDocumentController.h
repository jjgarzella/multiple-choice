//
//  CoreDataDocumentController.h
//  MultipleChoice
//
//  Created by JJ Garzella on 4/23/14.
//  Copyright (c) 2014 JJ Garzella. All rights reserved.
//
// CoreDataDocumentController is a small helper class that sets up core data in an app. 

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CoreDataDocumentController : NSObject

@property (nonatomic, strong) UIManagedDocument *database; // this is for easy acess to the database. It will not return anything until the next method is called.

// This method sets up core data.
- (void)setupCoreDataWithCompletion:(void (^)(UIManagedDocument *database))completion
                            cleanly:(BOOL)cleanly;

@end
