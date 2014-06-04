#import "FilmCategoriesVC.h"

#import "Film.h"
#import "FilmCategory.h"
#import "FilmsVC.h"

@interface FilmCategoriesVC ()

@end

@implementation FilmCategoriesVC {
    NSArray *_categories;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        _categories = [FilmCategory allCategories];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Film Categories", nil);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    _categories = nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_categories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    int offset = 0;
    FilmCategory *cat = [_categories objectAtIndex:indexPath.row+offset];
    cell.textLabel.text = cat.name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    UILabel *countLabel = [[UILabel alloc] initWithFrame:CGRectMake(275, 12, 20, 20)];
    countLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)[[Film filmsForCategory:cat] count]];
    countLabel.font = [UIFont systemFontOfSize:13];
    [cell addSubview:countLabel];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FilmsVC *vc = [[FilmsVC alloc] initWithCategory:[_categories objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
