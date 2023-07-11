#import <Foundation/Foundation.h>
#import "NOTRootListController.h"

@implementation NOTRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void)viewDidLoad {
	[super viewDidLoad];
	UIBarButtonItem *applyButton = [[UIBarButtonItem alloc] initWithTitle:@"Respring" style:UIBarButtonItemStylePlain target:self action:@selector(respringButton)];
    self.navigationItem.rightBarButtonItem = applyButton;
}

-(void)respringButton {

	UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Respring"
												  message:@"Are you sure you want to respring ?"
												  preferredStyle:UIAlertControllerStyleActionSheet];

	UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel
	handler:^(UIAlertAction * action) {}];

	UIAlertAction* yes = [UIAlertAction actionWithTitle:@"Respring" style:UIAlertActionStyleDestructive
	handler:^(UIAlertAction * action) {
		[HBRespringController respring];
	}];

	[alert addAction:defaultAction];
	[alert addAction:yes];
	[self presentViewController:alert animated:YES completion:nil];
}

@end

@implementation ThomzHeaderCell 

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(id)reuseIdentifier specifier:(id)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];

	if (self) {

		NSBundle *bundle = [[NSBundle alloc]initWithPath:@"/var/jb/Library/PreferenceBundles/NotBrightRespringPreferences.bundle"]; // rootless
		// NSBundle *bundle = [[NSBundle alloc]initWithPath:@"/Library/PreferenceBundles/NotBrightRespringPreferences.bundle"]; //rootful
		UIImage *logo = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"icon@256" ofType:@"png"]];
		UIImageView *icon = [[UIImageView alloc]initWithImage:logo];
		icon.layer.masksToBounds = YES;
		icon.layer.cornerRadius = 16;
		icon.translatesAutoresizingMaskIntoConstraints = NO;

		UILabel *tweakLabel = [[UILabel alloc] init];
		[tweakLabel setTextAlignment:NSTextAlignmentCenter];
        [tweakLabel setFont:[UIFont systemFontOfSize:30 weight: UIFontWeightRegular]];
        tweakLabel.text = @"NotBrightRespring";
        tweakLabel.translatesAutoresizingMaskIntoConstraints = NO;

		UILabel *devLabel = [[UILabel alloc] init];
		[devLabel setTextAlignment:NSTextAlignmentCenter];
        [devLabel setFont:[UIFont systemFontOfSize:15 weight: UIFontWeightRegular]];
        devLabel.text = @"By Thomz";
        devLabel.translatesAutoresizingMaskIntoConstraints = NO;
		devLabel.alpha = 0.8;

		[self.contentView addSubview:icon];
		[self.contentView addSubview:tweakLabel];
		[self.contentView addSubview:devLabel];

		// Add constraints
		[NSLayoutConstraint activateConstraints:@[
			[icon.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor],
			[icon.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor constant:-30],
			[icon.widthAnchor constraintEqualToConstant:100],
			[icon.heightAnchor constraintEqualToConstant:100],
			[tweakLabel.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor],
			[tweakLabel.topAnchor constraintEqualToAnchor:icon.bottomAnchor constant:10],
			[devLabel.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor],
			[devLabel.topAnchor constraintEqualToAnchor:tweakLabel.bottomAnchor]
		]];

    }
    	return self;

}

- (instancetype)initWithSpecifier:(PSSpecifier *)specifier {
	return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CenamoHeaderCell" specifier:specifier];
}

- (void)setFrame:(CGRect)frame {
	frame.origin.x = 0;
	[super setFrame:frame];
}

@end
