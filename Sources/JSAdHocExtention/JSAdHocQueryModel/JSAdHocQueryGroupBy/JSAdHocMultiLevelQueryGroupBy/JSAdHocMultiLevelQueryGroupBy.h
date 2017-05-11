/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import <Foundation/Foundation.h>
#import "JSAdHocQueryGroupBy.h"

@interface JSAdHocMultiLevelQueryGroupBy : JSAdHocQueryGroupBy

@property (nonatomic, strong) NSArray *groupsConditions;

@end
