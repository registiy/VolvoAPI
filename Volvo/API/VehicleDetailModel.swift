//
//  VehicleDetail.swift
//  Volvo
//
//  Created by Vadim on 09.06.2022.
//

import Foundation


class VehicleDetailModel: Api {
    typealias decodableModel = VehicleDetails
    
    //VehicleDetails
    struct VehicleDetails: Decodable {
        let operationId: String
        let status: Int
        let data: VehicleDetailsData
    }

    struct VehicleDetailsData: Decodable {
        let descriptions: [String:String]
        let externalColour: String
        let images: [String:String]
        let modelYear: String
        let vin: String
    }
    
    var url: String {
        "https://api.volvocars.com/connected-vehicle/v1/vehicles/\(customVIN)"
    }
    var customVIN: String = "YV4952NA4F120DEMO"
    
    func load(completion: @escaping (_ stringData: String, _ decodedData: decodableModel?) -> Void) {
        request(url: self.url, completion: completion)
    }
    

}
