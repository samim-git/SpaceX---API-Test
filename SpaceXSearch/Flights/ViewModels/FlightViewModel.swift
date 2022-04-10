//
//  FlightViewModel.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/9/22.
//

import Foundation
class FlightViewModel : NSObject{
    private (set) var flightsData : [Flight]! {
        didSet{
            self.bindViewmodelToVc()
        }
    }
    var bindViewmodelToVc : (() -> ()) = {}
    
    
    override init() {
        super.init()
    }
    
    
    func getPastFlight(_ searchCariteria: SearchCariteria! = nil) {
        var searchUrl : String = APIs.pastLaunchUrl
        if searchCariteria != nil {
            searchUrl.append("?limit=\(searchCariteria.limit)")
            searchUrl.append("&offset=\(searchCariteria.offset)")
            searchUrl.append("&order=\(searchCariteria.order.rawValue)")
            searchUrl.append("&mission_name=\(searchCariteria.missionName)")
            if searchCariteria.flightNumber != -1 {
                searchUrl.append("&flight_number=\(searchCariteria.flightNumber)")
            }
            if searchCariteria.isSuccess != .both{
                searchUrl.append("&launch_success=\(searchCariteria.isSuccess.rawValue)")
            }
            if searchCariteria.tentativeType != .both {
                searchUrl.append("&is_tentative=\(searchCariteria.tentativeType.rawValue)")
            }
            searchUrl.append("&rocket_name=\(searchCariteria.rocketName)")
            if searchCariteria.LaunchDate != 0 {
                searchUrl.append("&launch_date=\(searchCariteria.LaunchDate)")
            }
            if searchCariteria.launchYear != 0 {
                searchUrl.append("&launch_year=\(searchCariteria.launchYear)")
            }
        } else {
            searchUrl.append("?limit=30")
            searchUrl.append("&offset=1")
            searchUrl.append("&order=\(OrderType.desc.rawValue)")
        }
        searchUrl = searchUrl.replacingOccurrences(of: " ", with: "%20")
        print("encoded url: \(searchUrl)")
        RequestHelper.request(api: searchUrl, method: .get) { response in
            var tempList : [Flight] = []
            if let resultData = response{
                for result in resultData {
                    tempList.append(Flight(dataDict: result))
                }
                self.flightsData = tempList
            }
            
        }
        
    }
}
