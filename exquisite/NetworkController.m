//
//  NetworkController.m
//  exquisite
//
//  Created by drwizzard on 2/23/15.
//  Copyright (c) 2015 nacnud. All rights reserved.
//

#import "NetworkController.h"
#import "Story.h"

@implementation NetworkController


+(id)sharedService {
    static NetworkController *theSharedService;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        theSharedService = [[NetworkController alloc] init];
    });
    return theSharedService;
}



-(void)createNewAccountWithUserName:(NSString *) username password:(NSString *)passwd{
    NSLog(@"i made a fake token");
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *token = @"thisTokenIsATempForTest";
    [userDefaults setObject:token forKey:@"token"];
    [userDefaults synchronize];
}


-(void)fetchStoryWithCompletionHandler: (void (^)(NSDictionary *results, NSString *error)) completionHandler {
    
    // using json file for testing until we have working endpoints on the rest api
    NSString *pathToJson = [[NSBundle mainBundle] pathForResource:@"PretendStory" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:pathToJson];
    NSError *parseError;
    NSDictionary *storyDictionary = [ NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
    if (parseError) {
        NSLog(@"there was an error parsing the json story dictionary");
    } else {
        NSLog(@"story descriotion %@",storyDictionary.description);
//      Story *wat = [[Story alloc]  initWithJSONData:storyDictionary];

        completionHandler(storyDictionary, nil);
    }
}



-(void)fetchStoryWithIdentifier:(NSString * )storyID withCompletionHandler: (void (^)(NSDictionary *results, NSString *error)) completionHandler {
    
    // using json file for testing until we have working endpoints on the rest api
    NSString *pathToJson = [[NSBundle mainBundle] pathForResource:@"PretendStory" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:pathToJson];
    NSError *parseError;
    NSDictionary *storyDictionary = [ NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
    if (parseError) {
        NSLog(@"there was an error parsing the json story dictionary");
    } else {
        NSLog(@"story descriotion %@",storyDictionary.description);
        //      Story *wat = [[Story alloc]  initWithJSONData:storyDictionary];
        
        completionHandler(storyDictionary, nil);
    }
}

-(void)fetchTimelineForUser:(User *)currentUser withCompletionHandler:(void (^)(NSDictionary *results, NSString *error)) completionHandler {
  
  // using json file for testing until we have working endpoints on the rest api
  NSString *pathToJson = [[NSBundle mainBundle] pathForResource:@"PretendProfile" ofType:@"json"];
  NSData *data = [NSData dataWithContentsOfFile:pathToJson];
  NSError *parseError;
  NSDictionary *storyDictionary = [ NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
  if (parseError) {
    NSLog(@"there was an error parsing the json user Timeline dictionary");
  } else {
    NSLog(@"story descriotion %@",storyDictionary.description);
    //      Story *wat = [[Story alloc]  initWithJSONData:storyDictionary];
    
    completionHandler(storyDictionary, nil);
  }
}

-(void)fetchStoriesForBrowserWithCompletionHandler: (void (^)(NSArray *results, NSString *error)) completionHandler {
  
  // using json file for testing until we have working endpoints on the rest api
  NSString *pathToJson = [[NSBundle mainBundle] pathForResource:@"PretendStoryBrowers" ofType:@"json"];
  NSData *data = [NSData dataWithContentsOfFile:pathToJson];
  NSError *parseError;
  
  NSArray *storiesArray = [ NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
  if (parseError) {
    NSLog(@"There was an error parsing the Story Browser dictionary");
  } else {
    NSLog(@"story descriotion: %@",storiesArray.description);
    //      Story *wat = [[Story alloc]  initWithJSONData:storyDictionary];
    
    
    completionHandler(storiesArray, nil);
  }
}

@end
