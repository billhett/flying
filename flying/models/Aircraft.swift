//
//  Aircraft.swift
//  flying
//
//  Created by bill on 11/14/25.
//

import Foundation
import SwiftData

@Model

class Aircraft: Identifiable {
    @Attribute(.unique) var id: String
    
    var nNumber: String = ""
    
    var startHours: Double = 0
    var startCycles: Int = 0
    var aircraftType: String = ""
    //var flights: [Flight] = [Flight]()
    @Relationship(deleteRule: .cascade, inverse: \Flight.aircraft) var flights: [Flight] = [Flight]()
    var totalTime: Double = 0
    var totalCycles: Int = 0
    var lastApt: String = ""
    var lastHobbs: Double = 0
    
    
    init(){
        id = UUID().uuidString
    }
    
}
