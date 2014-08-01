//
//  TableViewController.m
//  TableEditting
//
//  Created by Paul Wilson on 7/25/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "TableViewController.h"
#import "MyCell.h"

@interface TableViewController ()

@end

@implementation TableViewController{
    int sectionToAdd;
}
@synthesize info, sectionNames;
@synthesize expandedSections;
@synthesize sectionOneCollapsed, sectionTwoCollapsed;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    info = [[NSMutableArray alloc]initWithObjects:@"One", @"Two", @"Three", @"Four", @"Five", nil];
    sectionNames = [[NSMutableArray alloc] initWithObjects:@"Section 1", @"Section 2", nil];
    self.navigationItem.title = @"Table Editting";
    
    //bool customerIsCollapsed = NO;
    //bool siteIsCollapsed = NO;
    
    sectionOneCollapsed = NO;
    sectionTwoCollapsed = NO;
    sectionToAdd = 0;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];
    
    //Implementation for collapsable table
    if (!expandedSections)
    {
        expandedSections = [[NSMutableIndexSet alloc] init];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(section == 0)
    {
        if(self.sectionOneCollapsed)
            return 0;
        else
            return info.count+1;
    }
    else if (section == 1)
    {
        if(self.sectionTwoCollapsed)
            return 0;
        else
            return sectionNames.count+1;
        
    }
    return 0;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Section 1";
            break;
        case 1:
            return @"Section 2";
            break;
        default:
            return @"";
            break;
    }    
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MyCell *cell = (MyCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
    if (cell == nil)
    {
        cell = [[MyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor clearColor];

    }
    
    cell.textfield.delegate = self;
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == info.count) {
            [cell.textfield removeFromSuperview];
            cell.textview.bounds = CGRectMake(20, 11, 260, 21);
            
            cell.textview.text = @"Add New Row";
            //cell.textview.textColor = [UIColor darkGrayColor];
            //cell.backgroundColor = [UIColor clearColor];

        }
        else
        {
            cell.textview.text = [info objectAtIndex:indexPath.row];
        }
        
    }else if (indexPath.section == 1){
        
        if (indexPath.row == sectionNames.count) {
            [cell.textfield removeFromSuperview];

            cell.textview.text = @"Add New Row";
            //cell.textLabel.textColor = [UIColor darkGrayColor];
        }
        else
        {
            cell.textview.text = [sectionNames objectAtIndex:indexPath.row];
        }
        
    }
    
    return cell;
}


#pragma mark - Set up Header and Footer Views

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    
    UILabel *lblSection = [UILabel new];
    lblSection.tag = section;
    headerView.tag = section;
    headerView.backgroundColor = [UIColor whiteColor];
    //lblSection.text = [self tableView: tableView titleForHeaderInSection:section];

    [lblSection setFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    [lblSection setTextAlignment:NSTextAlignmentCenter];
    [lblSection setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17]];
    [lblSection setBackgroundColor:[UIColor grayColor]];
    lblSection.alpha = 0.5;
    lblSection.textColor = [UIColor blackColor];
    [lblSection setText:[self tableView: tableView titleForHeaderInSection:section]];
    
    [headerView addSubview:lblSection];
 
    //Implementation with a Gesture Recognizer
    UITapGestureRecognizer  *headerTapped   = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderTapped:)];
    [headerView addGestureRecognizer:headerTapped];
    
    //up or down arrow depending on the bool
    UIImageView *upDownArrow;
    if (section == 0) {
        upDownArrow = [[UIImageView alloc] initWithImage:sectionOneCollapsed ? [UIImage imageNamed:@"upArrowBlack"] : [UIImage imageNamed:@"downArrowBlack"]];
    }else{
        upDownArrow = [[UIImageView alloc] initWithImage:sectionTwoCollapsed ? [UIImage imageNamed:@"upArrowBlack"] : [UIImage imageNamed:@"downArrowBlack"]];
    }
    
    upDownArrow.autoresizingMask    = UIViewAutoresizingFlexibleLeftMargin;
    upDownArrow.frame = CGRectMake(self.view.frame.size.width-40, 10, 30, 30);
    [headerView addSubview:upDownArrow];
    
    
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *footer  = [[UIView alloc] initWithFrame:CGRectZero];
    return footer;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}


#pragma mark - Table View Editting
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.editing) {
        if (indexPath.section == 0) {
            
            if (indexPath.row == info.count) {
                return UITableViewCellEditingStyleInsert;
            }
            else{
                return UITableViewCellEditingStyleDelete;
            }
            
        }else if (indexPath.section == 1){
            
            if (indexPath.row == self.sectionNames.count ) {
                return UITableViewCellEditingStyleInsert;
            }
            else{
                return UITableViewCellEditingStyleDelete;
                
            }
            
        }
    }
    
    return UITableViewCellEditingStyleNone;
    
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        if (indexPath.section == 0) {
            // Delete the row from the data source
            [self.info removeObjectAtIndex:indexPath.row];
            
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }else if (indexPath.section == 1) {
            // Delete the row from the data source
            [self.sectionNames removeObjectAtIndex:indexPath.row];
            
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        //Generate an alert message to get the title
        UIAlertView * alert = [[UIAlertView alloc]
                               initWithTitle:@"Enter Title"
                               message:@""
                               delegate:self
                               cancelButtonTitle:@"Cancel"
                               otherButtonTitles:@"Ok", nil];
        
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        [alert show];
    }
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
    if (editing == YES) {
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                      target:self
                                      action:@selector(insertNewObject)];
        
        //Show add button if in edit mode
        self.navigationItem.leftBarButtonItem = addButton;
        
    }
    else
    {
        //Show normal navigation button if not in edit mode
        self.navigationItem.leftBarButtonItem = self.navigationItem.backBarButtonItem;
    }
    
}

