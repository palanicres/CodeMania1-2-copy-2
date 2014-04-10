//
//  answerViewController.m
//  CodeMania1
//
//  Created by BSA univ 1 on 29/03/14.
//  Copyright (c) 2014 hibrise. All rights reserved.
//

#import "answerViewController.h"
#import "QuestionViewController.h"

@interface answerViewController ()
{
    BOOL check;
    
}
@end

@implementation answerViewController
@synthesize plistobj,qn,complixity,caste,buttonsArray,selectedItem,label1,label2;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
//    NSDictionary *details = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"]];
//    details = [details objectForKey:self.selectedItem];
//    self.label1.text = [details objectForKey:@"label1"];
    plistobj = [[PlistManager alloc]init];
    
    NSLog(@"question %@",qn);
    NSLog(@"complixity %@",complixity);
    NSLog(@"level %@",caste);
    buttonsArray=[[NSMutableArray alloc]init];
    buttonsArray=[plistobj AppPlistWeekone:qn:complixity:caste];
    check=NO;
    NSLog(@"%@",[buttonsArray description]);
    [super viewDidLoad];
   
//    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"];
//    buttonsArray = [NSArray arrayWithContentsOfFile:plistPath];
    NSString * buttonsarray1 = [self buttonsArray];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:buttonsarray1 ])
    {
        NSArray * array = [[NSArray alloc] initWithContentsOfFile:buttonsarray1 ];
        NSLog(@"file found : %i",[array count]);
        label1.text = [array objectAtIndex:0];
        label2.text = [array objectAtIndex:1];
    }
    
}
//-(NSString *)dataFilePath{
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"];
//    return filePath;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButon:(id)sender {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
