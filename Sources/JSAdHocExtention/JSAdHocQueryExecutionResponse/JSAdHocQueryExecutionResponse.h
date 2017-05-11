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
#import "JSDataSet.h"

@interface JSAdHocQueryExecutionResponse : NSObject <JSObjectMappingsProtocol>

@property (nonatomic, strong) JSAdHocQueryExecutionParameters *params;
@property (nonatomic, strong) JSDataSet *dataSet;
@property (nonatomic, assign) NSInteger totalCounts;
@property (nonatomic, assign) BOOL truncated;

@end
