#import <Foundation/Foundation.h>
#import <LastFMAPI/TBXML.h>

@interface AMXMLTools : NSObject

+(NSString *)getTextValue:(NSString *)Child
                     Node:(TBXMLElement *)Parent;

+(NSNumber *)getIntValue:(NSString *)Child
                    Node:(TBXMLElement *)Parent;

+(NSString *)getTextAttribute:(NSString *)Attribute
                         Node:(TBXMLElement *)Parent;

+(NSNumber *)getIntAttribute:(NSString *)Attribute
                        Node:(TBXMLElement *)Parent;

+(NSDictionary *)getDictionaryFromParent:(TBXMLElement *)Parent
                          TextAttributes:(NSArray *)TextAttributes
                           IntAttributes:(NSArray *)IntAttributes;

+(NSArray *)getDictionaryArrayFromParent:(TBXMLElement *)Parent
                                     Key:(NSString *)Key
                          TextAttributes:(NSArray *)TextAttributes
                           IntAttributes:(NSArray *)IntAttributes;

+(NSArray *)getDictionaryArrayFromParent:(TBXMLElement *)Parent
                                     Key:(NSString *)Key
                                  SubKey:(NSString *)SubKey
                          TextAttributes:(NSArray *)TextAttributes
                           IntAttributes:(NSArray *)IntAttributes;

+(void)enumerateNodes:(TBXMLElement *)Node
                  Key:(NSString *)Key
                Block:(void (^)(TBXMLElement *Element, BOOL *stop)) block;

@end