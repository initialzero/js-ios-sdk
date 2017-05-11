/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import <Foundation/Foundation.h>
#import "JSObjectMappingsProtocol.h"

@interface JSAdHocQuerySelectField : NSObject <JSObjectMappingsProtocol>

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *fieldID;
@property (nonatomic, strong) NSString *fieldName;
@property (nonatomic, strong) NSString *format;

@end
