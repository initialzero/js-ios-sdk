/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import "JSAdHocQueryWhereOperand.h"

@interface JSAdHocQueryWhereOperandOperation : JSAdHocQueryWhereOperand
@property (nonatomic, assign) BOOL paren;

+ (NSSet *)supportedOperations;

@end
