//
//  VehicleListView.swift
//  Volvo
//
//  Created by Vadim on 07.06.2022.
//

import SwiftUI

struct VehicleListView: View {
    
    @StateObject var viewModel: VehicleListViewModel = VehicleListViewModel()
    
    var body: some View {
        List {
            
            if !viewModel.isLoading && viewModel.vehicleList?.data != nil {
                Section("VIN LIST") {
                    ForEach(viewModel.vehicleList?.data ?? [], id: \.vin) { car in
                        Text("\(car.vin)")
                    }
                }
            } else if viewModel.isLoading {
                ProgressView()
            } else {
                
            }
            
            Section("Response body") {
               Text("\(viewModel.stringData)")
            }
            
        }
        .navigationTitle("Vehicle list")
        .onAppear {
            viewModel.load()
        }
    }
}

struct VehicleListView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleListView()
    }
}
