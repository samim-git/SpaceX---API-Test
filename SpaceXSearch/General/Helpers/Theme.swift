//
//  Theme.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/7/22.
//

import UIKit

enum Theme: String {
    case default_ = "default"
    case dark_ = "dark"
    
    static var currentTheme: Theme {
        get {
            if UserDefaults.standard.value(forKey: KeyStrings.currentThemeKey) != nil {
                return Theme(rawValue: UserDefaults.standard.value(forKey: KeyStrings.currentThemeKey) as! String)!
            } else {
                return Theme.default_
            }
        }
        set {
            Style.setupTheme(theme: newValue)
        }
    }
    
}
struct Style {
    
    private static let boldFont = "BahijHelveticaNeue75Bold";
    private static let regularFont = "BahijHelveticaNeue" // Bahij;
    private static let thinFont = "BahijHelveticaNeue";
    private static let lightFont = "BahijHelveticaNeue";
    private static let mediumFont = "BahijHelveticaNeue";
    
//    private static let boldFont = "Snell-Roundhand-Bold";
//    private static let regularFont = "Snell-Roundhand-Regular"
//    private static let thinFont = "Snell-Roundhand-Regular";
//    private static let lightFont = "Snell-Roundhand-Regular";
//    private static let mediumFont = "Snell-Roundhand-Regular";
    
    // ======= Colors ============
    static var mainColor: UIColor!
    static var mainColorText: UIColor!
    static var mainColorWhite: UIColor!
    static var mainBackgroundColor:UIColor!
    static var grayColor:UIColor!
    static var mainDarkColor: UIColor!
    static var lightGrayColor: UIColor!
    static var redColor:UIColor!
    static var successColor:UIColor!
    static var txtNormalColor:UIColor!
    static var txtReverseColor:UIColor!
    //--- not used yet ------//
    static var blueLightColor: UIColor!
    
    static var facebookColor: UIColor!
    static var differColor: UIColor!
    static var grayTextColor: UIColor!
    
    static var blueColor: UIColor!
    static var lightGrayBackground: UIColor!
    static var lightGrayTextColor: UIColor!
    static var minBackground : UIColor!
    static var minBackgroundDark : UIColor!
    static var yellowColor: UIColor!
    static var yellowDarkColor: UIColor!
    static var greenColor : UIColor!
    static var darkGreenColor : UIColor!
    static var nomralTextColor: UIColor!
    static var transparentBackgroundColor: UIColor!
    static var hesabPayColor: UIColor!
    
    
    // ======= Fonts =============
    static var titleNormalFont:UIFont!
    static var titleSmNormalFont:UIFont!
    static var titleSmBoldFont:UIFont!
    static var titleBoldFont:UIFont!
    static var smallFont: UIFont!
    static var normalFont: UIFont!
    static var normalBoldFont: UIFont!
    static var bigFont: UIFont!
    static var bigBoldFont: UIFont!
    
    //---- not used yet -----//
    static var extraLargeFont: UIFont!
    static var veryBigFont: UIFont!
    
    static var biggerFont: UIFont!
    static var biggerBoldFont: UIFont!
    
    static var smallBoldFont: UIFont!
    static var smallerFont: UIFont!
    static var smallerBoldFont: UIFont!
    static var miniFont: UIFont!
    
    static func setupTheme(theme: Theme){
        UserDefaults.standard.setValue(theme.rawValue, forKey: KeyStrings.currentThemeKey);
        switch theme {
            case .dark_:
                setupDefaultTheme()
            default:
                setupDarkTheme()
        }
    }
    
    private static func setupDarkTheme(){
        // Not implemented
        setupDefaultTheme()
    }
    
    private static func setupDefaultTheme(){
        
        // -------- Colors ----------------
        mainColor = UIColor(r: 28, g: 44, b: 60)
        mainDarkColor = UIColor(r: 18, g: 28, b: 38)
        mainColorText = UIColor.lightText
        mainColorWhite = UIColor.white
        mainBackgroundColor = UIColor.white
        grayColor = UIColor.gray
        lightGrayColor = UIColor(r: 247, g: 247, b: 247);
        redColor = UIColor(r: 200, g: 35, b: 43)
        successColor = UIColor(r: 87, g: 199, b: 22)
        txtNormalColor = UIColor.black
        txtReverseColor = UIColor.white
        
        
        
        
        blueLightColor = UIColor(r:108, g:181, b:255)
        facebookColor = UIColor(r: 25, g: 117, b: 210)
        lightGrayBackground = UIColor(r: 242, g: 246, b: 250);
        lightGrayTextColor = UIColor(r: 11, g: 50, b: 90).withAlphaComponent(0.45);
        blueColor = UIColor(r: 16, g: 127, b: 232);
        differColor = UIColor(r: 255, g: 67, b: 67);
        minBackground = UIColor(r: 250, g: 250, b: 250);
        minBackgroundDark = UIColor(r: 244, g: 244, b: 244);
        greenColor = UIColor(r: 0, g: 122, b: 33);
        darkGreenColor = UIColor(r: 0, g: 64, b: 17);
        grayTextColor = UIColor.darkGray;
        
        nomralTextColor = UIColor(r: 31, g: 71, b: 98);
        transparentBackgroundColor = UIColor(r: 28, g: 44, b: 60).withAlphaComponent(0.9);
        yellowColor =  UIColor(r: 254, g: 246, b: 225);
        yellowDarkColor =  UIColor(r: 240, g: 176, b: 0);
        hesabPayColor = UIColor(r: 27, g: 117, b: 188)
        
        
        // -------- Fonts ----------------
        titleNormalFont = UIFont.systemFont(ofSize: 30)
        titleBoldFont = UIFont.boldSystemFont(ofSize: 30)
        titleSmNormalFont = UIFont.systemFont(ofSize: 20)
        titleSmBoldFont = UIFont.boldSystemFont(ofSize: 25)
        smallFont = UIFont.systemFont(ofSize: 14)
        normalFont = UIFont.systemFont(ofSize: 16)
        normalBoldFont = UIFont.boldSystemFont(ofSize: 16)
        bigFont = UIFont.systemFont(ofSize: 25);
        bigBoldFont = UIFont.boldSystemFont(ofSize: 25)
        
        
        
        miniFont = UIFont.systemFont(ofSize: 10)
        biggerFont = UIFont(name: regularFont, size: 26);
        biggerBoldFont = UIFont(name: boldFont, size: 26);
    }
}
