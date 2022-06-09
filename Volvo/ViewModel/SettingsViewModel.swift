//
//  SettingsViewModel.swift
//  Volvo
//
//  Created by Vadim on 07.06.2022.
//

import Foundation



class SettingsViewModel: ObservableObject {
       
    @Published var vccApiKeyPrimary: String = ""
    @Published var vccApiKeySecondary: String = ""
    @Published var connectedVehicleApiToken: String = ""
    @Published var extendedVehicleApiToken: String = ""
    
    init() {
        //loadSettings()
    }
    
    func saveSettings() {
        UserDefaults.standard.set(vccApiKeyPrimary, forKey: "vccApiKeyPrimary")
        UserDefaults.standard.set(vccApiKeySecondary, forKey: "vccApiKeySecondary")
        UserDefaults.standard.set(connectedVehicleApiToken, forKey: "connectedVehicleApiToken")
        UserDefaults.standard.set(extendedVehicleApiToken, forKey: "extendedVehicleApiToken")
        UserDefaults.standard.synchronize()
    }
    
    func loadSettings() {
        vccApiKeyPrimary = UserDefaults.standard.string(forKey: "vccApiKeyPrimary") ?? ""
        vccApiKeySecondary = UserDefaults.standard.string(forKey: "vccApiKeySecondary") ?? ""
        connectedVehicleApiToken = UserDefaults.standard.string(forKey: "connectedVehicleApiToken") ?? ""
        extendedVehicleApiToken = UserDefaults.standard.string(forKey: "extendedVehicleApiToken") ?? ""
    }

}
