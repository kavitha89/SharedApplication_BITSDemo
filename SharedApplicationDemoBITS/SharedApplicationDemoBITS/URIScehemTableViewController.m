//
//  URIScehemTableViewController.m
//  SharedApplicationDemoBITS
//
//  Created by kavitha on 25/11/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import "URIScehemTableViewController.h"

@interface URIScehemTableViewController ()

@end

@implementation URIScehemTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataDict.allKeys.count;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"uriCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.dataDict objectForKey:[[self.dataDict allKeys] objectAtIndex:indexPath.row]]];
    return cell;
}


-(void)readDataByURIScheme:(NSURL*)url
{
    NSLog(@"url absoluteString: %@", [url absoluteString]);
    NSLog(@"url relativeString: %@", [url relativeString]);
    /*NSLog(@"url baseURL: %@", [url baseURL]);*/
    NSLog(@"url absoluteURL: %@", [url absoluteURL]);
    
    NSString *text = [[url absoluteString] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"text = %@ ",text);
    
    NSString *newText = [text stringByReplacingOccurrencesOfString:@"sharedapp://" withString:@""];
    
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:[newText dataUsingEncoding:NSUTF8StringEncoding]
                                                               options:0 error:NULL];
    NSLog(@"jsonObject=%@", jsonObject);
    
    self.dataDict = jsonObject;


}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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