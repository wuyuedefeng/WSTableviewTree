//
//  ViewController.h
//  WSTableView
//
//  Created by Sakkaras on 26/12/13.
//  Copyright (c) 2013 Sakkaras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSTableView.h"

@interface ViewController : UIViewController <WSTableViewDelegate>

@property (nonatomic, weak) IBOutlet WSTableView *tableView;

@end
