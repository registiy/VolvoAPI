//
//  VehicleDetailView.swift
//  Volvo
//
//  Created by Vadim on 07.06.2022.
//

import SwiftUI

struct VehicleDetailView: View {
    
    @StateObject var viewModel: VehicleDetailViewModel = VehicleDetailViewModel()
    
        
    var body: some View {
        List {
            
            Section("Enter VIN") {
                HStack {
                    TextField("VIN", text: $viewModel.customVIN)
                    Button("Request") {
                        viewModel.load()
                    }.buttonStyle(.borderedProminent)
                }
            }

            Section("Requested URL") {
                Text("\(viewModel.model.url)").foregroundColor(.gray)
                    .font(.caption)
            }

            if !viewModel.isLoading && viewModel.vehicleDetails?.data != nil {
                Section("Parsed result") {
                    HStack {
                        Text("Model: ")
                        Text("\(viewModel.vehicleDetails?.data.descriptions["model"] ?? "")")
                    }
                    HStack {
                        Text("Year: ")
                        Text("\(viewModel.vehicleDetails?.data.modelYear ?? "" )")
                    }
                    HStack {
                        Text("Colour: ")
                        Text("\(viewModel.vehicleDetails?.data.externalColour ?? "" )")
                    }
                    
                    HStack {
                        Text("Steering: ")
                        Text("\(viewModel.vehicleDetails?.data.descriptions["steering"] ?? "" )")
                    }
                    
                }
                
                Section("Interior image") {
                    if let interiorDefaultUrl = viewModel.vehicleDetails?.data.images["interiorDefaultUrl"] {
                        AsyncImage(url: URL(string: interiorDefaultUrl)) { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
                
                Section("Exterior image") {
                    if let exteriorDefaultUrl = viewModel.vehicleDetails?.data.images["exteriorDefaultUrl"] {
                        AsyncImage(url: URL(string: exteriorDefaultUrl)) { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
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
        .navigationTitle("Vehicle detail")
        .onAppear {
            viewModel.load()
            
        }
    }
}

struct VehicleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleDetailView()
    }
}
