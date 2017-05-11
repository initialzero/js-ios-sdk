/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import <Foundation/Foundation.h>
#import "JSObjectMappingsProtocol.h"

@interface JSAdHocQueryOrderByLevel : NSObject <JSObjectMappingsProtocol>

@property (nonatomic, strong) NSString *fieldRef;
@property (nonatomic, assign) BOOL ascending;

@end
