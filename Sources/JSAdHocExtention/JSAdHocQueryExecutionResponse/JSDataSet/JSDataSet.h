/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import <Foundation/Foundation.h>
#import "JSObjectMappingsProtocol.h"
#import "JSAdHocQueryExecutionParameters.h"

@interface JSDataSet : NSObject <JSObjectMappingsProtocol>
@property (nonatomic, assign) NSInteger counts;

+ (EKObjectMapping *)objectMappingForServerProfile:(JSProfile *)serverProfile fields:(NSArray <NSString *> *)fields;

@end
