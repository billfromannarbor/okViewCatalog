//
//  OKViewCatalog.h
//  OKViewCatalog
//
//  Created by Bill Heitzeg on 1/23/17.
//  Copyright © 2017 Bill Heitzeg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKViewCatalog : NSObject
-(NSDictionary *) getAListOfAllClassImplementationFilesInXCodeDirectory: (NSString *) xcodeDirectory;
-(BOOL) writeDictionary: (NSString *) path dictionary: (NSDictionary*) dictionary;
-(NSArray* ) findObjectDeclarations: (NSDictionary *) classList classFiles:(NSDictionary* )classFiles;
-(NSArray*) getAListOfAllUIViewClasses;
@end
