//
//  MoviesViewController.swift
//  Flash-Assignment
//
//  Created by Mohammad Zulqarnain on 16/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import SnapKit
import MapKit

class VehiclesViewController: BaseViewController {

    //UI Components
    private let mapView: CustomMapView = {
        let mapView = CustomMapView()
        mapView.accessibilityIdentifier = "mapView"
        mapView.tag = Tag.mapView.rawValue
        return mapView
    }()
    
    private let vehicleDetailView: VehicleDetailView = {
        let vehicleDetailView = VehicleDetailView()
        vehicleDetailView.isHidden = true
        vehicleDetailView.accessibilityIdentifier = "vehicleDetailView"
        vehicleDetailView.tag = Tag.vehicleDetailView.rawValue
        return vehicleDetailView
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapRightButton), for: .touchUpInside)
        button.setImage(#imageLiteral(resourceName: "rightButton"), for: .normal)
        button.alpha = 0.6
        button.accessibilityIdentifier = "rightButton"
        button.tag = Tag.rightButton.rawValue
        return button
    }()
    
    private lazy var leftButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapLeftButton), for: .touchUpInside)
        button.setImage(#imageLiteral(resourceName: "leftButton"), for: .normal)
        button.alpha = 0.6
        button.accessibilityIdentifier = "leftButton"
        button.tag = Tag.leftButton.rawValue
        return button
    }()
    
    private lazy var nearbyButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapNearby), for: .touchUpInside)
        button.setImage(#imageLiteral(resourceName: "nearby"), for: .normal)
        button.alpha = 0.6
         button.accessibilityIdentifier = "nearbyButton"
        button.tag = Tag.nearbyButton.rawValue
        return button
    }()
    
    var locationManager: CLLocationManager?
    
    var userLocation: CLLocation?
    
    var selectedAnnotationIndex = 0
    
    //View model object
    var viewModel: VehiclesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = VehiclesViewModel()
        viewModel?.delegate = self
        viewModel?.getVehiclesInfo()

        setupLocationManager()
        setupViews()
        setupRegularConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard let viewModel = self.viewModel as VehiclesViewModel? else { return }
        viewModel.getVehiclesInfo()
    }
    
    // MARK: - UI Setup
    
    func configureMap() {
        mapView.delegate = self
    }
    
    func setupLocationManager() {
        
        checkLocationAuthorizationStatus()
        
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager?.requestAlwaysAuthorization()
            locationManager?.startUpdatingLocation()
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        self.title = "Flash Assignment"
        
        configureMap()

        view.addSubview(mapView)
        view.addSubview(vehicleDetailView)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        view.addSubview(nearbyButton)
        view.bringSubview(toFront: vehicleDetailView)
        view.bringSubview(toFront: leftButton)
        view.bringSubview(toFront: rightButton)
        view.bringSubview(toFront: nearbyButton)
    }
    
    private func setupRegularConstraints() {
        
        mapView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        leftButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0.15 * self.view.frame.size.width)
            make.left.equalToSuperview().offset(0.15 * self.view.frame.size.width)
            make.height.equalToSuperview().multipliedBy(0.1)
            make.width.equalToSuperview().multipliedBy(0.15)
        }
        
        rightButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0.15 * self.view.frame.size.width)
            make.right.equalToSuperview().offset(-0.15 * self.view.frame.size.width)
            make.height.equalToSuperview().multipliedBy(0.1)
            make.width.equalToSuperview().multipliedBy(0.15)
        }
        
        nearbyButton.snp.makeConstraints { (make) in
            make.top.equalTo(rightButton.snp.bottom).offset(0.01 * self.view.frame.size.width)
            make.right.equalToSuperview().offset(-0.15 * self.view.frame.size.width)
            make.height.equalToSuperview().multipliedBy(0.1)
            make.width.equalToSuperview().multipliedBy(0.15)
        }
        
        vehicleDetailView.snp.makeConstraints { (make) in
            make.height.equalTo(mapView.snp.height).multipliedBy(0.4)
            make.width.equalTo(mapView.snp.width).multipliedBy(0.95)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }

    }
    
    func presentDetailView(itemObject: ItemObject) {
        vehicleDetailView.populateValues(itemObject: itemObject)
        vehicleDetailView.isHidden = false
    }
}

extension VehiclesViewController: ViewModelDelegate {
    
    func showErrorMessage() {
       DispatchQueue.main.async {
            let alert = UIAlertController(title: Vehicles.alertTitle.localized, message: Vehicles.networkErrorMessage.localized, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: Vehicles.affirmation.localized, style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: false, completion: nil)
        }
    }
    
    
    func reloadMap(annotationData: [ItemObject]) {
        DispatchQueue.main.async {
            self.populateAnnotationsOnMap(annotationData: annotationData)
        }
    }
    
}

extension VehiclesViewController: CLLocationManagerDelegate {
    
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse
            ||
            CLLocationManager.authorizationStatus() == .authorizedAlways {
            mapView.showsUserLocation = true
        } else {
            locationManager?.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if mapView.annotations.isEmpty {
            viewModel?.getVehiclesInfo()
        }
        guard let userLocation = locations[0] as CLLocation? else { return }
        self.userLocation = userLocation
    }
}

