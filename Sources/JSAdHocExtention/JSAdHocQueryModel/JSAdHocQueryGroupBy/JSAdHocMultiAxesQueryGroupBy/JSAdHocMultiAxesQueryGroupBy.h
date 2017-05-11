/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import <Foundation/Foundation.h>
#import "JSAdHocQueryGroupBy.h"
#import "JSAdHocQueryGroupByConditions.h"

@interface JSAdHocMultiAxesQueryGroupBy : JSAdHocQueryGroupBy

@property (nonatomic, strong) JSAdHocQueryGroupByConditions *rowsConditions;
@property (nonatomic, strong) JSAdHocQueryGroupByConditions *columnsConditions;

@end
