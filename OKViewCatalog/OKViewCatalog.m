//
//  OKViewCatalog.m
//  OKViewCatalog
//
//  Created by Bill Heitzeg on 1/23/17.
//  Copyright © 2017 Bill Heitzeg. All rights reserved.
//

#import "OKViewCatalog.h"
#import <objc/runtime.h>


@implementation OKViewCatalog

-(NSArray* ) findViewDeclarationsInSourceFiles: (NSArray *) listOfViewClasses sourceFiles:(NSDictionary* )sourceFiles {
    NSMutableArray* viewDeclarationsInSourceFiles = [[NSMutableArray alloc]init];
    
    for (NSString *classKey in sourceFiles) {
        NSDictionary *dictionaryOfFiles= sourceFiles[classKey];
        NSLog(@"Class %@", classKey);
        for (NSString *fileType in dictionaryOfFiles) {
            NSString *filePath= dictionaryOfFiles[fileType];
            NSLog(@"FilePath: %@", filePath);
            NSString *fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
            NSLog(@"fileContents Length = %ld", fileContents.length);
            NSRange searchRange = NSMakeRange(0, [fileContents length]);
            for (NSString* viewClass in listOfViewClasses) {
                NSRange viewClassFoundRange = [fileContents rangeOfString:fileContents options:NSLiteralSearch range:searchRange];
                //while (viewClassFoundRange.location != NSNotFound) {
                    NSLog(@"ViewClass:%@ is Located at:%ld,%ld in file:%@ ", viewClass, viewClassFoundRange.location,viewClassFoundRange.length, filePath);
                    
                    searchRange = NSMakeRange(viewClassFoundRange.location+viewClassFoundRange.length, [fileContents length]);
                    viewClassFoundRange = [fileContents rangeOfString:fileContents options:NSLiteralSearch range:searchRange];
                //}
                //Search and store all matches in a new Dictionary
                
            }
        }
    }
 
    
    
    return viewDeclarationsInSourceFiles;
}

-(NSDictionary *) getSourceFilesFromXCodeDirectory:(NSString *) xcodeDirectory {
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

-(BOOL) persistCatalog: (NSString *) path dictionary: (NSDictionary*) dictionary {
    NSString * filePath = [NSString stringWithFormat:@"%@/UIViewCatalog.plist", path];
    return [dictionary writeToFile:filePath atomically:TRUE];
}

-(NSDictionary *) getPersistedCatalog: (NSString *) path  {
    NSString * filePath = [NSString stringWithFormat:@"%@/UIViewCatalog.plist", path];
    NSDictionary* dictionary = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dictionary;
    
}

-(NSArray*) getListOfViewClasses {
    NSMutableArray* viewClasses=[[NSMutableArray alloc]init];
    [viewClasses addObject:@"UIView"];
    [viewClasses addObject:@"NSControl"];
    return viewClasses;
}


@end
