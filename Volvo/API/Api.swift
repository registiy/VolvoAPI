//
//  ApiController.swift
//  Volvo
//
//  Created by Vadim on 07.06.2022.
//

import Foundation

protocol Api: AnyObject {
    associatedtype decodableModel: Decodable
}

extension Api {

    func request(url: String, completion: @escaping (_ stringData: String, _ decodedData: decodableModel?) -> Void) {
        
        var request = URLRequest(url: URL(string:url)! )
        
        request.setValue(UserDefaults.standard.string(forKey: "vccApiKeyPrimary"), forHTTPHeaderField: "vcc-api-key")
        request.setValue("Bearer \(UserDefaults.standard.string(forKey: "connectedVehicleApiToken") ?? "")", forHTTPHeaderField: "authorization")
                
        request.httpMethod = "GET"
        
        let _ = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Some error \(error.localizedDescription)")
            } else if let data = data {
                let stringData = String(decoding: data, as: UTF8.self)
                let decodedData = self.decodeData(data)
                DispatchQueue.main.async {
                    completion(stringData, decodedData)
                }
            } else {
                print("Baad")
            }
        }.resume()
    }
    
    func decodeData(_ data: Data) -> decodableModel? {
        let decoder = JSONDecoder()
        
        if let decodedResponse = try? decoder.decode(decodableModel.self, from: data) {
            return decodedResponse
        }
        return nil
    }
    
}
