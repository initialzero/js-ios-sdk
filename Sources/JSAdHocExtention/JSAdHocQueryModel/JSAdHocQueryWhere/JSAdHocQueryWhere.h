/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import <Foundation/Foundation.h>
#import "JSObjectMappingsProtocol.h"
#import "JSAdHocQueryWhereParameter.h"
#import "JSAdHocQueryWhereOperandFunction.h"
#import "JSAdHocQueryWhereOperandOperation.h"

@interface JSAdHocQueryWhere : NSObject <JSObjectMappingsProtocol>

@property (nonatomic, strong) NSString *filterExpression;

@property (nonatomic, strong) JSAdHocQueryWhereOperand *mainOperand;
@property (nonatomic, strong) NSArray <JSAdHocQueryWhereParameter *> *parameters;

@end
