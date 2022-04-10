//
//  ColorExtensions.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/7/22.
//

import UIKit
extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1);
    }
    
    convenience init(colorString: String) {
        let valueArray = colorString.components(separatedBy: ":");
        
        if (valueArray.count < 3) {
            self.init(r: 181/255, g: 181/255, b: 181/255);
        } else {
            self.init(red: CGFloat(Float(valueArray[0])!/255.0), green: CGFloat(Float(valueArray[1])!/255.0), blue: CGFloat(Float(valueArray[2])!/255.0), alpha: 1);
        }
    }
    
    
}

extension Date{
    var millisecondsSince1970:Double {
        return Double((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    init(milliseconds:Double) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    func fromMiliSecondToDate(_ milisecond:Double)->Date{
        return Date(timeIntervalSince1970: TimeInterval(milisecond)/1000)
    }
    
    func getDateDay()->Int{
        let calender = Calendar.init(identifier: Calendar.Identifier.gregorian)
        let component = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: self)
        return component.day!
    }
    func getDateMonth()->Int{
        let calender = Calendar.init(identifier: Calendar.Identifier.gregorian)
        let component = calender.dateComponents([.year, .month, .day, .hour, .minute,.second], from: self)
        return component.month!
    }
    func getDateYer()->Int{
        let calender = Calendar.init(identifier: Calendar.Identifier.gregorian)
        let component = calender.dateComponents([.year, .month, .day, .hour, .minute,.second], from: self)
        return component.year!
    }
    
    func getDateLabel()->String{
        let calender = Calendar.init(identifier: Calendar.Identifier.gregorian)
        let component = calender.dateComponents([.year, .month, .day, .hour, .minute,.second], from: self)
        let monthSymbol = Calendar.current.shortMonthSymbols[component.month! - 1]
        return "\(monthSymbol) \(component.day!),\(component.year!)"
    }
    
    //return 02/03/1996
    func getDateSimpleFormat() ->String{
        let year = self.getDateYer()
        let month = self.getDateMonth()
        let monthStr = month < 10 ? "0\(month)" : "\(month)"
        let day = self.getDateDay()
        let dayStr = day < 10 ? "0\(day)" : "\(day)"
        return "\(year)/\(monthStr)/\(dayStr)"
    }
    func getHourLabel(_ date:Date) -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a "
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        
        let currentDateStr = formatter.string(from: date)
        return currentDateStr
    }
    
    func getHourLabel() -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a "
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        
        let currentDateStr = formatter.string(from: self)
        return currentDateStr
    }
}
