/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import <Foundation/Foundation.h>
#import "JSResourceLookup.h"
#import "JSObjectMappingsProtocol.h"
#import "JSAdHocQueryModel.h"

@interface JSAdhocDataViewMetadata : JSResourceLookup <JSObjectMappingsProtocol>
@property (nonatomic, strong) NSString *dataSourceReference;
@property (nonatomic, strong) JSAdHocQueryModel *query;

@end
