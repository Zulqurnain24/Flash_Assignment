//
//  CustomTableView.swift
//  Flash-Assignment
//
//  Created by Mohammad Zulqarnain on 16/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import MapKit

class CustomMapView: MKMapView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure() {
        let mapCamera = MKMapCamera(lookingAtCenter: AppConstants.userCoordinate, fromEyeCoordinate: AppConstants.eyeCoordinate, eyeAltitude: AppConstants.eyeAltitude)
        self.mapType = .mutedStandard
        self.setCamera(mapCamera, animated: true)
    }
    
    func centerOnCoordinate(centerCoodinate: CLLocationCoordinate2D) {
        let center = CLLocationCoordinate2D(latitude: centerCoodinate.latitude,
                                            longitude: centerCoodinate.longitude)
        let region = MKCoordinateRegion(center: center,
                                        span: MKCoordinateSpan(latitudeDelta: AppConstants.latitudeAndLongitudinalDelta,
                                                               longitudeDelta: AppConstants.latitudeAndLongitudinalDelta))
        self.setRegion(region, animated: true)
    }
}
