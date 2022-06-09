//
//  StatisticsModel.swift
//  Volvo
//
//  Created by Vadim on 09.06.2022.
//

import Foundation

class StatisticsModel: Api {
    
    typealias decodableModel = Statistics
    
    struct Statistics: Decodable {
        let status: Int
        let operationId: String
        let data: StatisticsData
    }
    
    struct StatisticsData: Decodable {
        let averageFuelConsumption: StatisticsDataElement
        let averageSpeed: StatisticsDataElement
        let tripMeter1: StatisticsDataElement
        let tripMeter2: StatisticsDataElement
        let distanceToEmpty: StatisticsDataElement
    }
    
    struct StatisticsDataElement: Decodable {
        let unit: String
        let value: String
        let timestamp: Date
        
        var timestampStr: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .long
            return dateFormatter.string(from: timestamp)
        }
    }
    
    var url: String {
        "https://api.volvocars.com/connected-vehicle/v1/vehicles/\(customVIN)/statistics"
    }
    
    var customVIN: String = "YV4952NA4F120DEMO"
    
    func load(completion: @escaping (_ stringData: String, _ decodedData: decodableModel?) -> Void ) {
        request(url: self.url, completion: completion)
    }
}
