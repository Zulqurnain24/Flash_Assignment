//
//  MoviesRepository.swift
//  Flash-Assignment
//
//  Created by Mohammad Zulqarnain on 16/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

enum ListType {
    case getVehicles
    case getVehicle
}

enum  ItemObjectResponse {
    case success(result: ItemObject)
    case failure
}

enum  ItemDataResponse {
    case success(result: ItemsObjectList)
    case failure
}

//Repository - Performs network logic
class VehiclesRepsository: BaseService {
    
    func getVehiclesInfo(completion: @escaping (ItemDataResponse) -> Void ) {
        let endPoint = setEndPoint(type: ListType.getVehicles)
        super.callEndPoint(endPoint: endPoint.rawValue) { [weak self] (response) in
            switch response {
            case .success(let result):
                self?.parseVehiclesResult(result: result, completion: completion)
                break
            default:
                completion(.failure)
                break
            }
            
        }
    }
    
    func getVehicleDetailInfo(id: String = "", completion: @escaping (ItemObjectResponse) -> Void ) {
        let endPoint = setEndPoint(type: ListType.getVehicle)
        super.callEndPoint(endPoint: endPoint.rawValue + id) { [weak self] (response) in
            switch response {
            case .success(let result):
                self?.parseVehicleDetailResult(result: result, completion: completion)
                break
            default:
                completion(.failure)
                break
            }
            
        }
    }
    
    private func parseVehicleDetailResult(result: JsonDictionay, completion: @escaping (ItemObjectResponse) -> Void) {
        
        guard let data = ItemObject(json: result) else {
            completion(.failure)
            return
        }
        
        completion(.success(result: data))
    }
    
    private func parseVehiclesResult(result: JsonDictionay,completion: @escaping (ItemDataResponse) -> Void) {
        
        guard let data = ItemsObjectList(json: result) else {
            completion(.failure)
            return
        }
        
        completion(.success(result: data))
    }
    
    private func setEndPoint(type: ListType) -> VehiclesEndPoint {
        var endPoint: VehiclesEndPoint
        switch type {
        case .getVehicle:
            endPoint = .getVehicle
        case .getVehicles:
            endPoint = .getVehicles
        }
        return endPoint
    }
    
}
