#import <Foundation/Foundation.h>
#import <LastFMAPI/GDataXMLNode.h>
#import <LastFMAPI/AMDataObjects.h>

@interface AMDataObject ()
-(id)initFromNode:(GDataXMLElement *)Node;
@end

@interface AMXMLTools : NSObject

+(NSString *)getTextValue:(NSString *)Child
                     Node:(GDataXMLElement *)Parent;

+(NSNumber *)getIntValue:(NSString *)Child
                    Node:(GDataXMLElement *)Parent;

+(NSString *)getTextValue:(GDataXMLElement *)Parent;

+(NSNumber *)getIntValue:(GDataXMLElement *)Parent;

+(NSString *)getTextAttribute:(NSString *)Attribute
                         Node:(GDataXMLElement *)Parent;

+(NSNumber *)getIntAttribute:(NSString *)Attribute
                        Node:(GDataXMLElement *)Parent;

+(NSDictionary *)getDictionaryFromParent:(GDataXMLElement *)Parent
                          TextAttributes:(NSArray *)TextAttributes
                           IntAttributes:(NSArray *)IntAttributes;

+(NSArray *)getDictionaryArrayFromParent:(GDataXMLElement *)Parent
                                     Key:(NSString *)Key
                          TextAttributes:(NSArray *)TextAttributes
                           IntAttributes:(NSArray *)IntAttributes;

+(NSArray *)getDictionaryArrayFromParent:(GDataXMLElement *)Parent
                                     Key:(NSString *)Key
                                  SubKey:(NSString *)SubKey
                          TextAttributes:(NSArray *)TextAttributes
                           IntAttributes:(NSArray *)IntAttributes;

+(GDataXMLElement *)getFirstChild:(GDataXMLElement *)Parent
                            Named:(NSString *)Name;

+(NSArray *)getChildren:(GDataXMLElement *)Parent
                  Named:(NSString *)Name;

+(void)enumerateNodes:(GDataXMLElement *)Node
                  Key:(NSString *)Key
                Block:(void (^)(GDataXMLElement *Element, BOOL *stop)) block;

@end