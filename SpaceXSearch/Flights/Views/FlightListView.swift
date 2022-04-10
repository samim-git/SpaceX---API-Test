//
//  FlightListView.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/8/22.
//

import UIKit
class FlightListView : UICollectionView,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate {
    
    let cellId = "cellId"
    var flightViewModel : FlightViewModel = FlightViewModel(){
        didSet{
            if flightViewModel.flightsData.isEmpty{
                self.noDataFoundLbl.isHidden = false
            } else {
                self.noDataFoundLbl.isHidden = true
            }
            self.reloadData()
        }
    }
    
    let noDataFoundLbl : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "No Flight Found"
        lbl.isHidden = true
        lbl.font = Style.normalBoldFont
        return lbl
    }()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.delegate = self
        self.dataSource = self
        self.register(FlightCollectionViewCell.self, forCellWithReuseIdentifier: self.cellId)
        self.backgroundColor = UIColor.clear
        
        self.addSubview(noDataFoundLbl)
        NSLayoutConstraint.activate([
            noDataFoundLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            noDataFoundLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension FlightListView{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flightViewModel.flightsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath) as! FlightCollectionViewCell
        cell.flight = flightViewModel.flightsData[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 220)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

