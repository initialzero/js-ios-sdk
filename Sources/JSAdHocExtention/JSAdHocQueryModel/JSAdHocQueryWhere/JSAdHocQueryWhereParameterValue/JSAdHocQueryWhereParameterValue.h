/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import <Foundation/Foundation.h>
#import "JSObjectMappingsProtocol.h"

@interface JSAdHocQueryWhereParameterValue : NSObject <JSObjectMappingsProtocol>

@property (nonatomic, strong) NSString *type;

+ (EKObjectMapping *)objectMappingForServerProfile:(JSProfile *)serverProfile type:(NSString *)type;

@end

