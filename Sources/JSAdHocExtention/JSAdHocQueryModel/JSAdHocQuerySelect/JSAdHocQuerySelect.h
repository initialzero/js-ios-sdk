/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import <Foundation/Foundation.h>
#import "JSAdHocQuerySelectField.h"
#import "JSAdHocQueryAggregation.h"
#import "JSObjectMappingsProtocol.h"

@interface JSAdHocQuerySelect : NSObject <JSObjectMappingsProtocol>

@property (nonatomic, strong) NSArray <JSAdHocQuerySelectField *>*fields;
@property (nonatomic, strong) NSArray <JSAdHocQueryAggregation *>*aggregations;

@end
