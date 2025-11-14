//
//  AircraftView.swift
//  flying
//
//  Created by bill on 11/14/25.
//

import SwiftUI

struct AircraftView: View {
    
    var aircraft: Aircraft
    var body: some View {
        VStack{
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.black)
                    .opacity(0.7)
                    .shadow(radius: 10, x: 0, y: 4)
                VStack {
                    HStack {
                        Text("N Number:")
                        Text(aircraft.nNumber)
                        Spacer()
                        Text("Type:")
                        Text(aircraft.aircraftType)
                        
                    }
                    
                    HStack{
                        Text("Starting hours:")
                        Text(String(aircraft.startHours))
                        Spacer()
                        Text("Starting cycles:")
                        Text(String(aircraft.startCycles))
                    }
                    .padding(2)
                   
                }
                .padding(30)
            }
            
        }
    }
}


