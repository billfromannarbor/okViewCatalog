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
    OKViewCatalog* testViewCatalog = [[OKViewCatalog alloc] init];
    id classList = [testViewCatalog getAListOfAllClassImplementationFilesInXCodeDirectory:nil];
    XCTAssert(classList!=nil);
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
