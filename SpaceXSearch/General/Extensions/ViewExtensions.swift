//
//  ViewExtensions.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/7/22.
//

import UIKit
extension UIView {
    func dropShadow(offset: CGSize = CGSize(width: 0, height: -2), color: UIColor = UIColor.black, radius: CGFloat = 4.0, opacity: Float = 0.08) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
    func dropShadow() {
        self.layer.masksToBounds = false
        //        self.layer.cornerRadius = 7;
        self.layer.shadowOffset = CGSize(width: -1, height: 2)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.4
    }
    
    func dropTopSmallShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0, height: -2)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.15
    }
    func dropSmallShadow() {
        self.layer.masksToBounds = false
        //        self.layer.cornerRadius = 7;
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.1
    }
    func dropMdShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: -1, height: 0)
        self.layer.shadowRadius = 2.5
        self.layer.shadowOpacity = 0.2
    }
    func roundCorners(corners:CACornerMask, radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = corners
    }
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
    
    private static let lineDashPattern: [NSNumber] = [4, 4]
    private static let lineDashWidth: CGFloat = 2.0

    func makeDashedBorderLine() {
        let path = CGMutablePath()
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = UIView.lineDashWidth
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineDashPattern = UIView.lineDashPattern
        path.addLines(between: [CGPoint(x: bounds.minX, y: bounds.height/2),
                                CGPoint(x: bounds.maxX, y: bounds.height/2)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
    
    
    func addFullContaintAnchor(to:UIView,padding:(top:CGFloat,leading:CGFloat,bottom:CGFloat,trailing:CGFloat) = (0,0,0,0),isRtlNeeded:Bool = true){
        self.topAnchor.constraint(equalTo: to.topAnchor,constant: padding.top).isActive = true
        self.bottomAnchor.constraint(equalTo: to.bottomAnchor,constant: -padding.bottom).isActive = true
        if isRtlNeeded{
            self.leadingAnchor.constraint(equalTo: to.leadingAnchor,constant: padding.leading).isActive = true
            self.trailingAnchor.constraint(equalTo: to.trailingAnchor,constant: -padding.trailing).isActive = true
        }else{
            self.leftAnchor.constraint(equalTo: to.leftAnchor,constant: padding.leading).isActive = true
            self.rightAnchor.constraint(equalTo: to.rightAnchor,constant: -padding.trailing).isActive = true
        }
    }
    
    func makeViewLabaled(view:UIView,lblView:UIView,direction:Direction = .top,padding:(top:CGFloat,leading:CGFloat,bottom:CGFloat,trailing:CGFloat) = (0,0,0,0), lblPadding:CGFloat = 0,lblHeight:CGFloat = 0){
        addSubview(view)
        addSubview(lblView)
        switch direction {
        case .leading:

            view.topAnchor.constraint(equalTo: topAnchor,constant: padding.top).isActive = true
            view.leadingAnchor.constraint(equalTo: leadingAnchor,constant: padding.leading).isActive = true
            view.bottomAnchor.constraint(equalTo: lblView.topAnchor,constant: -padding.bottom).isActive = true
            view.widthAnchor.constraint(equalTo: view.heightAnchor).isActive = true
            
            lblView.leadingAnchor.constraint(equalTo: view.trailingAnchor,constant: lblPadding).isActive = true
            lblView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding.trailing).isActive = true
            lblView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 0).isActive = true
            if lblHeight > 0{
                lblView.heightAnchor.constraint(equalToConstant: lblHeight).isActive = true
            }
            
            break
        case .trailing:
            view.topAnchor.constraint(equalTo: topAnchor,constant: padding.top).isActive = true
            view.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding.trailing).isActive = true
            view.bottomAnchor.constraint(equalTo: lblView.topAnchor,constant: -padding.bottom).isActive = true
            view.widthAnchor.constraint(equalTo: view.heightAnchor).isActive = true
            
            lblView.trailingAnchor.constraint(equalTo: view.leadingAnchor,constant: -lblPadding).isActive = true
            lblView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: padding.leading).isActive = true
            lblView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 0).isActive = true
            if lblHeight > 0{
                lblView.heightAnchor.constraint(equalToConstant: lblHeight).isActive = true
            }
            break
        case.bottom:
            lblView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: padding.leading).isActive = true
            lblView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding.trailing).isActive = true
            lblView.topAnchor.constraint(equalTo: topAnchor,constant: padding.top).isActive = true
            if lblHeight > 0{
                lblView.heightAnchor.constraint(equalToConstant: lblHeight).isActive = true
            }
            
            view.topAnchor.constraint(equalTo: lblView.bottomAnchor,constant: lblPadding).isActive = true
            view.centerXAnchor.constraint(equalTo: centerXAnchor,constant: 0).isActive = true
            view.bottomAnchor.constraint(equalTo:bottomAnchor,constant: -padding.bottom).isActive = true
            view.widthAnchor.constraint(equalTo: view.heightAnchor).isActive = true
            break
        default:
            //
            lblView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: padding.leading).isActive = true
            lblView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding.trailing).isActive = true
            lblView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -padding.bottom).isActive = true
            if lblHeight > 0{
                lblView.heightAnchor.constraint(equalToConstant: lblHeight).isActive = true
            }
            
            view.topAnchor.constraint(equalTo: topAnchor,constant: padding.top).isActive = true
            view.centerXAnchor.constraint(equalTo: centerXAnchor,constant: 0).isActive = true
            view.bottomAnchor.constraint(equalTo: lblView.topAnchor,constant: -lblPadding).isActive = true
            view.widthAnchor.constraint(equalTo: view.heightAnchor).isActive = true
            
        }
    }
    
    func addActionBarViewWithStatus(viewComps:(actionBarView:UIView,actionBarHeight:CGFloat),statusBarColor:UIColor = Style.mainColorWhite, isRtlNeeded:Bool = true, marginFromTop:CGFloat = 0){
        let statusBackgroundView:UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor.white
            return view
        }()
        self.addSubview(statusBackgroundView)
        self.addSubview(viewComps.actionBarView)
        
        if isRtlNeeded{
            viewComps.actionBarView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            viewComps.actionBarView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        }else{
            viewComps.actionBarView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            viewComps.actionBarView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        }
        
        viewComps.actionBarView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: marginFromTop).isActive = true
        viewComps.actionBarView.heightAnchor.constraint(equalToConstant: viewComps.actionBarHeight).isActive = true
        
        statusBackgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        statusBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        statusBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        statusBackgroundView.bottomAnchor.constraint(equalTo: viewComps.actionBarView.topAnchor).isActive = true
        statusBackgroundView.backgroundColor = statusBarColor
    }
}
enum Direction: Int{
    case top = 1, leading = 2, bottom = 3,trailing = 4,left = 5, right = 6
}
