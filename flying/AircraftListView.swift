//
//  SwiftUIView.swift
//  flying
//
//  Created by bill on 11/14/25.
//

import SwiftUI
import SwiftData


struct AircraftListView: View {
    
    @State private var myAircraft: Aircraft?
    @Query private var aircrafts: [Aircraft]
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                VStack {
                    Text("Aircraft")
                        
                        .foregroundStyle(.white)
                    
                    ScrollView {
                        VStack{
                            ForEach(aircrafts){ ac in
                                NavigationLink{
                                    //FlightListView(aircraftNNum: ac.nNumber, aircraft: ac)
                                    AircraftMenuView(aircraft: ac, aircraftNNum: ac.nNumber)
                                } label: {
                                    AircraftView(aircraft: ac)
                                        .onLongPressGesture {
                                            //AddEditAircraftView(myAircraft: ac, isEditMode: true)
                                            myAircraft = ac
                                        }
                                }

                            }
                        }
                        
                    }
                
                    VStack{
                        //Spacer()
                        HStack{
                            
                            Button("Add"){
                                self.myAircraft = Aircraft()
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.black)
                            Spacer()
                         
                        }
                        .padding(.leading)
                    }
                    //.padding(.leading)
                }
                .foregroundStyle(.white)
                .sheet(item: $myAircraft) { aircraft in
                    
                    let isEdit = aircraft.nNumber.trimmingCharacters(in: .whitespacesAndNewlines) != ""
                    //let isEdit = true
                    AddEditAircraftView(myAircraft: aircraft, isEditMode: isEdit)
                        .presentationDetents([.fraction(0.5)])
                }
            
            }
        }
    }
}
