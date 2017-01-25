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
