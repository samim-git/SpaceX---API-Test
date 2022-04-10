//
//  PopupViewController.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/9/22.
//

import UIKit
protocol PopOverItemDelegate {
    func onItemClicked(value:String, index:Int, tag:Int)
}
class PopupViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var popDelegate:PopOverItemDelegate!
    var tag:Int = 0
    var items:[String] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.font = Style.normalFont
        cell.textLabel?.textColor = UIColor.darkGray
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        popDelegate.onItemClicked(value: items[indexPath.row], index: indexPath.row, tag:self.tag)
        self.dismiss(animated: true, completion: nil)
    }

    let tableView:UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

}
