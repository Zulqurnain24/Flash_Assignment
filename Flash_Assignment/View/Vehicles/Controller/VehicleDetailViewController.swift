//
//  VehicleDetailViewController.swift
//  Flash-Assignment
//
//  Created by Mohammad Zulqarnain on 16/06/2019.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import UIKit
import SnapKit

class VehicleDetailView: UIView {
    
    //UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Vehicles.titleLabel.localized
        label.font = Typography.titleXL.font
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.accessibilityIdentifier = "priceLabel"
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
        label.accessibilityIdentifier = "priceLabel"
        label.backgroundColor = UIColor.black
        label.numberOfLines = 0
        label.tag = Tag.descriptionLabel.rawValue
        return label
    }()
    private let timestampLabel: UILabel = {
        let label = UILabel()
        label.text = Vehicles.timestamp.localized
        label.textColor = UIColor.white
        label.font = Typography.titleXL.font
        label.numberOfLines = 0
        label.accessibilityIdentifier = "priceLabel"
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
        label.accessibilityIdentifier = "priceLabel"
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
        label.accessibilityIdentifier = "priceLabel"
        label.backgroundColor = UIColor.black
        label.numberOfLines = 0
        label.tag = Tag.priceTimeLabel.rawValue
        return label
    }()
    
    //Variables
    var titleLabelString = ""
    var descriptionLabelString = ""
    var timestampLabelString = ""
    var priceLabelString = ""
    var priceTimeLabelString = ""
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        populateViews()
        setupViews()
        setupRegularConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - UI Setup
    func populateViews() {
        titleLabel.text = "\(titleLabel.text!) \(titleLabelString)"
        descriptionLabel.text = "\(descriptionLabel.text!) \(descriptionLabelString)"
        timestampLabel.text = "\(timestampLabel.text!) \(timestampLabelString)"
        priceLabel.text = "\(priceLabel.text!) \(priceLabelString)"
        priceTimeLabel.text = "\(priceTimeLabel.text!) \(priceTimeLabelString)"
    }
    
    func setupViews() {

        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(timestampLabel)
        addSubview(priceLabel)
        addSubview(priceTimeLabel)
    }
    
    func populateValues(itemObject: ItemObject) {
        titleLabelString = itemObject.name
        descriptionLabelString = itemObject.description
        timestampLabelString = itemObject.timestamp
        priceLabelString = "\(itemObject.currency)\(itemObject.price)"
        priceTimeLabelString = "\(itemObject.priceTime)"
    }
    
    private func setupRegularConstraints() {
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(0.2 * self.frame.height)
        }
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(0.2 * self.frame.height)
        }
        timestampLabel.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionLabel.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(0.2 * self.frame.height)
        }
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(timestampLabel.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(0.2 * self.frame.height)
        }
        priceTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(priceLabel.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(0.2 * self.frame.height)
        }
    }
}

// MARK: - Tags

private extension VehicleDetailViewController {

    private enum Tag: Int {
        
        case titleLabel = 1
        case descriptionLabel = 2
        case timestampLabel = 3
        case priceLabel = 4
        case priceTimeLabel = 5
    }
    
}
