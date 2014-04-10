//
//  ViewViewController.m
//  CodeMania1
//
//  Created by BSA univ 1 on 18/03/14.
//  Copyright (c) 2014 hibrise. All rights res/Users/BSAUniv3/Desktop/CodeMania1 2 copy/CodeMania1/ViewViewController.herved.
//

#import "ViewViewController.h"

@interface ViewViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewViewController

@synthesize qn,complixity,caste,buttonsArray,rootOfPlist,celltext,check;

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
    //checking=NO;
    _plistobj = [[PlistManager alloc]init];
    
    NSLog(@"question %@",qn);
     NSLog(@"complixity %@",complixity);
    NSLog(@"level %@",caste);
    
    buttonsArray=[_plistobj AppPlistWeekone:qn:complixity:caste];
   
    NSLog(@"%@",[buttonsArray description]);
    [super viewDidLoad];
    checking=NO;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return [buttonsArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    
    cell.textLabel.text = [buttonsArray objectAtIndex:indexPath.row];
    NSLog(@"in table view cell for row at index");
    
 UITableViewCell*celll = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (celll==nil)
    {
        [[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil];
        NSLog(@"start");
        cell=cell;
        NSLog(@"end");
    }
    //check if cell is already selected or not
    // if not selected, tag will be positive
    celll.imageView.tag = indexPath.row;
    // if selected, tag will be negative
    celll.imageView.tag = -indexPath.row;
    
    // your customization
    return cell;
    return celll;
}
- (IBAction)backButon:(id)sender {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction)checkaction:(id)sender {
    if (!checking) {
        [check setImage:[UIImage imageNamed:@"checkmark.jpg"] forState:UIControlStateNormal];
        checking=YES;
    }
    else if(checking)
    {
        [check setImage:[UIImage imageNamed:@"check.jpg"] forState:UIControlStateNormal];
        checking=NO;

    }
    UIButton * btn = (UIButton*)sender;
    int selected_index = btn.tag;    // This is your index of selected cell
    
    
    //btn is the same btn image of which you need to change/toggle
    if(btn.tag > 0)     //its not selected
    {
        //set btn image as selected
        btn.tag = -(btn.tag);
      //  [btn setImage: forState:UIControlStateNormal];
    }
    else if(btn.tag < 0)     //its selected
    {
        //set btn image as unselected
        btn.tag = -(btn.tag);
     //   [btn setImage: forState:UIControlStateNormal];
    }
    NSLog(@"check box button pressed");
}
@end
