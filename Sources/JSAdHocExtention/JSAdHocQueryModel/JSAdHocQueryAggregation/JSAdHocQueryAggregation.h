/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import <Foundation/Foundation.h>
#import "JSObjectMappingsProtocol.h"

@interface JSAdHocQueryAggregation : NSObject <JSObjectMappingsProtocol>

@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSString *aggregationID;
@property (nonatomic, strong) NSString *functionName;
@property (nonatomic, strong) id expression;
@property (nonatomic, strong) id measure;
@property (nonatomic, strong) id aggregateExpressionObject;
@property (nonatomic, strong) NSString *fieldRef;

@end
