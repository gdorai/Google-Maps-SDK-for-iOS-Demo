//
//  ViewController.m
//  Google Maps Demo
//
//  Created by Sergey Armodin on 23.05.13.
//  Copyright (c) 2013 Makoni. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>


@interface ViewController ()

@end

@implementation ViewController {
	GMSMapView *mapView_;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	
	GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:59.938806
															longitude:30.314278
																 zoom:10];	
	GoogleMapsView.myLocationEnabled = YES;
	GoogleMapsView.settings.myLocationButton = YES;
	GoogleMapsView.camera = camera;
	GoogleMapsView.delegate = self;
	
	// создаём маркер
	GMSMarker *marker = [[GMSMarker alloc] init];
	marker.position = CLLocationCoordinate2DMake(59.938806, 30.314278);
	marker.title = @"Санкт-Петербург";
	marker.snippet = @"Россия";
	marker.map = GoogleMapsView;
	GoogleMapsView.selectedMarker = marker;
	
	
}

- (void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate {
	GMSMarker *moscowMarker = [[GMSMarker alloc] init];
	moscowMarker.position = coordinate;
	moscowMarker.title = @"Ухты, вы ткнули сюда";
	moscowMarker.map = GoogleMapsView;
	GoogleMapsView.selectedMarker = moscowMarker;
}

// показываем поскву по нажатию на кнопку
- (IBAction) showMoscow:(id)sender {
	
	GMSCameraPosition *moscow = [GMSCameraPosition cameraWithLatitude:55.755773 longitude:37.617761 zoom:10];
	
	[GoogleMapsView animateToCameraPosition:moscow];
	
	GMSMarker *moscowMarker = [[GMSMarker alloc] init];
	moscowMarker.position = CLLocationCoordinate2DMake(55.755773, 37.617761);
	moscowMarker.title = @"Москва";
	moscowMarker.map = GoogleMapsView;
	GoogleMapsView.selectedMarker = moscowMarker;	
}


// метод, определяющий, что гуглокарты должны отображаться внутри вида GoogleMapsView на экране
- (void) setMapView:(GMSMapView *)mapView {
    if (!mapView) {
        mapView = [[GMSMapView alloc] initWithFrame:mapView.bounds];
    }
    GoogleMapsView = mapView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
