//
//  AddEditAircraftView.swift
//  flying
//
//  Created by bill on 11/14/25.
//

import SwiftUI
import SwiftData

struct AddEditAircraftView: View {
    
    var myAircraft: Aircraft
    var isEditMode: Bool
    @State private var showConfirmation: Bool = false
    
    @State var nNum: String = ""
    @State var faaType: String = ""
    @State var startHours: String = ""
    @State var startCycles: String = ""
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack{
                Text(isEditMode ? "Edit Aircraft" : "Add Aircraft")
                    
                    .foregroundStyle(.white)
                
                TextField("N Number", text: $nNum)
                    .textInputAutocapitalization(.characters)
                TextField("FAA Type", text: $faaType)
                    .textInputAutocapitalization(.characters)
                TextField("Starting Hours", text: $startHours)
                    .keyboardType(.decimalPad)
                TextField("Starting Cycles", text: $startCycles)
                    .keyboardType(.numberPad)
                
                Button(isEditMode ? "Save" : "Add"){
                    if isEditMode{
                        // edit aircraft
                        myAircraft.nNumber = nNum
                        myAircraft.aircraftType = faaType
                        myAircraft.startHours = Double(startHours) ?? 0
                        myAircraft.startCycles = Int(startCycles) ?? 0
                    } else {
                        myAircraft.nNumber = nNum
                        myAircraft.aircraftType = faaType
                        myAircraft.startHours = Double(startHours) ?? 0
                        myAircraft.startCycles = Int(startCycles) ?? 0
                        context.insert(myAircraft)
                    }
                    dismiss()

                    
                }
                .buttonStyle(.borderedProminent)
                .disabled(nNum.trimmingCharacters(in: .whitespacesAndNewlines) == "")
                .padding()
                if isEditMode{
                    Button("Delete"){
                        // show confirmation dialog
                        showConfirmation = true
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
            }
            .textFieldStyle(.roundedBorder)
            .foregroundStyle(.black)
        }
        .foregroundStyle(.white)
        .confirmationDialog("Really Delete?", isPresented: $showConfirmation, titleVisibility: .visible) {
            Button("Yes, really Delete!"){
                context.delete(myAircraft)
                dismiss()
            }
        }
        .onAppear{
            nNum = myAircraft.nNumber
            faaType = myAircraft.aircraftType
            startHours = String(myAircraft.startHours)
            startCycles = String(myAircraft.startCycles)
        }
    }
    
}
