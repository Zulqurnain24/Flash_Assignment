//
//  VehicleDetailViewController.swift
//  Flash-Assignment
//
//  Created by Mohammad Zulqarnain on 16/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import SnapKit
import MapKit

class VehicleDetailView: UIView {
    
    //UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Vehicles.titleLabel.localized
        label.font = Typography.titleXL.font
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.accessibilityIdentifier = Identifier.titleLabel.rawValue
        label.backgroundColor = UIColor.black
        label.numberOfLines = 0
        label.tag = Tag.titleLabel.rawValue
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = Vehicles.descriptionLabel.localized
        label.textColor = UIColor.white
        label.font = Typography.titleXL.font
        label.numberOfLines = 0
        label.accessibilityIdentifier = Identifier.descriptionLabel.rawValue
        label.backgroundColor = UIColor.black
        label.numberOfLines = 0
        label.tag = Tag.descriptionLabel.rawValue
        return label
    }()
    
    private let batteryLabel: UILabel = {
        let label = UILabel()
        label.text = Vehicles.batteryLevel.localized
        label.textColor = UIColor.white
        label.font = Typography.titleXL.font
        label.numberOfLines = 0
        label.accessibilityIdentifier = Identifier.batteryLabel.rawValue
        label.backgroundColor = UIColor.black
        label.numberOfLines = 0
        label.tag = Tag.batteryLevel.rawValue
        return label
    }()
    
    private let timestampLabel: UILabel = {
        let label = UILabel()
        label.text = Vehicles.timestamp.localized
        label.textColor = UIColor.white
        label.font = Typography.titleXL.font
        label.numberOfLines = 0
        label.accessibilityIdentifier = Identifier.timestampLabel.rawValue
        label.backgroundColor = UIColor.black
        label.numberOfLines = 0
        label.tag = Tag.timestampLabel.rawValue
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = Vehicles.priceLabel.localized
        label.textColor = UIColor.white
        label.font = Typography.titleXL.font
        label.numberOfLines = 0
        label.accessibilityIdentifier = Identifier.priceLabel.rawValue
        label.backgroundColor = UIColor.black
        label.numberOfLines = 0
        label.tag = Tag.priceLabel.rawValue
        return label
    }()
    
    private let priceTimeLabel: UILabel = {
        let label = UILabel()
        label.text = Vehicles.priceTimeLabel.localized
        label.textColor = UIColor.white
        label.font = Typography.titleXL.font
        label.numberOfLines = 0
        label.accessibilityIdentifier = Identifier.priceTimeLabel.rawValue
        label.backgroundColor = UIColor.black
        label.numberOfLines = 0
        label.tag = Tag.priceTimeLabel.rawValue
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = Vehicles.addressLabel.localized
        label.textColor = UIColor.white
        label.font = Typography.titleXL.font
        label.numberOfLines = 0
        label.accessibilityIdentifier = Identifier.addressLabel.rawValue
        label.backgroundColor = UIColor.black
        label.numberOfLines = 0
        label.tag = Tag.priceTimeLabel.rawValue
        return label
    }()
    
    //Variables
    var titleLabelString = ""
    var descriptionLabelString = ""
    var batteryLevel = ""
    var timestampLabelString = ""
    var priceLabelString = ""
    var priceTimeLabelString = ""
    var latitude = Double(0.0)
    var longitude = Double(0.0)
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupViews()
        populateViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard traitCollection != previousTraitCollection else { return }
        
        switch traitCollection.verticalSizeClass {
        case .regular: setupRegularConstraints()
        case .compact, .unspecified: break
        }
    }
    // MARK: - UI Setup
    func populateViews() {
        titleLabel.text = "\(Vehicles.titleLabel.localized) \(titleLabelString)"
        descriptionLabel.text = "\(Vehicles.descriptionLabel.localized) \(descriptionLabelString)"
        batteryLabel.text = "\(Vehicles.batteryLevel.localized) \(batteryLevel) %"
        if let level = Int(batteryLevel) as Int? {
            batteryLabel.textColor = level > 50 ? UIColor.green : UIColor.red
        }
        titleLabel.text = "\(Vehicles.titleLabel.localized) \(titleLabelString)"
        descriptionLabel.text = "\(Vehicles.descriptionLabel.localized) \(descriptionLabelString)"
        timestampLabel.text = "\(Vehicles.timestamp.localized) \(UtilityFunctions.shared.formatDate(dateString: timestampLabelString))"
        priceLabel.text = "\(Vehicles.priceLabel.localized) \(priceLabelString)"
        priceTimeLabel.text = "\(Vehicles.priceTimeLabel.localized) \(priceTimeLabelString) \(Identifier.priceTimeUnit.rawValue)" // I queried Ashwini for this unit
        UtilityFunctions.shared.convertLatLongToAddress(latitude: latitude, longitude: longitude, completionHandler: { address in
            self.addressLabel.text = "\(Vehicles.addressLabel.localized) \(address)"
        })
    }
    
    func setupViews() {
        self.backgroundColor = UIColor.black
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(batteryLabel)
        self.addSubview(timestampLabel)
        self.addSubview(priceLabel)
        self.addSubview(priceTimeLabel)
        self.addSubview(addressLabel)
    }
    
    func populateValues(itemObject: ItemObject) {
        titleLabelString = itemObject.name
        descriptionLabelString = itemObject.description
        batteryLevel = "\(itemObject.batteryLevel)"
        timestampLabelString = itemObject.timestamp
        priceLabelString = "\(itemObject.currency) \(itemObject.price)"
        priceTimeLabelString = "\(itemObject.priceTime)"
        latitude = itemObject.latitude
        longitude = itemObject.longitude
        populateViews()
    }
    
    private func setupRegularConstraints() {
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        batteryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        timestampLabel.snp.makeConstraints { (make) in
            make.top.equalTo(batteryLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(timestampLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        priceTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(priceLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        addressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(priceTimeLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
    }
}

// MARK: - Tags

private extension VehicleDetailView {

    private enum Tag: Int {
        
        case titleLabel = 1
        case descriptionLabel = 2
        case timestampLabel = 3
        case priceLabel = 4
        case priceTimeLabel = 5
        case batteryLevel = 6
    }
    
}
