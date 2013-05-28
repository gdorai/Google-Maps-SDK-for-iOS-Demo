//
//  ViewController.h
//  Google Maps Demo
//
//  Created by Sergey Armodin on 23.05.13.
//  Copyright (c) 2013 Makoni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController : UIViewController <GMSMapViewDelegate> {
	IBOutlet GMSMapView *GoogleMapsView;
	IBOutlet UILabel *superText;
}

-(IBAction) showMoscow: (id) sender;

@end
