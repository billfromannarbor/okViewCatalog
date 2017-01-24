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
    NSString *projectDir = @"/Users/hei396/learning/okViewCatalog";
    OKViewCatalog *okViewCatalog = [[OKViewCatalog alloc] init];
    NSDictionary *dictionaryOfClassfiles = [okViewCatalog getAListOfAllClassImplementationFilesInXCodeDirectory:projectDir];
    for (NSString *classKey in dictionaryOfClassfiles) {
        NSDictionary *dictionaryOfFiles= dictionaryOfClassfiles[classKey];
        for (NSString *fileType in dictionaryOfFiles) {
            NSString *filePath= dictionaryOfFiles[fileType];
            NSLog(@"file: %@ for type: %@", filePath, fileType);
        }
    }
    XCTAssert(dictionaryOfClassfiles!=nil);
    
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
