//
//  BaseViewController.swift
//  Flash-Assignment
//
//  Created by Mohammad Zulqarnain on 16/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//


import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews() {
        //Child clases will override
    }
    
    // MARK: - Common
    
    func setupNavigationBarTitle(_ text: String?) {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 32)
        let titleLabel = UILabel(frame: frame)
        titleLabel.text = text
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        
        navigationItem.titleView = titleLabel
        navigationItem.titleView?.isHidden = false
    }
    
}