#pragma mark - Insert New Cell 
-(void) insertNewObject
{
    //Display UIAlertView
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Enter Title" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
    
}

#pragma mark - UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //Only do the following actions if the user hit the OK button
    if (buttonIndex == 1)
    {
        //Store the user text in a temporary string
        NSString * tempTextField = [alertView textFieldAtIndex:0].text;
        if (sectionToAdd == 0) {
            //Create array if array is not already created (precaution)
            if (!info) {
                info = [[NSMutableArray alloc]init];
            }
            
            //Add string to the array
            [info insertObject:tempTextField atIndex:0];
            
            NSIndexPath * indexPath = [NSIndexPath indexPathForRow:0 inSection:sectionToAdd];
            
            //Update the table with the new data
            [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            
            //reload specific section animated
            NSRange range   = NSMakeRange(indexPath.section, 1);
            NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
            [self.tableView reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationFade];
            
        }
        else if (sectionToAdd == 1){
            
            //Create array if array is not already created (precaution)
            if (!sectionNames) {
                sectionNames = [[NSMutableArray alloc]init];
            }
            
            //Add string to the array
            [sectionNames insertObject:tempTextField atIndex:0];
            
            NSIndexPath * indexPath = [NSIndexPath indexPathForRow:0 inSection:sectionToAdd];
            
            //Update the table with the new data
            [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            
            //reload specific section animated
            NSRange range   = NSMakeRange(indexPath.section, 1);
            NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
            [self.tableView reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationFade];
        }
        
        
        //Reload table
        //[self.tableView reloadData];
        
    }
}

#pragma mark - Table View Rearranging
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    if (fromIndexPath.section == 0) {
        [info insertObject:[info objectAtIndex:fromIndexPath.row] atIndex:toIndexPath.row];
        [info removeObjectAtIndex:(fromIndexPath.row+1)];
    }else if (fromIndexPath.section == 1){
        [sectionNames insertObject:[info objectAtIndex:fromIndexPath.row] atIndex:toIndexPath.row];
        [sectionNames removeObjectAtIndex:(fromIndexPath.row+1)];
    }
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    if (indexPath.section == 0) {
        if (indexPath.row == self.info.count) {
            return NO;
        }
    }else if(indexPath.section==1){
        if (indexPath.row == self.sectionNames.count) {
            return NO;
        }
    }
    
    return YES;
}

//Prevent the final row from being reorganized
-(NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{

    
    if (proposedDestinationIndexPath.section == 0)
    {
        if (sourceIndexPath.section != proposedDestinationIndexPath.section)
        {
            NSUInteger rowInSourceSection =
            (sourceIndexPath.section > proposedDestinationIndexPath.section) ? 0 : info.count - 1;
            
            return [NSIndexPath indexPathForRow:rowInSourceSection inSection:sourceIndexPath.section];
            
        }
        else if (proposedDestinationIndexPath.row >= info.count)
        {
            return [NSIndexPath indexPathForRow:info.count - 1 inSection:sourceIndexPath.section];
        }

    }
    else if (proposedDestinationIndexPath.section == 1)
    {
        if (sourceIndexPath.section != proposedDestinationIndexPath.section)
        {
            NSUInteger rowInSourceSection =
            (sourceIndexPath.section > proposedDestinationIndexPath.section) ? 0 : sectionNames.count - 1;
            
            return [NSIndexPath indexPathForRow:rowInSourceSection inSection:sourceIndexPath.section];
            
        }
        else if (proposedDestinationIndexPath.row >= sectionNames.count)
        {
            return [NSIndexPath indexPathForRow:sectionNames.count - 1 inSection:sourceIndexPath.section];
        }
    }
    
    return proposedDestinationIndexPath;
    
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        if (indexPath.row == info.count)
        {
            sectionToAdd = 0;
            [self setEditing:YES animated:YES];
        }
        else
        {
            
        }
        
    }else if (indexPath.section == 1){
        
        if (indexPath.row == sectionNames.count)
        {
            sectionToAdd = 1;
            [self setEditing:YES animated:YES];
        }
        else
        {
            
        }
        
    }
    
}

#pragma mark - collapsable table functions

- (BOOL)tableView:(UITableView *)tableView canCollapseSection:(NSInteger)section
{
    // if (section>0) return YES;
    
    return YES;
}

- (void)sectionHeaderTapped:(UITapGestureRecognizer *)gestureRecognizer{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:gestureRecognizer.view.tag];
    
    if (indexPath.section == 0) {
        if(!self.sectionOneCollapsed)
            sectionOneCollapsed = YES;
        else
            sectionOneCollapsed = NO;
    }
    else if (indexPath.section == 1){
        if(!self.sectionTwoCollapsed)
            sectionTwoCollapsed = YES;
        else
            sectionTwoCollapsed = NO;
        
    }
    //[self.tableView reloadData];
    
    
    //reload specific section animated
    NSRange range   = NSMakeRange(indexPath.section, 1);
    NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
    [self.tableView reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - Handling for textfield
-(BOOL)textFieldShouldReturn:(UITextField *)tf {
    [tf endEditing:YES];
    return NO;
}
- (void)textFieldDidEndEditing:(UITextField *)tf {
    // some cell's text field has finished editing; which cell?
    UIView* v = tf;
    do {
        v = v.superview;
    } while (![v isKindOfClass: [UITableViewCell class]]);
    MyCell* cell = (MyCell*)v;
    // update data model to match
    NSIndexPath* ip = [self.tableView indexPathForCell:cell];
    if (ip.section == 1)
        self.info[ip.row] = cell.textfield.text;
    else if (ip.section == 0)
        self.sectionNames[ip.row] = cell.textfield.text;
}


@end
