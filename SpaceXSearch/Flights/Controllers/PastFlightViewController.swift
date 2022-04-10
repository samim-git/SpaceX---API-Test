//
//  PastFlightViewController.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/7/22.
//

import UIKit
import SwiftUI

class PastFlightViewController: UIViewController, ItemSelectedDelegation {

    let statusBackgroundView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    lazy var customActionBarView:CustomActionBarView = {
        let view = CustomActionBarView()
        view.itemSelectedDelegation = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titleComps = ("Last 30 Flightsr",Style.titleSmBoldFont,Style.mainColor)
        let menuItems:[MenuItem] = [
            MenuItem(title: "", id: 0, icon: #imageLiteral(resourceName: "search2"),iconTintColor:Style.grayColor)
        ]
        view.menuItems = menuItems
        return view
    }()
        
    let flightsView : FlightListView = {
        let view: FlightListView = FlightListView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var flightViewModel : FlightViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        getDefaultSearch()
        self.flightViewModel.bindViewmodelToVc = {
            self.flightsView.flightList = self.flightViewModel.flightsData
        }
        
    }
    
    func setupView(){
        self.view.addActionBarViewWithStatus(viewComps: (customActionBarView,70),marginFromTop:20)
        self.view.addSubviews(flightsView)
        NSLayoutConstraint.activate([
            flightsView.topAnchor.constraint(equalTo: self.customActionBarView.bottomAnchor),
            flightsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            flightsView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            flightsView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }
    
    func getDefaultSearch(){
        doSearch(searchCariteria: nil)
    }
    
    func doSearch(searchCariteria : SearchCariteria!){
        self.flightViewModel = FlightViewModel()
        self.flightViewModel.getPastFlight(searchCariteria)
    }
    
    func onItemSelected(index: Int) {
        print("indexxxxxx: \(index)")
    }
}
