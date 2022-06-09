//
//  VehicleDetailsViewModel.swift
//  Volvo
//
//  Created by Vadim on 07.06.2022.
//

import Foundation

class VehicleDetailViewModel: ObservableObject {
    
    @Published var vehicleDetails: VehicleDetailModel.VehicleDetails?
    @Published var stringData: String = ""
    @Published var customVIN: String = ""
    @Published var isLoading = false
    
    private(set) var model = VehicleDetailModel()
    
    init() {
        self.customVIN = model.customVIN
    }
    
    func load() {
        isLoading = true
        model.customVIN = customVIN
        model.load() { stringData, decodedData in
            self.stringData = stringData
            self.vehicleDetails = decodedData
            self.isLoading = false
            print(self.vehicleDetails?.data.images ?? "")
        }
    }
}
