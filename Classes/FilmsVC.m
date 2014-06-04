#import "FilmsVC.h"

#import "Film.h"
#import "FilmCell.h"
#import "FilmCategory.h"
#import "FilmDetailVC.h"

@interface FilmsVC ()

@end

@implementation FilmsVC {
    FilmCategory *_category;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCategory:(FilmCategory *)category {
    if ([self initWithStyle:UITableViewStylePlain]) {
        _category = category;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = _category.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    _category = nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[Film filmsForCategory:_category] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Film *film = [[Film filmsForCategory:_category] objectAtIndex:indexPath.row];
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[FilmCell alloc] initWithFilm:film reuseIdentifier:CellIdentifier];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FilmDetailVC *vc = [[FilmDetailVC alloc] initWithFilm:[[Film filmsForCategory:_category] objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
