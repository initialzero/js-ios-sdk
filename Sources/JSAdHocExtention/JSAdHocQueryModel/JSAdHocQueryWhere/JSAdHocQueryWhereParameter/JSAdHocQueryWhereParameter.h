/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import <Foundation/Foundation.h>
#import "JSAdHocQueryWhereParameterValue.h"

@interface JSAdHocQueryWhereParameter : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) JSAdHocQueryWhereParameterValue *parameterValue;

+ (EKObjectMapping *)objectMappingForServerProfile:(JSProfile *)serverProfile type:(NSString *)type;

@end
