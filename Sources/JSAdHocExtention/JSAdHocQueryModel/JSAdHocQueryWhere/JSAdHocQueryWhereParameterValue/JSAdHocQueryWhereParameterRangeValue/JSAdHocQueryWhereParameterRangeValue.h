/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import "JSAdHocQueryWhereParameterValue.h"

@interface JSAdHocQueryWhereParameterRangeValue : JSAdHocQueryWhereParameterValue

@property (nonatomic, strong) JSAdHocQueryWhereParameterValue *startValue;

@property (nonatomic, strong) JSAdHocQueryWhereParameterValue *endValue;

@end
