//
//  MasterViewController.m
//  PulseDemoApp
//
//  Created by crnorman on 2/7/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "NavigationObject.h"
#import "InventoryViewController.h"
#import "DetailViewController.h"
#import "DepartmentViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    //self.clearsSelectionOnViewWillAppear = NO;
    self.preferredContentSize = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //creating nav array
    _objects = [[NSMutableArray alloc] init];
    
    /*NavigationObject *navItem = [[NavigationObject alloc] init];
    navItem.name = @"Search";
    navItem.icon = @"Search";
    navItem.action = 0;
    
    [_objects addObject:navItem];*/

    NavigationObject *navItem = [[NavigationObject alloc] init];
    navItem.name = @"Inventory";
    navItem.icon = @"Inventory";
    navItem.action = 1;
    
    [_objects addObject:navItem];
    
    navItem = [[NavigationObject alloc] init];
    navItem.name = @"Style Guide";
    navItem.icon = @"Customers";
    navItem.action = 2;
    
    [_objects addObject:navItem];
    
    navItem = [[NavigationObject alloc] init];
    navItem.name = @"Client List";
    navItem.icon = @"Barcode";
    navItem.action = 3;
    
    [_objects addObject:navItem];
    
    navItem = [[NavigationObject alloc] init];
    navItem.name = @"Check Out";
    navItem.icon = @"Barcode";
    navItem.action = 4;
    
    [_objects addObject:navItem];
    
    navItem = [[NavigationObject alloc] init];
    navItem.name = @"Scan Barcode";
    navItem.icon = @"Barcode";
    navItem.action = 4;
    
    [_objects addObject:navItem];
    
    // Do any additional setup after loading the view, typically from a nib.
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NavigationObject *currentNavItem = _objects[indexPath.row];
    cell.textLabel.text = [currentNavItem name];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NavigationObject *object = _objects[indexPath.row];
    [self drillToPage:object.action];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *vc = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NavigationObject *object = _objects[indexPath.row];
}

- (BOOL)splitViewController:(UISplitViewController*)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation
{
    return YES;
}

#pragma mark - UISearchBarDelegate

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [searchBar resignFirstResponder];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:NO animated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    NSLog(@"Search started");
    [self drillToPage:0];
}

-(void)drillToPage:(int)pageId
{
    switch (pageId) {
        case 0:
        case 1:
        case 2:
        default:
        {
            NSLog(@"User tapped nav item 1");
            DepartmentViewController *departmentVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Main"];
            [self.detailViewController.navigationController pushViewController:departmentVC animated:YES];
            //todo: hide flyout
        }
        break;
    }
}

@end
