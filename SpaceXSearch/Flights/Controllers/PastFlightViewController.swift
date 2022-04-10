//
//  PastFlightViewController.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/7/22.
//

import UIKit
//import SwiftUI
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
    
    lazy var searchView : SearchView = {
        let view = SearchView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        view.delegate = self
        return view
    }()
    
    var flightViewModel : FlightViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        getDefaultSearch()
    }
    
    func setupView(){
        self.view.addActionBarViewWithStatus(viewComps: (customActionBarView,70),marginFromTop:20)
        self.view.addSubviews(flightsView,searchView)
        
        NSLayoutConstraint.activate([
            flightsView.topAnchor.constraint(equalTo: self.customActionBarView.bottomAnchor),
            flightsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -70),
            flightsView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            flightsView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            
            searchView.topAnchor.constraint(equalTo: flightsView.topAnchor),
            searchView.bottomAnchor.constraint(equalTo: flightsView.bottomAnchor, constant: -30),
            searchView.leadingAnchor.constraint(equalTo: flightsView.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: flightsView.trailingAnchor)
            
        ])
    }
    
    func getDefaultSearch(){
        doSearch(searchCariteria: nil)
    }
    
    func doSearch(searchCariteria : SearchCariteria!){
        self.view.startActivityIndicator()
        self.flightViewModel = FlightViewModel()
        self.flightViewModel.bindViewmodelToVc = {
            self.view.stopActivityIndicator()
            self.flightsView.flightList = self.flightViewModel.flightsData
        }
        self.flightViewModel.getPastFlight(searchCariteria)
    }
    
    func onItemSelected(index: Int) {
        if index == 0 {
            searchView.isHidden = false
        } else {
            self.searchView.resetMe()
            self.customActionBarView.menuItems.remove(at: 1)
            self.doSearch(searchCariteria: nil)
            customActionBarView.titleView.text = "Last 30 Flights"
        }
    }
}

extension PastFlightViewController : SearchViewDelegate{
    func onClose() {
        self.searchView.isHidden = true
    }
    
    func onSearch(searchChareteria: SearchCariteria) {
        self.searchView.isHidden = true
        doSearch(searchCariteria: searchChareteria)
        customActionBarView.titleView.text = "Search Result"
        self.customActionBarView.menuItems.append(
            MenuItem(title: "", id: 1, icon: #imageLiteral(resourceName: "reset"),iconTintColor:Style.grayColor)
        )
    }
}
