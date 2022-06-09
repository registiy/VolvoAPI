//
//  ContentView.swift
//  Volvo
//
//  Created by Vadim on 06.06.2022.
//

import SwiftUI

struct ContentView: View {
    
   // @StateObject var apiController = ApiController<VehicleDetails>()
    
    var body: some View {
        VStack {
            
//            Text("\(apiController.result?.operationId ?? "")")
            
            Text("Hello, world!")
                .padding()
            }
        .onAppear {
            //apiController.makeRequest(url: "https://api.volvocars.com/connected-vehicle/v1/vehicles")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
