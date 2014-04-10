//
//  QuestionViewController.m
//  CodeMania1
//
//  Created by BSA univ 1 on 18/03/14.
//  Copyright (c) 2014 hibrise. All rights reserved.
//

#import "QuestionViewController.h"
#import "answerViewController.h"

@interface QuestionViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation QuestionViewController

@synthesize plistobj,buttonsArray,qn,levelObj;
@synthesize answerViewController ;


//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    plistobj = [[PlistManager alloc]init];
    levelObj=[[LevelViewController alloc]init];
    
    buttonsArray=[plistobj AppPlistWeek:_qn1 :_qn2];
    
   // NSLog(@"fgfddzg%@",[buttonsArray description]);
    
    
      //buttonsArray = [plistobj AppPlistWeek:;
    
//  NSLog(@"Complexcity %@",levelObj.complixity);
//    NSLog(@"!!!buttonarray %@",buttonsArray);
//    int x =50;
//    int y=100;
//    for (int i=0; i<buttonsArray.count; i++)
//    {
//        
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        
//        [button addTarget:self
//                   action:@selector(aMethod:)
//         forControlEvents:UIControlEventTouchDown];
//         [button setTitle:@"Show View" forState:UIControlStateNormal];
//        [button setTitle:[buttonsArray objectAtIndex:i] forState:UIControlStateNormal];
//  button.frame = CGRectMake(x, y, 160.0, 40.0);
//        [self.view addSubview:button];
//        y = y +100;
//    }
//
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

//- (void)aMethod:(UIButton*)button
//{
//    qn = button.currentTitle;
//    NSLog(@"refsads%@",qn);
//    
//    NSLog(@"Button  clicked.");
//    _plobj = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"ViewViewController"];
//    
//    
//    [_plobj setQn:_qn1];
//    [_plobj setComplixity:_qn2];
//    [_plobj setCaste:qn];
//
//    
//    
//    
//    [self presentViewController:_plobj animated:NO completion:^void{}];
//
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [buttonsArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell1";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [buttonsArray objectAtIndex:indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//   _plobj.celltext= cell.textLabel.text;
    
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
  qn = [buttonsArray objectAtIndex:indexPath.row] ;
    _plobj = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"answerViewController"];
     [_plobj setQn:_qn1];
    [_plobj setComplixity:_qn2];
    [_plobj setCaste:qn];
    
    
       [self presentViewController:_plobj animated:NO completion:^void{}];
    
      
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButon:(id)sender {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}


@end
