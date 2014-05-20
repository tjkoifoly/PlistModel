//
//  ViewController.m
//  PlistModel
//
//  Created by Logan Wright on 5/1/14.
//  Copyright (c) 2014 Logan Wright. All rights reserved.
//

#import "ViewController.h"

#import "PlistModel.h"
#import "CustomModel.h"
#import "DynamicModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    BOOL save = NO;
    [DynamicModel plistNamed:@"DynamicModel" inBackgroundWithBlock:^(PlistModel *plistModel) {
        DynamicModel * dynamicModel = (DynamicModel *)plistModel;
        NSLog(@"DynamicModel.name = %@", dynamicModel.name);
        dynamicModel.name = @"A new name";
        NSLog(@"DynamicModel.name = %@", dynamicModel.name);
        dynamicModel.counter++;
        NSLog(@"Counter: %i", dynamicModel.counter);
        NSLog(@"DynamicModel: %@", dynamicModel);
        
        if (save) {
            [dynamicModel saveInBackgroundWithCompletion:^{
                NSLog(@"SAVED");
            }];
        }
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end



/*
 // Standard Info.Plist Model
 [PlistModel plistNamed:@"Info" inBackgroundWithBlock:^(PlistModel *plistModel) {
 NSLog(@"\n");
 NSLog(@"** Info.plist **");
 NSLog(@"Development Region: %@", plistModel.CFBundleDevelopmentRegion);
 NSLog(@"Version: %@", plistModel.CFBundleVersion);
 NSLog(@"Application requires iPhone environment? %@", plistModel.LSRequiresIPhoneOS ? @"YES" : @"NO");
 // Etc ... (see PlistModel.h for full list)
 NSLog(@"\n");
 }];
 
 // Custom Subclassed Model With Plist File Included In Xcode Project (bundled)
 [CustomModel plistNamed:@"CustomModel" inBackgroundWithBlock:^(PlistModel *plistModel) {
 
 // Get our custom model from return block
 CustomModel * customModel = (CustomModel *)plistModel;
 
 NSLog(@"\n");
 NSLog(@"** CustomModel.plist **");
 NSLog(@"CM:StringProperty: %@", customModel.StringPropertyKey);
 NSLog(@"CM:DateProperty: %@", customModel.DatePropertyKey);
 NSLog(@"CM:ArrayProperty: %@", customModel.ArrayPropertyKey);
 NSLog(@"CM:DictionaryProperty: %@", customModel.DictionaryPropertyKey);
 NSLog(@"CM:IntProperty: %i", customModel.IntPropertyKey);
 NSLog(@"CM:BoolProperty: %@", customModel.BoolPropertyKey ? @"YES" : @"NO");
 NSLog(@"CM:FloatProperty: %f", customModel.FloatPropertyKey);
 NSLog(@"\n");
 
 }];
 
 */
/*
 // Custom Subclassed Model With Plist Created Dynamically
 [CustomModel plistNamed:@"DynamicallyCreatedList" inBackgroundWithBlock:^(PlistModel *plistModel) {
 
 NSLog(@"Printing: Dynamic - CustomModel (1st run will be nil because it hasn't been created yet) \n\n");
 CustomModel * customModel = (CustomModel *)plistModel;
 NSLog(@"Dynamic - StringProperty: %@", customModel.StringPropertyKey);
 NSLog(@"Dynamic - DateProperty: %@", customModel.DatePropertyKey);
 NSLog(@"Dynamic - ArrayProperty: %@", customModel.ArrayPropertyKey);
 NSLog(@"Dynamic - DictionaryProperty: %@", customModel.DictionaryPropertyKey);
 NSLog(@"Dynamic - IntProperty: %i", customModel.IntPropertyKey);
 NSLog(@"Dynamic - BoolProperty: %@", customModel.BoolPropertyKey ? @"YES" : @"NO");
 NSLog(@"Dynamic - FloatProperty: %f", customModel.FloatPropertyKey);
 NSLog(@"\n");
 
 // CustomModel * customModel = (CustomModel *)plistModel;
 NSLog(@"CustomModel: %@", customModel);
 // Set our values
 customModel.StringPropertyKey = @"Hello Fancyish World!";
 customModel.DatePropertyKey = [NSDate date];
 customModel.ArrayPropertyKey = @[@"Object1", @"Object2"];
 customModel.DictionaryPropertyKey = @{@"Key1": @"Value1", @"Key2": @"Value2"};
 customModel.IntPropertyKey = 7654321;
 customModel.BoolPropertyKey = YES;
 customModel.FloatPropertyKey = 636.859497;
 
 
 customModel[@"secretKey"] = @"someSecret";
 //customModel[@"stringPropertyKey"] = @"blahblahblah";
 //customModel.StringPropertyKey = @"Some Other Hello World";
 
 NSLog(@"Is It Dirty? %@", customModel.isDirty ? @"YES" : @"NO");
 [customModel saveInBackgroundWithCompletion:^{
 NSLog(@"Is Dirty After? %@", customModel.isDirty ? @"YES" : @"NO");
 }];
 
 }];
 */

