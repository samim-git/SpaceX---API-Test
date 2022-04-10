//
//  MenuItem.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/7/22.
//


import UIKit
struct MenuItem{
    var title:String?
    var id:Int?
    var icon:UIImage?
    var iconTintColor:UIColor = Style.grayColor
    var iconActiveTintColor:UIColor = Style.mainColor
    var textColor:UIColor = Style.grayColor
    var textActiveColor:UIColor = Style.mainColor
    var isSelected:Bool = false
    var showHint:Bool = false
    var hintColor:UIColor = UIColor.red
}
