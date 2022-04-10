//
//  FlightCollectionViewCell.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/8/22.
//

import UIKit

class FlightCollectionViewCell: UICollectionViewCell {
    
    var flight:Flight!{
        didSet{
            if let flightNumber = flight.flightNumber{
                self.flightNumberLbl.lbl.text = "\(flightNumber)"
            }
            if let flightDate = flight.lanchedDate{
//                self.dateLbl.text = "\(flightDate)"
                self.dateLbl.text = Date(milliseconds: flightDate).getDateLabel()
            }
            if let missionName = flight.missionName{
                self.missionNameLbl.text = missionName
            }
            if let isTentative = flight.isTentative{
                self.tentativeLbl.text = isTentative ? "Tentative" : "No Tentative"
            }
            if let isSuccess = flight.lanchedSuccess{
                if isSuccess {
                    self.isSuccessLbl.backgroundView.backgroundColor = Style.successColor
                    self.isSuccessLbl.lbl.text = "Success"
                }else{
                    self.isSuccessLbl.backgroundView.backgroundColor = Style.redColor
                    self.isSuccessLbl.lbl.text = "Not Success"
                }
            }
            if let desc = flight.details {
                self.descLbl.text = desc
            } else {
                self.descLbl.text = "No Details"
            }
            if let rocket = flight.rocket {
                if let rocektName = rocket.rocketName{
                    self.rockTypeLbl.text = "Rocket Name: \(rocektName)"
                }
            }
        }
    }
    let flightNumberLbl : LabledView = {
        let lbl = LabledView()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundView.backgroundColor = Style.mainColor
        lbl.lbl.textColor = Style.txtReverseColor
        lbl.backgroundView.layer.cornerRadius = 25
        lbl.lbl.font = Style.normalBoldFont
        return lbl
    }()
    
    let missionNameLbl : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = Style.normalBoldFont
        lbl.textColor = Style.txtNormalColor
        return lbl
    }()
    let tentativeLbl : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.darkGray
        lbl.font = Style.smallFont
        return lbl
    }()
    
    let dateLbl : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.gray
        lbl.font = Style.smallFont
        return lbl
    }()
    
    let descLbl : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 2
        lbl.font = Style.normalFont
        lbl.textColor = UIColor.gray
        lbl.text = "No Details"
        return lbl
    }()
    
    let rockTypeLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.darkGray
        lbl.font = Style.normalFont
        return lbl
    }()
    
    let isSuccessLbl: LabledView = {
        let lbl = LabledView()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundView.backgroundColor = Style.successColor
        lbl.lbl.textColor = Style.txtReverseColor
        lbl.backgroundView.layer.cornerRadius = 12
        lbl.lbl.font = Style.normalFont
        return lbl
    }()
    
    let sepratorLine : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        view.makeDashedBorderLine()
        return view
    }()
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func setupViews(){
        self.contentView.backgroundColor = UIColor.white
        self.contentView.addSubviews(flightNumberLbl,missionNameLbl, dateLbl,tentativeLbl,descLbl,rockTypeLbl,isSuccessLbl, sepratorLine)
        NSLayoutConstraint.activate([
            flightNumberLbl.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 25),
            flightNumberLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15),
            flightNumberLbl.heightAnchor.constraint(equalToConstant: 50),
            flightNumberLbl.widthAnchor.constraint(equalToConstant: 50),
            
            missionNameLbl.centerYAnchor.constraint(equalTo: flightNumberLbl.centerYAnchor,constant: -5),
            missionNameLbl.leadingAnchor.constraint(equalTo: flightNumberLbl.trailingAnchor,constant: 5),
            missionNameLbl.trailingAnchor.constraint(equalTo: dateLbl.leadingAnchor,constant: -10),
            
            tentativeLbl.topAnchor.constraint(equalTo: missionNameLbl.bottomAnchor,constant: 0),
            tentativeLbl.leadingAnchor.constraint(equalTo: missionNameLbl.leadingAnchor),
            
            descLbl.leadingAnchor.constraint(equalTo: flightNumberLbl.leadingAnchor,constant: 0),
            descLbl.topAnchor.constraint(equalTo: flightNumberLbl.bottomAnchor,constant: 15),
            descLbl.trailingAnchor.constraint(equalTo: dateLbl.trailingAnchor),
            
            dateLbl.topAnchor.constraint(equalTo: missionNameLbl.topAnchor),
            dateLbl.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -16),
            dateLbl.widthAnchor.constraint(equalToConstant: 100),
            
            
            
            isSuccessLbl.centerYAnchor.constraint(equalTo: rockTypeLbl.centerYAnchor),
            isSuccessLbl.heightAnchor.constraint(equalToConstant: 32),
            isSuccessLbl.widthAnchor.constraint(equalToConstant: 100),
            isSuccessLbl.leadingAnchor.constraint(equalTo: rockTypeLbl.trailingAnchor,constant: 20),
            isSuccessLbl.bottomAnchor.constraint(equalTo: self.sepratorLine.topAnchor,constant: -25),
            
            rockTypeLbl.centerYAnchor.constraint(equalTo: isSuccessLbl.centerYAnchor),
            rockTypeLbl.leadingAnchor.constraint(equalTo: flightNumberLbl.leadingAnchor,constant: 0),
            
            sepratorLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            sepratorLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            sepratorLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            sepratorLine.heightAnchor.constraint(equalToConstant: 0.8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class LabledView : UIView {
    let backgroundView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let lbl : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(backgroundView,lbl)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            lbl.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            lbl.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
