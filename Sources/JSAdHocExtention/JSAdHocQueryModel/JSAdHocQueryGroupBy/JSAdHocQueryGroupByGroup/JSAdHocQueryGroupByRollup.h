/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import <Foundation/Foundation.h>
#import "JSObjectMappingsProtocol.h"
#import "JSAdHocQueryGroupByGroup.h"

@interface JSAdHocQueryGroupByRollup : NSObject<JSObjectMappingsProtocol>

@property (nonatomic, strong) NSArray <JSAdHocQueryGroupByGroup *> *groups;

@end