extension VehiclesViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        vehicleDetailView.isHidden = true
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? CustomAnnotation else { return nil }
        let identifier = Identifier.scootyMarker.rawValue
        var view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
            view.image =  UIImage(named: Identifier.scootyImage.rawValue)
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.image =  UIImage(named: Identifier.scootyImage.rawValue)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        view.accessibilityIdentifier = Identifier.scootyAnnotation.rawValue
        return view
    }
    
    func addCustomAnnotationToMapView(title: String, coordinates: CLLocationCoordinate2D) {
        let pin = CustomAnnotation(coor: coordinates)
        pin.title = title
        self.mapView.addAnnotation(pin)
    }
    
    func populateAnnotationsOnMap(annotationData: [ItemObject]) {
        guard let items = annotationData as [ItemObject]?, annotationData.count > 0 else {
            return
        }
        mapView.removeAnnotations(mapView.annotations)
        items.forEach({ item in
            guard let title = item.name as String?, let latitude = item.latitude as Double?, let longitude = item.longitude as Double? else { return }
            addCustomAnnotationToMapView(title: title, coordinates: CLLocationCoordinate2D(latitude: CLLocationDegrees(exactly: latitude)!, longitude: CLLocationDegrees(exactly: longitude)!))
        })
        self.mapView.setNeedsDisplay()
    }
    
    func averageCordinates() -> CLLocationCoordinate2D {
        var avgLatitude = 0.0
        var avgLongitude = 0.0
        mapView.annotations.forEach({ annotation in
            avgLatitude += annotation.coordinate.latitude
            avgLongitude += annotation.coordinate.longitude
        })
        return CLLocationCoordinate2D(latitude: avgLatitude/Double(mapView.annotations.count), longitude: avgLongitude/Double(mapView.annotations.count))
    }
    
    func repositionToCenterOfAnnotations() {
        mapView.centerOnCoordinate(centerCoodinate: averageCordinates())
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let customAnnotation = view.annotation as? CustomAnnotation,
            let title = customAnnotation.title as String?,
            let id = viewModel?.dataItem?.results.filter({$0.name == title }).first?.id as Int? else {
            vehicleDetailView.isHidden = true
            return}
        viewModel?.getVehicleDetailInfo(id: "\(id)")
        guard let itemObject = viewModel?.detailItemObject
        else {return}
        presentDetailView(itemObject: itemObject)
    }
    
    @objc func didTapRightButton() {
        if mapView.annotations.count <= 1 {
            viewModel?.getVehiclesInfo()
        }
        guard let index = (selectedAnnotationIndex + 1) as Int?,
            let itemObject = viewModel?.dataItem?.results[index < (viewModel?.dataItem?.results.count)! ? index : (viewModel?.dataItem?.results.count)! - 1] as ItemObject?
              else
              { return }
        selectedAnnotationIndex = itemObject.id - 1
        presentDetailView(itemObject: itemObject)
        guard let latitude = CLLocationDegrees(exactly: itemObject.latitude) as CLLocationDegrees?,  let longitude = CLLocationDegrees(exactly: itemObject.longitude) as CLLocationDegrees? else { return }
        mapView.centerOnCoordinate(centerCoodinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
    }
    
    @objc func didTapLeftButton() {
        if mapView.annotations.count <= 1 {
            viewModel?.getVehiclesInfo()
        }
        guard let index = (selectedAnnotationIndex - 1) as Int?,
            let itemObject = viewModel?.dataItem?.results[index >= 0 ? index : 0] as ItemObject?
            else
            { return }
        selectedAnnotationIndex = itemObject.id - 1
        guard let latitude = CLLocationDegrees(exactly: itemObject.latitude) as CLLocationDegrees?,  let longitude = CLLocationDegrees(exactly: itemObject.longitude) as CLLocationDegrees? else { return }
        mapView.centerOnCoordinate(centerCoodinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        presentDetailView(itemObject: itemObject)
    }
    
    @objc func didTapNearby() {
        if mapView.annotations.count <= 1  {
            viewModel?.getVehiclesInfo()
        }
        guard let itemObjects = viewModel?.dataItem?.results else { return }
        guard let userLocation = self.userLocation as CLLocation?, let itemObjectLatitude = itemObjects.first?.latitude as Double?, let itemObjectLongitude = itemObjects.first?.longitude as Double? else { return }
        let latitudeDiff = itemObjectLatitude - userLocation.coordinate.latitude
        let longitudeDiff = itemObjectLongitude - userLocation.coordinate.longitude
        var minDistance = latitudeDiff + longitudeDiff
        itemObjects.forEach({ itemObject in
            let latitudeDiff = itemObject.latitude - userLocation.coordinate.latitude
            let longitudeDiff = itemObject.longitude - userLocation.coordinate.longitude
            if let difference = latitudeDiff + longitudeDiff as Double?, difference > minDistance {
                minDistance = difference
                selectedAnnotationIndex = itemObject.id - 1
            }
        })
        guard let itemObject = itemObjects[selectedAnnotationIndex] as ItemObject?, let latitude = CLLocationDegrees(exactly: itemObject.latitude) as CLLocationDegrees?,  let longitude = CLLocationDegrees(exactly: itemObject.longitude) as CLLocationDegrees? else { return }

        mapView.centerOnCoordinate(centerCoodinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        presentDetailView(itemObject: itemObject)
    }
}


// MARK: - Tags

private extension VehiclesViewController {
    
    private enum Tag: Int {
        
        case rightButton = 1
        case leftButton = 2
        case nearbyButton = 3
        case vehicleDetailView = 4
        case mapView = 5
    }
    
}
