//
//  MCViewController.m
//  MultipleChoice
//
//  Created by JJ Garzella on 3/15/14.
//  Copyright (c) 2014 JJ Garzella. All rights reserved.
//

#import "MCViewController.h"

@interface MCViewController ()

@end

@implementation MCViewController

- (void)setup
{
    
}

- (void)setupDatabase
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self.database.fileURL path]]) { // If it is not created
        
        [self.database saveToURL:self.database.fileURL
                          forSaveOperation:UIDocumentSaveForCreating
                         completionHandler:^(BOOL success) {
                             [self setup];
                         }];
        
    } else if (self.database.documentState == UIDocumentStateClosed) { // if it is closed
        
        [self.database openWithCompletionHandler:^(BOOL success) {
            [self setup];
        }];
    } else { // if it is open
        [self setup];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *fileURL = [[NSUserDefaults standardUserDefaults] URLForKey:@"DatabaseFileURL"];
    
    if (!fileURL) {
        // make the URL and store it in NSUserDefaults
        fileURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                          inDomains:NSUserDomainMask] lastObject]; // Docs Directory
        fileURL = [fileURL URLByAppendingPathComponent:@"Database"]; // Append New Path Component
        
        [[NSUserDefaults standardUserDefaults] setURL:fileURL forKey:@"DatabaseFileURL"];
    }
    
    // resets the database - temporary
    //[[NSFileManager defaultManager] removeItemAtPath:fileURL.path
    //                                    error:NULL];
    
    self.database = [[UIManagedDocument alloc] initWithFileURL:fileURL];
    
    [self setupDatabase];
}

@end
