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

- (void)setUp {
    [super setUp];
     _projectDir = @"/Users/hei396/learning/okViewCatalog";
}
- (void)testGetAListOfAllClassImplementationFilesInXCodeDirectory {
    OKViewCatalog *okViewCatalog = [[OKViewCatalog alloc] init];
    NSDictionary *dictionaryOfClassfiles = [okViewCatalog getAListOfAllClassImplementationFilesInXCodeDirectory:_projectDir];
    XCTAssert(dictionaryOfClassfiles!=nil);
}


- (void)testIdentifyAllClassImplementationFilesThatAreViews {
   
}

- (void) testGetAListOfAllUIViewSubclasses {
    OKViewCatalog *okViewCatalog = [[OKViewCatalog alloc] init];
    NSArray* listOfUIViewSubclasses = [okViewCatalog getAListOfAllUIViewClasses];
    XCTAssert(listOfUIViewSubclasses!=nil);
}

- (void)testStoreDataInpListFile {
    OKViewCatalog *okViewCatalog = [[OKViewCatalog alloc] init];
    NSDictionary *dictionaryOfClassfiles = [okViewCatalog getAListOfAllClassImplementationFilesInXCodeDirectory:_projectDir];
    XCTAssert(dictionaryOfClassfiles!=nil);
    
    BOOL success = [okViewCatalog writeDictionary:_projectDir dictionary:dictionaryOfClassfiles];
    XCTAssert(success);
    
}

- (void)testRetrieveDataFrompListFile {
}

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
