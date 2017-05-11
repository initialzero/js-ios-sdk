/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import <Foundation/Foundation.h>
#import "JSObjectMappingsProtocol.h"

@interface JSAdHocQueryGroupByExpansionLevel : NSObject<JSObjectMappingsProtocol>

@property (nonatomic, assign) BOOL      expanded;
@property (nonatomic, assign) BOOL      aggregation;
@property (nonatomic, strong) NSString *fieldRef;

@end
