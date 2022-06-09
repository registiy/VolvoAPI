//
//  StatisticsViewModel.swift
//  Volvo
//
//  Created by Vadim on 09.06.2022.
//

import Foundation

class StatisticsViewModel: ObservableObject {
    
    @Published var statistics: StatisticsModel.Statistics?
    @Published var stringData: String = ""
    @Published var isLoading = false
    @Published var customVIN = ""
    
    private(set) var model = StatisticsModel()
    
    init() {
        self.customVIN = model.customVIN
    }
    
    func load() {
        isLoading = true
        model.load { stringData, decodedData in
            self.statistics = decodedData
            self.stringData = stringData
            self.isLoading = false
        }
    }
    
}
