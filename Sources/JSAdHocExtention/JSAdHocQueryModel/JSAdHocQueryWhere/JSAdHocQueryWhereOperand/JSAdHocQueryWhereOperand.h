/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import <Foundation/Foundation.h>
#import "JSObjectMappingsProtocol.h"

@interface JSAdHocQueryWhereOperand : NSObject <JSObjectMappingsProtocol>

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSArray *operands;

+ (EKObjectMapping *)objectMappingForServerProfile:(JSProfile *)serverProfile operandType:(NSString *)operandType;

@end
