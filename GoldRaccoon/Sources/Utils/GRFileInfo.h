//
//  GRFileInfo.h
//  GoldRaccoon
//
//  Created by Nonthawat Srichad on 8/6/16.
//  Copyright © 2016 Alberto De Bortoli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GRFileInfo : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *modifiedDate;
@property (strong, nonatomic) NSNumber* size;
@property (assign, nonatomic) BOOL isFolder;

- (id)initWithDictionary:(NSDictionary *)metadata;

@end
