//
//  Flight.swift
//  flying
//
//  Created by bill on 11/14/25.
//

import Foundation
import SwiftData

@Model

class Flight: Identifiable {
    
    @Attribute(.unique) var id: String

    var date: Date = Date()
    var depApt: String = ""
    var arrApt: String = ""
    var startHobbs: Double = 0
    var endHobbs: Double = 0
    var startFuel: Int = 0
    var endFuel: Int = 0
    var aircraftNNum: String = ""
    // calculated
    var aircraft: Aircraft?
    var flightTime: Double = 0
    var flightFuel: Int = 0
    var endTT: Double = 0
    var endCycles: Int = 0
    
    init(){
        id = UUID().uuidString
        
        
    }
    
}
