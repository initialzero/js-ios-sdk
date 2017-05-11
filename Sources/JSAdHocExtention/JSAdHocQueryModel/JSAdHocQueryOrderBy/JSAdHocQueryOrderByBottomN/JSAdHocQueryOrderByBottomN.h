/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import <Foundation/Foundation.h>
#import "JSObjectMappingsProtocol.h"

@interface JSAdHocQueryOrderByBottomN : NSObject <JSObjectMappingsProtocol>

@property (nonatomic, assign) NSInteger limit;
@property (nonatomic, assign) BOOL limitAllLevels;
@property (nonatomic, assign) BOOL createOtherBucket;
@property (nonatomic, strong) NSArray *path;

@end
