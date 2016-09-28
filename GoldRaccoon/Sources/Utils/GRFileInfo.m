//
//  GRFileInfo.m
//  GoldRaccoon
//
//  Created by Nonthawat Srichad on 8/6/16.
//  Copyright © 2016 Alberto De Bortoli. All rights reserved.
//

#import "GRFileInfo.h"

@interface GRFileInfo ()

- (void)parseMetadata:(NSDictionary* )metadata;

@end

@implementation GRFileInfo

- (id)initWithDictionary:(NSDictionary *)metadata
{
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    [self parseMetadata:metadata];
    
    return self;
}

- (void)parseMetadata:(NSDictionary* )metadata
{
    NSString *name = [metadata objectForKey:(id)kCFFTPResourceName];
    
    if ([name canBeConvertedToEncoding:NSMacOSRomanStringEncoding]) {
        NSData *data = [name dataUsingEncoding:NSMacOSRomanStringEncoding allowLossyConversion:YES];
        self.name = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    } else {
        self.name = [metadata objectForKey:(id)kCFFTPResourceName];
    }
    
    self.modifiedDate = [metadata objectForKey:(id)kCFFTPResourceModDate];
    self.size = [metadata objectForKey:(id)kCFFTPResourceSize];
    NSNumber *type = [metadata objectForKey:(id)kCFFTPResourceType];
    self.isFolder = ([type intValue] == 4);
}

@end
