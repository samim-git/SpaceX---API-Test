//
//  SearchView.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/9/22.
//

import UIKit

protocol SearchViewDelegate {
    func onClose()
    func onSearch(searchChareteria: SearchCariteria)
}
class SearchView : UIView, UIPopoverControllerDelegate, UIPopoverPresentationControllerDelegate, PopOverItemDelegate {
    
    
    var delegate : SearchViewDelegate!
    
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Style.mainColorWhite
        view.layer.cornerRadius = 10
        return view
    }()
    let searchLbl : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.darkGray
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.text = "Seach cariteria :"
        return lbl
    }()
    
    let flightNumberFiled: CustomTextField = {
        let field = CustomTextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.titleLbl.text = "Flight Number"
        field.textField.placeholder = "Flight Number"
        field.textField.keyboardType = .numberPad
        return field
    }()
    
    let flightNameField: CustomTextField = {
        let field = CustomTextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.titleLbl.text = "Mission Name"
        field.textField.placeholder = "Mission Name"
        field.textField.keyboardType = .alphabet
        return field
    }()
    
    let rocketName: CustomTextField = {
        let field = CustomTextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.titleLbl.text = "Rocket Name"
        field.textField.placeholder = "Rocket Name"
        field.textField.keyboardType = .alphabet
        return field
    }()
    
    let flightYearField: CustomTextField = {
        let field = CustomTextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.titleLbl.text = "Flight Year"
        field.textField.placeholder = "Flight Year"
        field.textField.keyboardType = .numberPad
        return field
    }()
    lazy var launchSuccesslbl: CustomTextField = {
        let field = CustomTextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.titleLbl.text = "Launch Status"
        field.textField.placeholder = "Launch Status"
        field.textField.keyboardType = .alphabet
        field.textField.isEnabled = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.showPopup))
        field.addGestureRecognizer(tap)
        return field
    }()

    lazy var searchBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = Style.mainColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Search", for: .normal)
        btn.layer.cornerRadius = 25
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action: #selector(prepareForSearch), for: .touchUpInside)
        return btn
    }()
    
    lazy var closeBtn:ImageButton = {
        let view = ImageButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.iconView.image = UIImage(named: "close")
        view.addTarget(self, action: #selector(closeMe), for: .touchUpInside)
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        self.addSubviews(containerView)
        containerView.addSubviews(searchLbl, closeBtn ,flightNameField, flightNumberFiled,rocketName, flightYearField, launchSuccesslbl, searchBtn)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
            
            
            searchLbl.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 20),
            searchLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 15),
            
            closeBtn.centerYAnchor.constraint(equalTo: searchLbl.centerYAnchor),
            closeBtn.trailingAnchor.constraint(equalTo: flightNameField.trailingAnchor),
            closeBtn.widthAnchor.constraint(equalToConstant: 35),
            closeBtn.heightAnchor.constraint(equalToConstant: 35),

            flightNameField.leadingAnchor.constraint(equalTo: searchLbl.leadingAnchor, constant: 10),
            flightNameField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25),
            flightNameField.topAnchor.constraint(equalTo: searchLbl.bottomAnchor, constant: 20),
            flightNameField.heightAnchor.constraint(equalToConstant: 70),
            
            flightNumberFiled.topAnchor.constraint(equalTo: flightNameField.bottomAnchor,constant: 20),
            flightNumberFiled.leadingAnchor.constraint(equalTo: flightNameField.leadingAnchor),
            flightNumberFiled.heightAnchor.constraint(equalToConstant: 70),
            flightNumberFiled.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -40),
            
            
            rocketName.topAnchor.constraint(equalTo: flightNumberFiled.topAnchor,constant: 0),
            rocketName.leadingAnchor.constraint(equalTo: flightNumberFiled.trailingAnchor, constant: 20),
            rocketName.heightAnchor.constraint(equalToConstant: 70),
            rocketName.trailingAnchor.constraint(equalTo: flightNameField.trailingAnchor, constant: 0),
            
            flightYearField.topAnchor.constraint(equalTo: flightNumberFiled.bottomAnchor,constant: 20),
            flightYearField.leadingAnchor.constraint(equalTo: flightNameField.leadingAnchor),
            flightYearField.heightAnchor.constraint(equalToConstant: 70),
            flightYearField.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -40),
            
            
            launchSuccesslbl.topAnchor.constraint(equalTo: flightYearField.topAnchor,constant: 0),
            launchSuccesslbl.leadingAnchor.constraint(equalTo: flightNumberFiled.trailingAnchor, constant: 20),
            launchSuccesslbl.heightAnchor.constraint(equalToConstant: 70),
            launchSuccesslbl.trailingAnchor.constraint(equalTo: flightNameField.trailingAnchor, constant: 0),
            
            searchBtn.trailingAnchor.constraint(equalTo: flightNameField.trailingAnchor),
            searchBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -30),
            searchBtn.heightAnchor.constraint(equalToConstant: 50),
            searchBtn.widthAnchor.constraint(equalToConstant: 100)
            
        ])
    }
    
    @objc func showPopup(){
        let popoverContent = PopupViewController()
        let nav = UINavigationController(rootViewController: popoverContent)
        nav.modalPresentationStyle = UIModalPresentationStyle.popover
        let popover = nav.popoverPresentationController!
        popoverContent.preferredContentSize = CGSize(width: 150, height: 100)
        popoverContent.items = ["Success Launches","Failed Launches", "All"]
        popoverContent.tag = 2
        popoverContent.popDelegate = self
        popover.delegate = self
        popover.sourceView = self.launchSuccesslbl
        popover.sourceRect = CGRect(x: self.launchSuccesslbl.bounds.width/2, y: self.launchSuccesslbl.bounds.height/2, width: 0, height: 0)
        self.parentViewController!.present(nav, animated: true, completion: nil)
    }
    
    @objc func prepareForSearch(){
        var searchCariteria = SearchCariteria()
        if let flightNum = flightNumberFiled.textField.text{
            searchCariteria.flightNumber = Int(flightNum) ?? -1
        }
        if let flightYear = flightYearField.textField.text {
            searchCariteria.launchYear = Int(flightYear) ?? 0
        }
        
        if let rocketName = rocketName.textField.text {
            searchCariteria.rocketName = rocketName
        }
        if let missionName = flightNameField.textField.text {
            searchCariteria.missionName = missionName
        }
        searchCariteria.isSuccess = successStatus
        
        
        if delegate != nil{
            delegate.onSearch(searchChareteria: searchCariteria)
//            disMissMe()
        }
    }
    
    
    @objc func closeMe(){
        self.delegate.onClose()
    }
    var successStatus : SuccessType = .both
    func onItemClicked(value: String, index: Int, tag: Int) {
        self.launchSuccesslbl.textField.text = value
        switch index {
        case 0:
            successStatus = .success
        case 1:
            successStatus = .failed
        default:
            successStatus = .both
        }
    }
    
    func resetMe(){
        self.flightNameField.textField.text = ""
        self.flightYearField.textField.text = ""
        self.flightNumberFiled.textField.text = ""
        self.rocketName.textField.text = ""
        self.launchSuccesslbl.textField.text = ""
        self.successStatus = .both
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
