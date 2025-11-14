//
//  AircraftMenuView.swift
//  flying
//
//  Created by bill on 11/14/25.
//

import SwiftUI
struct AircraftMenuView: View {
    @State var flightInProgress: Bool = false
    @State var didSaveTakeoff: Bool = false
    var aircraft: Aircraft
    var aircraftNNum: String
    @State var myFlight: Flight?
    
    var body: some View {
        ZStack{

            
            NavigationStack {
                VStack{
                    Text("\(aircraftNNum)")
                        .padding(.bottom,20)
                        .foregroundStyle(.white)
                        .bold()
                        
                    VStack {
                        
                        
                        Spacer()
                        HStack {
                            
                            


                            Spacer()
                            
                        }
                        .padding()
                    }
                    
                }
            }
        }
    }
}
