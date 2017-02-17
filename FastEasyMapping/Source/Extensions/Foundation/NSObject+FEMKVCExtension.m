// For License please refer to LICENSE file in the root of FastEasyMapping project

#import "NSObject+FEMKVCExtension.h"

@implementation NSObject (FEMKVCExtension)

- (void)fem_setValueIfDifferent:(id)value forKey:(NSString *)key {
    id _value = [self valueForKey:key];
    
    if (_value != value && ![_value isEqual:value]) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            value = [NSKeyedArchiver archivedDataWithRootObject:value];
            if (value) {
                [self setValue:value forKey:key];
            }
        }
        else {
            [self setValue:value forKey:key];
        }
    }
}

@end
