//
//  SearchCareteria.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/9/22.
//

import Foundation
import SwiftUI
struct SearchCariteria {
    var flightNumber : Int = -1
    var missionName : String = ""
    var rocketName : String = ""
    var isSuccess : SuccessType = .both
    var tentativeType : SuccessType = .both
    var limit : Int = 20
    var offset : Int = 1
    var order : OrderType = .desc
    var LaunchDate : Double = 0
    var launchYear : Int = 0
}

enum SuccessType : String  {
    case success = "true", failed = "false", both = "none"
}

enum OrderType : String {
    case asc = "asc", desc = "desc"
}
