/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import "JSAdHocQueryGroupByAllGroup.h"

@interface JSAdHocQueryGroupByGroup : JSAdHocQueryGroupByAllGroup

@property (nonatomic, strong) NSString *groupID;
@property (nonatomic, strong) NSString *categorizer;
@property (nonatomic, assign) BOOL      includeAll;
@property (nonatomic, assign) BOOL      rollup;
@property (nonatomic, strong) NSString *field;

@end
