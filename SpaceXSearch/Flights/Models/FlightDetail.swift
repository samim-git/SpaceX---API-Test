//
//  Flight.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/8/22.
//

import Foundation
import SwiftUI
struct Flight {
    var flightNumber: Int?
    var missionName : String?
//    var lanchedYear: String?
    var lanchedDate: Double?
    var lanchedSuccess: Bool?
    var isTentative: Bool?
    var details: String?
    var ships: [String] = []
    var links: FlightLinks?
    var rocket: Rocket?
    
    
    init(dataDict:[String:Any]){
        if let flightNumber = dataDict[ResponseKeys.flightNumber] as? Int{
            self.flightNumber = flightNumber
        }
        if let missionName = dataDict[ResponseKeys.messionName] as? String{
            self.missionName = missionName
        }
        if let date = dataDict[ResponseKeys.launchDate] as? Double{
            self.lanchedDate = date
        }
        if let isSuccess = dataDict[ResponseKeys.launchSuccess] as? Bool{
            self.lanchedSuccess = isSuccess
        }
        if let isTentative = dataDict[ResponseKeys.isTentative] as? Bool{
            self.isTentative = isTentative
        }
        if let details = dataDict[ResponseKeys.details] as? String{
            self.details = details
        }
        
        if let ship = dataDict[ResponseKeys.ships] as? [String] {
            self.ships = ship
        }
        
        if let links = dataDict[ResponseKeys.links] as? [String : Any] {
            self.links = FlightLinks(dataDict: links)
        }
        if let rocket = dataDict[ResponseKeys.rocket] as? [String : Any] {
            self.rocket = Rocket(dataDict: rocket)
        }
        
    }
    
}

struct FlightLinks {
    var mission: String?
    var artical: String?
    var wiki: String?
    var video: String?
    var flickerImages: [String] = []
    
    init(dataDict:[String:Any]){
        if let mission = dataDict[ResponseKeys.missionPath] as? String {
            self.mission = mission
        }
        if let artical = dataDict[ResponseKeys.artical] as? String {
            self.artical = artical
        }
        
        if let wiki = dataDict[ResponseKeys.wikipedia] as? String {
            self.wiki = wiki
        }
        
        if let video = dataDict[ResponseKeys.videoLink] as? String {
            self.video = video
        }
        
        if let images = dataDict[ResponseKeys.images] as? [String] {
            self.flickerImages = images
        }
    }
}
struct Rocket {
    var rocketId: String?
    var rocketType: String?
    var rocketName: String?
    init(dataDict:[String:Any]){
        if let rocketId = dataDict[ResponseKeys.rocketId] as? String {
            self.rocketId = rocketId
        }
        if let rocketType = dataDict[ResponseKeys.rocketType] as? String {
            self.rocketType = rocketType
        }
        
        if let rocketName = dataDict[ResponseKeys.rocketName] as? String {
            self.rocketName = rocketName
        }
        
    }
}
