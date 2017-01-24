//
//  OKViewCatalog.m
//  OKViewCatalog
//
//  Created by Bill Heitzeg on 1/23/17.
//  Copyright © 2017 Bill Heitzeg. All rights reserved.
//

#import "OKViewCatalog.h"

@implementation OKViewCatalog

    //Some Java Doc Here
    //@Method I'm a method

-(NSDictionary *) getAListOfAllClassImplementationFilesInXCodeDirectory: (NSString *) xcodeDirectory {
    NSFileManager *localFileManager=[[NSFileManager alloc] init];
    NSDirectoryEnumerator *directoryEnumerator = [localFileManager enumeratorAtPath:xcodeDirectory];
    NSString *file;
    NSMutableDictionary *classDictionary = [[NSMutableDictionary alloc] init];
    while ((file = [directoryEnumerator nextObject])) {
        BOOL isHeader = [[file pathExtension] isEqualToString: @"h" ];
        BOOL isClass = [[file pathExtension] isEqualToString: @"m" ];
        if ( isHeader || isClass) {
            NSString* fileWithoutExtension= [file substringToIndex:[file length]-2];
            NSMutableDictionary * fileList = [classDictionary valueForKey:fileWithoutExtension];
            if ( fileList==nil)
            {
                fileList = [[NSMutableDictionary alloc] init];
            }
            if ( isHeader) {
                [fileList setValue:file forKey:@"Header"];
            }
            else if (isClass) {
                [fileList setValue:file forKey:@"Class"];
            }
            [classDictionary setValue:fileList forKey:fileWithoutExtension];
        }    
    }
    

    return classDictionary;
}

@end

/*
 
 NSString *file;
 NSLog(@"Enumerating Directory: %@", projectDir);
 while ((file = [dirEnum nextObject])) {
 if ([[file pathExtension] isEqualToString: @"m"]) {
 NSLog(@"Objective C class file: %@", file);
 }
 else if ([[file pathExtension] isEqualToString: @"h"]) {
 NSLog(@"Header file: %@", file);
 }
 else {
 //NSLog(@"Other File: %@", file);
 }
 }
*/
