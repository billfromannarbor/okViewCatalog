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
NSString * _projectDir;


- (void)testIdentifyAllClassImplementationFilesThatAreViews {
    
   
}

- (void) testGetListOfViewClasses {
    OKViewCatalog *okViewCatalog = [[OKViewCatalog alloc] init];
    NSArray* listOfUIViewSubclasses = [okViewCatalog getListOfViewClasses];
    XCTAssert(listOfUIViewSubclasses!=nil);
}

- (void)testPersistCatalog {
    OKViewCatalog *okViewCatalog = [[OKViewCatalog alloc] init];
    NSDictionary *dictionaryOfClassfiles = [okViewCatalog getSourceFilesFromXCodeDirectory:_projectDir];
    XCTAssert(dictionaryOfClassfiles!=nil);
    
    BOOL success = [okViewCatalog persistCatalog:_projectDir dictionary:dictionaryOfClassfiles];
    XCTAssert(success);
    
}

- (void)testRetrievePersistedCatalog {
    OKViewCatalog *okViewCatalog = [[OKViewCatalog alloc] init];
    NSDictionary *dictionaryOfClassfiles = [okViewCatalog getSourceFilesFromXCodeDirectory:_projectDir];
    XCTAssert(dictionaryOfClassfiles!=nil);
    
    BOOL success = [okViewCatalog persistCatalog:_projectDir dictionary:dictionaryOfClassfiles];
    XCTAssert(success);
    
    NSDictionary *dictionaryFrompListFile = [okViewCatalog getPersistedCatalog: _projectDir];
    XCTAssert(dictionaryFrompListFile!=nil);
}

- (void)testGetSourceFilesFromXCodeDirectory {
    OKViewCatalog *okViewCatalog = [[OKViewCatalog alloc] init];
    NSDictionary *dictionaryOfSourceFiles = [okViewCatalog getSourceFilesFromXCodeDirectory:_projectDir];
    XCTAssert(dictionaryOfSourceFiles!=nil);
}

- (void)setUp {
    [super setUp];
    _projectDir = @"/Users/hei396/learning/okViewCatalog";
}

//Helper Methods

- (void) logTheClassDictionary: (NSDictionary *) classDictionary {
    for (NSString *classKey in classDictionary) {
        NSDictionary *dictionaryOfFiles= classDictionary[classKey];
        NSLog(@"Class %@", classKey);
        for (NSString *fileType in dictionaryOfFiles) {
            NSString *filePath= dictionaryOfFiles[fileType];
            NSLog(@"   filePath %@", filePath);
        }
    }
}


@end
