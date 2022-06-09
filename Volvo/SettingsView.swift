//
//  TestView.swift
//  Volvo
//
//  Created by Vadim on 07.06.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject private var settingsViewModel = SettingsViewModel()
    
    @State var select = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section("Authorization data") {
                    TextField("VCC API key - Primary", text: $settingsViewModel.vccApiKeyPrimary)
                    TextField("VCC API key - Secondary", text: $settingsViewModel.vccApiKeySecondary)
                    TextField("Connected Vehicle API Token", text: $settingsViewModel.connectedVehicleApiToken)
                    TextField("Extended Vehicle API Token", text: $settingsViewModel.extendedVehicleApiToken)
                
                    HStack {
                        Spacer()
                        Button("Save") {
                            settingsViewModel.saveSettings()
                        }.buttonStyle(.borderedProminent)
                    }.padding(.top, 10)
                 
                }
                Section("Check credentials") {
                    NavigationLink("VehicleList", destination: VehicleListView())
                    NavigationLink("VehicleDetail", destination: VehicleDetailView()) 
                    NavigationLink("Statistics", destination: StatisticsView())
                }
                .onAppear {
                    settingsViewModel.loadSettings()
                }
                .navigationTitle("Settings")
            }
        }
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        return SettingsView()
    
    }
}
