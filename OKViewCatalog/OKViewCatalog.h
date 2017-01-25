//
//  OKViewCatalog.h
//  OKViewCatalog
//
//  Created by Bill Heitzeg on 1/23/17.
//  Copyright © 2017 Bill Heitzeg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKViewCatalog : NSObject
-(NSArray* ) findViewDeclarationsInSourceFiles: (NSArray *) listOfViewClasses sourceFiles:(NSDictionary* )sourceFiles;
-(NSDictionary *) getSourceFilesFromXCodeDirectory:(NSString *) xcodeDirectory;
-(NSArray*) getListOfViewClasses;
-(BOOL) persistCatalog: (NSString *) path dictionary: (NSDictionary*) dictionary;
-(NSDictionary *) getPersistedCatalog: (NSString *) path ;
@end
