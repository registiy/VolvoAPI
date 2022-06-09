//
//  VehicleListModel.swift
//  Volvo
//
//  Created by Vadim on 08.06.2022.
//

import Foundation

class VehicleListModel: Api {
    
    typealias decodableModel = VehicleList
    
    struct VehicleList: Decodable {
        let operationId: String
        let status: Int
        let data: [Vin]
        let pagination: Pagination
    }

    struct Vin: Decodable {
        let vin: String
    }

    struct Pagination: Decodable {
        let limit: Int
        let total: Int
    }
    
    var url: String = "https://api.volvocars.com/connected-vehicle/v1/vehicles"
    let uuid = UUID()
    //var loadedList: model?
    
    func load(completion: @escaping (_ stringData: String, _ decodedData: decodableModel?) -> Void) {
        request(url: self.url, completion: completion)
    }
    
}
