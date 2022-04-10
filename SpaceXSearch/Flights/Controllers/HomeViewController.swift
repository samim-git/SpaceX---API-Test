//
//  HomeViewController.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/7/22.
//

import UIKit

class HomeViewController: UITabBarController, UITabBarControllerDelegate {

    lazy var customTabBarItem:CustomTabBarMenu = {
       let view = CustomTabBarMenu()
       view.itemSelectedDelegation = self
       view.translatesAutoresizingMaskIntoConstraints = false
       view.backgroundColor = Style.mainColorWhite
       view.dropTopSmallShadow()
       return view
    }()
    
    let statusBackgroundView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Style.mainColorWhite
        return view
    }()
    
    
   override func viewDidLoad() {
       super.viewDidLoad()
       self.view.backgroundColor = UIColor.white

       self.setupViews()
       self.setupTapItems()
       self.createMenuItems()
       
       
    }
    
    func setupViews(){
        self.view.addSubviews(statusBackgroundView,customTabBarItem)
        
        NSLayoutConstraint.activate([
            customTabBarItem.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            customTabBarItem.heightAnchor.constraint(equalToConstant: 70),
            customTabBarItem.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            customTabBarItem.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            statusBackgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            statusBackgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            statusBackgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            statusBackgroundView.topAnchor.constraint(equalTo: customTabBarItem.bottomAnchor)
            
        ])
    }
   
   func setupTapItems(){
       let pastFlightVc = PastFlightViewController()
       let upcomingFlightVc = NextFlightViewController()
       let latestFlightVc = NextFlightViewController()
       let nextFlightVc = NextFlightViewController()
       self.viewControllers = [pastFlightVc,upcomingFlightVc,latestFlightVc,nextFlightVc]
   }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController:ItemSelectedDelegation{
    func onItemSelected(index: Int) {
        self.selectedIndex = index
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    
    
    func createMenuItems(){
        let menuItems:[MenuItem] = [
            MenuItem(title: "Past", id: 0, icon: #imageLiteral(resourceName: "shuttle"),isSelected:true),
            MenuItem(title: "Upcoming", id: 1, icon: #imageLiteral(resourceName: "upcoming")),
            MenuItem(title: "Next", id: 2, icon: #imageLiteral(resourceName: "right")),
            MenuItem(title: "Latest", id: 3, icon: #imageLiteral(resourceName: "last"))
            
        ]
        self.customTabBarItem.menuItems = menuItems
        self.customTabBarItem.defaultIndex = 0
    }
}
