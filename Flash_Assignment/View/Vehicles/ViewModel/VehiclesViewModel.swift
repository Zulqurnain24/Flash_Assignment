//
//  VehiclesViewModel.swift
//  Flash-Assignment
//
//  Created by Mohammad Zulqarnain on 16/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    func reloadMap(annotationData: [ItemObject])
    func showErrorMessage()
}

class VehiclesViewModel {
    
    var dataItem: ItemsObjectList?
    var detailItemObject: ItemObject?
    var repository: VehiclesRepsository?
    weak var delegate: ViewModelDelegate?
    
    init() {
        repository = VehiclesRepsository()
    }
    
    func getVehiclesInfo() {
        guard let repo = repository else { return }
        
         repo.getVehiclesInfo() { [weak self](response) in
            
            switch response {
            case .success(let result):
                self?.dataItem = result
                self?.delegate?.reloadMap(annotationData: result.results)
            case.failure:
                self?.delegate?.showErrorMessage()
                break
            }
        }
    }
    
    func getVehicleDetailInfo(id: String) {
        guard let repo = repository else { return }
        
        repo.getVehicleDetailInfo(id: id) { [weak self](response) in
            
            switch response {
            case .success(let result):
                self?.detailItemObject = result
                self?.delegate?.reloadMap(annotationData: [])
            case.failure:
                self?.delegate?.showErrorMessage()
                break
            }
        }
    }
}
