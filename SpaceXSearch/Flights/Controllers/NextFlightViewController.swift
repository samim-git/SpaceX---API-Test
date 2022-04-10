//
//  NextFlightViewController.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/10/22.
//

import UIKit

class NextFlightViewController: UIViewController {

    let notLbl : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Not implemented"
        lbl.font = Style.bigFont
        return lbl
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(notLbl)
        notLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        notLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // Do any additional setup after loading the view.
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
