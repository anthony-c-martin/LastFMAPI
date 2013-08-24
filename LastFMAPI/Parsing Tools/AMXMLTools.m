#import <LastFMAPI/AMXMLTools.h>

@implementation AMXMLTools

+(NSString *)getTextValue:(NSString *)Child
                     Node:(GDataXMLElement *)Parent
{
    if (Parent)
    {
        GDataXMLElement *ChildElement = [self getFirstChild:Parent Named:Child];
        if (ChildElement)
        {
            return [self getTextValue:ChildElement];
        }
    }
    return nil;
}

+(NSNumber *)getIntValue:(NSString *)Child
                    Node:(GDataXMLElement *)Parent
{
    if (Parent)
    {
        GDataXMLElement *ChildElement = [self getFirstChild:Parent Named:Child];
        if (ChildElement)
        {
            return [self getIntValue:ChildElement];
        }
    }
    return nil;
}

+(NSString *)getTextValue:(GDataXMLElement *)Parent
{
    if (Parent)
    {
        return [[NSString alloc] initWithString:[Parent stringValue]];
    }
    return nil;
}

+(NSNumber *)getIntValue:(GDataXMLElement *)Parent
{
    if (Parent)
    {
        return [[NSNumber alloc] initWithInt:[[Parent stringValue] intValue]];
    }
    return nil;
}

+(GDataXMLElement *)getFirstChild:(GDataXMLElement *)Parent
                            Named:(NSString *)Name
{
    return (GDataXMLElement*)[[self getChildren:Parent Named:Name] objectAtIndex:0];
}

+(NSArray *)getChildren:(GDataXMLElement *)Parent
                  Named:(NSString *)Name
{
    return [Parent elementsForName:Name];
}

+(NSString *)getTextAttribute:(NSString *)Attribute Node:(GDataXMLElement *)Parent
{
    if (Parent)
    {
        NSString *Value = [(GDataXMLElement *) [Parent attributeForName:Attribute] stringValue];
        if (Value)
        {
            return [[NSString alloc] initWithString:Value];
        }
    }
    return nil;
}

+(NSNumber *)getIntAttribute:(NSString *)Attribute Node:(GDataXMLElement *)Parent
{
    if (Parent)
    {
        NSString *Value = [(GDataXMLElement *) [Parent attributeForName:Attribute] stringValue];
        if (Value)
        {
            return [[NSNumber alloc] initWithInt:[Value intValue]];
        }
    }
    return nil;
}

+(NSDictionary *)getDictionaryFromParent:(GDataXMLElement *)Parent
                          TextAttributes:(NSArray *)TextAttributes
                           IntAttributes:(NSArray *)IntAttributes
{
    if (Parent)
    {
        NSMutableDictionary *Dictionary = [[NSMutableDictionary alloc] init];
        
        if (TextAttributes)
        {
            [TextAttributes enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop)
             {
                 NSString *foundValue = [self getTextValue:(NSString *)key Node:Parent];
                 [Dictionary setObject:foundValue forKey:(NSString *)key];
             }];
        }
        
        if (IntAttributes)
        {
            [IntAttributes enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop)
             {
                 NSNumber *foundValue = [self getIntValue:(NSString *)key Node:Parent];
                 [Dictionary setObject:foundValue forKey:(NSString *)key];
             }];
        }
        
        return (NSDictionary *)Dictionary;
    }
    return nil;
}

+(NSArray *)getDictionaryArrayFromParent:(GDataXMLElement *)Parent
                                     Key:(NSString *)Key
                          TextAttributes:(NSArray *)TextAttributes
                           IntAttributes:(NSArray *)IntAttributes
{
    NSMutableArray *Array = [[NSMutableArray alloc] init];
    if (Parent)
    {
        [self enumerateNodes:Parent Key:Key Block:^(GDataXMLElement *Element, BOOL *stop)
         {
             NSDictionary *Dictionary = [self getDictionaryFromParent:Element TextAttributes:TextAttributes IntAttributes:IntAttributes];
             if (Dictionary)
             {
                 [Array addObject:Dictionary];
             }
         }];
        return (NSArray *)Array;
    }
    return nil;
}

+(NSArray *)getDictionaryArrayFromParent:(GDataXMLElement *)Parent
                                     Key:(NSString *)Key
                                  SubKey:(NSString *)SubKey
                          TextAttributes:(NSArray *)TextAttributes
                           IntAttributes:(NSArray *)IntAttributes
{
    NSMutableArray *Array = [[NSMutableArray alloc] init];
    if (Parent)
    {
        [self enumerateNodes:Parent Key:Key Block:^(GDataXMLElement *Element, BOOL *stop)
        {
            GDataXMLElement *ChildNode = [self getFirstChild:Element Named:SubKey];
            NSDictionary *Dictionary = [self getDictionaryFromParent:ChildNode TextAttributes:TextAttributes IntAttributes:IntAttributes];
            if (Dictionary)
            {
                [Array addObject:Dictionary];
            }
        }];
        return (NSArray *)Array;
    }
    return nil;
}

+(void)enumerateNodes:(GDataXMLElement *)Node
                  Key:(NSString *)Key
                Block:(void (^)(GDataXMLElement *Element, BOOL *stop)) block;
{
    if (Node)
    {
        NSArray *ChildNodes = [self getChildren:Node Named:Key];
        BOOL stop = NO;
        for (NSUInteger i = 0; i < ChildNodes.count && !stop; i++)
        {
            block((GDataXMLElement *)[ChildNodes objectAtIndex:i], &stop);
        }
    }
}

@end