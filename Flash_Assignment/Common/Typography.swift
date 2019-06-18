//
//  Typography.swift
//  Flash-Assignment
//
//  Created by Mohammad Zulqarnain on 16/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

enum Typography {
    
    case titleXL
    case titleLarge
    
    var font: UIFont? {
        switch self {
        case .titleXL: return UIFont(name: "Gilroy-ExtraBold", size: 34)
        case .titleLarge: return UIFont(name: "Gilroy-ExtraBold", size: 28)
       
        }
        
    }
    
    var lineHeight: CGFloat {
        switch self {
        case .titleXL: return CGFloat(38)
        case .titleLarge: return CGFloat(36)
       
        }
        
    }
    
}
