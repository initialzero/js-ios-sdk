/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import <Foundation/Foundation.h>
#import "JSObjectMappingsProtocol.h"
#import "JSAdHocQueryModel.h"
#import "JSAdHocQueryExecutionParameters.h"

@interface JSAdHocQueryExecutionRequest : NSObject <JSObjectMappingsProtocol>

@property (nonatomic, strong) NSString *dataSourceUri;
@property (nonatomic, strong) JSAdHocQueryExecutionParameters *params;

@property (nonatomic, strong, readonly) JSAdHocQueryModel *query;

@property (nonatomic, strong, readonly) NSString *contentType;
@property (nonatomic, strong, readonly) NSString *acceptType;

- (instancetype)initWithQuery:(JSAdHocQueryModel *)query;

@end
