//
//  OKViewCatalogTests.m
//  OKViewCatalogTests
//
//  Created by Bill Heitzeg on 1/23/17.
//  Copyright © 2017 Bill Heitzeg. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OKViewCatalog.h"

@interface OKViewCatalogTests : XCTestCase

@end

@implementation OKViewCatalogTests


- (void)testIterateThroughAllClassImplementationFilesInAnXCodeDirectory {
    NSString *docsDir = [NSHomeDirectory() stringByAppendingPathComponent:  @"Documents"];
    NSFileManager *localFileManager=[[NSFileManager alloc] init];
    NSDirectoryEnumerator *dirEnum = [localFileManager enumeratorAtPath:docsDir];
    
    NSString *file;
    while ((file = [dirEnum nextObject])) {
        if ([[file pathExtension] isEqualToString: @"doc"]) {
            // process the document
            NSLog(@"%@", [docsDir stringByAppendingPathComponent:file]);
            //[self scanDocument: [docsDir stringByAppendingPathComponent:file]];
        }
    }
}

- (void)testFindUIViewClassDeclarationInClassImplementationFile {
    XCTAssert(false, @"not implemented");
}

- (void)testIdentifyAllClassImplementationFilesThatAreViews {
    XCTAssert(false, @"not implemented");
   
}

- (void)testLinkWithAnExternalProject {
    XCTAssert(false, @"not implemented");
    
}

- (void)testStoreDataInpListFile {
    XCTAssert(false, @"not implemented");
    
}

- (void)testRetrieveDataFrompListFile {
    XCTAssert(false, @"not implemented");
    
}

@end
