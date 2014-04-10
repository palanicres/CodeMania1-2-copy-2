//
//  answerViewController.h
//  CodeMania1
//
//  Created by BSA univ 1 on 29/03/14.
//  Copyright (c) 2014 hibrise. All rights reserved.
//
#import "PlistManager.h"
#import "ViewController.h"
#import "QuestionViewController.h"
@class PlistManager;
@class answerViewController;
@class LevelViewController;
@class QuestionViewController;


@interface answerViewController : UIViewController
{
    IBOutlet UILabel * label1;
    IBOutlet UILabel * label2;
    NSString * selectedItem;
    BOOL checking;
}
@property (nonatomic, retain) IBOutlet UILabel *label1;

@property (nonatomic,retain) IBOutlet UILabel *label2;
@property LevelViewController *levelObj;


@property (nonatomic, copy) NSString *selectedItem;

@property (nonatomic,strong) NSString *qn;
@property (nonatomic,strong) NSString *a;
@property (nonatomic,strong) NSString *qn1;
@property (nonatomic,strong) NSString *qn2;
@property (nonatomic,strong) NSString *complixity;
@property (nonatomic,strong) NSString *caste;
@property (nonatomic,strong) PlistManager *plistobj;
@property (nonatomic,strong)NSArray *buttonsArray;
@property (nonatomic, retain) NSArray *rootOfPlist;
@property (nonatomic, retain) NSString *celltext;


@end
