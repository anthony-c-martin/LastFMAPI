#import <LastFMAPI/AMXMLTools.h>

@implementation AMXMLTools

+(NSString *)getTextValue:(NSString *)Child Node:(TBXMLElement *)Parent
{
    if (Parent)
    {
        TBXMLElement *ChildElement = [TBXML childElementNamed:Child parentElement:Parent];
        if (ChildElement)
        {
            return [[NSString alloc] initWithString:[TBXML textForElement:ChildElement]];
        }
    }
    return nil;
}

+(NSNumber *)getIntValue:(NSString *)Child Node:(TBXMLElement *)Parent
{
    if (Parent)
    {
        TBXMLElement *ChildElement = [TBXML childElementNamed:Child parentElement:Parent];
        if (ChildElement)
        {
            return [[NSNumber alloc] initWithInt:[[TBXML textForElement:ChildElement] intValue]];
        }
    }
    return nil;
}

+(NSString *)getTextAttribute:(NSString *)Attribute Node:(TBXMLElement *)Parent
{
    if (Parent)
    {
        NSString *Value = [TBXML valueOfAttributeNamed:Attribute forElement:Parent];
        if (Value)
        {
            return [[NSString alloc] initWithString:Value];
        }
    }
    return nil;
}

+(NSNumber *)getIntAttribute:(NSString *)Attribute Node:(TBXMLElement *)Parent
{
    if (Parent)
    {
        NSString *Value = [TBXML valueOfAttributeNamed:Attribute forElement:Parent];
        if (Value)
        {
            return [[NSNumber alloc] initWithInt:[Value intValue]];
        }
    }
    return nil;
}

+(NSDictionary *)getDictionaryFromParent:(TBXMLElement *)Parent
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

+(NSArray *)getDictionaryArrayFromParent:(TBXMLElement *)Parent
                                     Key:(NSString *)Key
                          TextAttributes:(NSArray *)TextAttributes
                           IntAttributes:(NSArray *)IntAttributes
{
    NSMutableArray *Array = [[NSMutableArray alloc] init];
    if (Parent)
    {
        [self enumerateNodes:Parent Key:Key Block:^(TBXMLElement *Element, BOOL *stop)
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

+(NSArray *)getDictionaryArrayFromParent:(TBXMLElement *)Parent
                                     Key:(NSString *)Key
                                  SubKey:(NSString *)SubKey
                          TextAttributes:(NSArray *)TextAttributes
                           IntAttributes:(NSArray *)IntAttributes
{
    NSMutableArray *Array = [[NSMutableArray alloc] init];
    if (Parent)
    {
        [self enumerateNodes:Parent Key:Key Block:^(TBXMLElement *Element, BOOL *stop)
        {
            TBXMLElement *ChildNode = [TBXML childElementNamed:SubKey parentElement:Element];
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

+(void)enumerateNodes:(TBXMLElement *)Node
                  Key:(NSString *)Key
                Block:(void (^)(TBXMLElement *Element, BOOL *stop)) block;
{
    if (Node)
    {
        TBXMLElement *ChildNode = [TBXML childElementNamed:Key parentElement:Node];
        while (ChildNode)
        {
            BOOL stop = NO;
            block(ChildNode, &stop);
            if (stop)
            {
                break;
            }
            ChildNode = [TBXML nextSiblingNamed:Key searchFromElement:ChildNode];
        }
    }
}

@end