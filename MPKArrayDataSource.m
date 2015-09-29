//
//  MPKArrayDataSource.m
//
//  Created by Mike Rudoy on 07.08.15.
//  Copyright (c) 2015 MPK. All rights reserved.
//

#import "MPKArrayDataSource.h"

@interface MPKArrayDataSource ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, strong) UILabel *emptyItemsLabel;

@end


@implementation MPKArrayDataSource

- (id)init
{
    return nil;
}

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
{
    return [self initWithItems:anItems
                cellIdentifier:aCellIdentifier
            configureCellBlock:aConfigureCellBlock
               emptyItemsLabel:nil];
}

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
    emptyItemsLabel:(UILabel *)label
{
    self = [super init];
    if (self) {
        self.items = anItems;
        self.cellIdentifier = aCellIdentifier;
        self.configureCellBlock = [aConfigureCellBlock copy];
        self.emptyItemsLabel = label;
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSUInteger) indexPath.row];
}


#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.items.count == 0 && self.emptyItemsLabel) {
        tableView.backgroundView = self.emptyItemsLabel;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        return 0;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    cell.tag = indexPath.row;
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    return cell;
}

@end

