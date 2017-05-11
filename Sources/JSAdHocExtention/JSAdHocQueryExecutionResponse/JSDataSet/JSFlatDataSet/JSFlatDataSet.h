/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import "JSDataSet.h"
@class JSFlatDataSetField, JSFlatDataSetRow;

@interface JSFlatDataSet : JSDataSet

@property (nonatomic, strong) NSArray <JSFlatDataSetField *> *fields;

@property (nonatomic, strong) NSArray <JSFlatDataSetRow *> *rows;

@end
