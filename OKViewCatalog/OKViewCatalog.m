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

-(NSDictionary *) getAListOfAllClassImplementationFilesInXCodeDirectory: (NSURL *) xcodeDirectory {
    //NSDirectoryEnumerator * directoryEnumerator = [[NSDirectoryEnumerator alloc] init];
    if ([xcodeDirectory hasDirectoryPath]) {
        return [[NSDictionary alloc] init];
    }
    else {
        return nil;
    }
}

@end
