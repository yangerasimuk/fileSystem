//
//  main.m
//  YGFileSystem
//
//  Created by Ян on 02/05/2017.
//  Copyright © 2017 Yan Gerasimuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YGDirectory.h"
#import "YGFileSystemEnumerator.h"
#import "YGSearchRule.h"
#import "YGSearchRuleByType.h"
#import "YGSearchRuleHasPrefix.h"
#import "YGSearchRuleNameMinLength.h"
#import "YGSearchRuleDirectoryContainsFileName.h"
#import "YGSearchRuleNameIsRegex.h"

/*
 #import "YGFileSystemObject.h"
 #import "YGFile.h"
 #import "YGDirectory.h"
 #import "YGFileSystemEnumerator.h"
 #import "YGSearchPattern.h"
 #import "YGSearchRule.h"
 #import "YGSearchRuleByType.h"
 #import "YGSearchRuleHasPrefix.h"
 #import "YGSearchRuleNameMinLength.h"
 #import "YGSearchRuleNameIsRegex.h"
 #import "YGSearchRuleDirectoryContainsFileName.h"
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *path = @"/Users/yanikng/Documents/dev/project/nevelsky.com/holmsk/_post";
        
        YGDirectory *dir = [[YGDirectory alloc] initWithPathFull:path];
        
        YGSearchRuleByType *rule1 = [[YGSearchRuleByType alloc] initWithFileSystemObjectType:YGFileSystemObjectTypeDirectory];
        
        YGSearchRuleHasPrefix *rule2 = [[YGSearchRuleHasPrefix alloc] initWithPrefix:@"." ruleType:YGSearchRuleTypeReverse];
        
        YGSearchRuleHasPrefix *rule3 = [[YGSearchRuleHasPrefix alloc] initWithPrefix:@"_" ruleType:YGSearchRuleTypeReverse];
        
        YGSearchRuleNameMinLength *rule4 = [[YGSearchRuleNameMinLength alloc] initWithNameMinLength:10];
        
        YGSearchRuleDirectoryContainsFileName *rule5 = [[YGSearchRuleDirectoryContainsFileName alloc] initWithSearchedFileName:@"content.html"];
        
        YGSearchRuleNameIsRegex *rule6 = [[YGSearchRuleNameIsRegex alloc] initWithPattern:@"^\\d{4}[-]\\d{2}[-]\\d{2}$"];
        
        NSArray <YGConfirmingRule>*rules = @[rule1, rule2, rule3, rule4, rule5, rule6];
        
        YGSearchPattern *pattern = [[YGSearchPattern alloc] initWithSearchRules:rules];
        
        YGFileSystemEnumerator *en = [[YGFileSystemEnumerator alloc] initWithDirectory:dir searchPattern:pattern];
        
        NSArray *objects = [en objects];
        
        printf("\n\nResult array:\n");
        for(YGFileSystemObject *obj in objects){
            //NSLog(@"%@", [obj description]);
            NSLog(@"%@", obj.name);
        }
        
        

    }
    return 0;
}
