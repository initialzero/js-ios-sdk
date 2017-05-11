/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import <Foundation/Foundation.h>
#import "JSObjectMappingsProtocol.h"

@interface JSAdHocQueryGroupByExpansionMember : NSObject<JSObjectMappingsProtocol>

@property (nonatomic, assign) BOOL      expanded;
@property (nonatomic, strong) NSArray   *path;

@end
