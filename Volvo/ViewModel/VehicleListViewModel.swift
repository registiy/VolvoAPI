//
//  VehicleListViewModel.swift
//  Volvo
//
//  Created by Vadim on 07.06.2022.
//

import Foundation


class VehicleListViewModel: ObservableObject {
        
    @Published var vehicleList: VehicleListModel.VehicleList?
    @Published var stringData: String = ""
    @Published var isLoading = false
    
    
    func load() {
        isLoading = true
        VehicleListModel().load() { stringData, decodedData in
            self.vehicleList = decodedData
            self.stringData = stringData
            self.isLoading = false
        }
    }
    
}
