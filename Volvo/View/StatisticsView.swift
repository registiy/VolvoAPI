//
//  StatisticsView.swift
//  Volvo
//
//  Created by Vadim on 10.06.2022.
//

import SwiftUI

struct StatisticsView: View {
    
    @StateObject var viewModel = StatisticsViewModel()
    
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

            if !viewModel.isLoading && viewModel.statistics?.data != nil {
                Section("Average fuel consumption") {
                    Text("\(viewModel.statistics?.data.averageFuelConsumption.value ?? "")")
                    Text("\(viewModel.statistics?.data.averageFuelConsumption.unit ?? "")")
                    Text("\(viewModel.statistics?.data.averageFuelConsumption.timestamp ?? "")")
                }
                
                Section("Average speed") {
                    Text("\(viewModel.statistics?.data.averageSpeed.value ?? "")")
                    Text("\(viewModel.statistics?.data.averageSpeed.unit ?? "")")
                    Text("\(viewModel.statistics?.data.averageSpeed.timestamp ?? "")")
                }
                
                Section("Trip meter 1") {
                    Text("\(viewModel.statistics?.data.tripMeter1.value ?? "")")
                    Text("\(viewModel.statistics?.data.tripMeter1.unit ?? "")")
                    Text("\(viewModel.statistics?.data.tripMeter1.timestamp ?? "")")
                }
                
                Section("Trip meter 2") {
                    Text("\(viewModel.statistics?.data.tripMeter2.value ?? "")")
                    Text("\(viewModel.statistics?.data.tripMeter2.unit ?? "")")
                    Text("\(viewModel.statistics?.data.tripMeter2.timestamp ?? "")")
                }
                
                Section("Distance to empty") {
                    Text("\(viewModel.statistics?.data.distanceToEmpty.value ?? "")")
                    Text("\(viewModel.statistics?.data.distanceToEmpty.unit ?? "")")
                    Text("\(viewModel.statistics?.data.distanceToEmpty.timestamp ?? "")")
                }
                
            } else if viewModel.isLoading {
                ProgressView()
            } else {

            }

            Section("Response body") {
               Text("\(viewModel.stringData)")
            }
            
        }
        .navigationTitle("Statistics")
        .onAppear {
            viewModel.load()
            
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
