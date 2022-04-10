//
//  CustomTabbarMenue.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/7/22.
//

import UIKit

@objc protocol ItemSelectedDelegation {
    
    @objc optional func onItemSelected(index:Int)
    @objc optional func onItemSelected(index:Int,value:String)
}

class CustomTabBarMenu:UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    var itemSelectedDelegation:ItemSelectedDelegation!
    var menuItems:[MenuItem] = []{
        didSet{
            self.menuview.reloadData()
        }
    }
    let cellId = "cellIdForEachCell"
    var defaultIndex:Int = 0{
        didSet{
            self.menuview.selectItem(at: IndexPath(item: self.defaultIndex, section: 0), animated: true, scrollPosition: .top)
        }
    }
    let containerView:UIView = {
        let view =  UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var menuview:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
//        view.selectItem(at: IndexPath(item: self.defaultIndex, section: 0), animated: true, scrollPosition: .top)
        view.backgroundColor = Style.mainColorWhite
        view.register(TabItemCell.self, forCellWithReuseIdentifier: self.cellId)
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        
    }
    func setupViews(){
        addSubview(containerView)
        containerView.addSubview(menuview)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            menuview.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 1.5),
            menuview.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            menuview.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            menuview.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath) as! TabItemCell
        cell.item = self.menuItems[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.itemSelectedDelegation != nil{
            self.itemSelectedDelegation.onItemSelected!(index: self.menuItems[indexPath.item].id!)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width/CGFloat(self.menuItems.count), height: self.frame.height - 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
private class TabItemCell:UICollectionViewCell{
    override var isSelected: Bool{
        didSet{
            if isSelected{
                if let item = self.item{
                    iconView.tintColor = item.iconActiveTintColor
                    menuLbl.textColor = item.textActiveColor
                }
                
            }else{
                if let item = self.item{
                    iconView.tintColor = item.iconTintColor
                    menuLbl.textColor = item.textColor
                }
            }
        }
    }
    var item:MenuItem! = nil{
        didSet{
            if let item = item{
                if let title = item.title{
                    self.menuLbl.text = title
                }
                if let img = item.icon{
                    self.iconView.image = img.withRenderingMode(.alwaysTemplate)
                }
                self.iconView.tintColor = self.item.iconTintColor
                if item.isSelected{
                    iconView.tintColor = item.iconActiveTintColor
                    menuLbl.textColor = item.textActiveColor
                }else{
                    iconView.tintColor = item.iconTintColor
                    menuLbl.textColor = item.textColor
                }
            }
        }
    }
    let containrView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let iconView:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = Style.grayColor
        view.contentMode = .scaleToFill
        return view
    }()
    let menuLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.textColor = Style.grayColor
        lbl.font = Style.smallFont
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(containrView)
        containrView.addSubview(iconView)
        containrView.addSubview(menuLbl)
        
        makeViewLabaled(view: iconView, lblView: menuLbl, padding: (5,5,5,5), lblPadding: 3,lblHeight:20)
        NSLayoutConstraint.activate([
            containrView.topAnchor.constraint(equalTo: self.topAnchor),
            containrView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containrView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containrView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            menuLbl.leadingAnchor.constraint(equalTo: containrView.leadingAnchor,constant: 5),
            menuLbl.trailingAnchor.constraint(equalTo: containrView.trailingAnchor,constant: -5),
            menuLbl.bottomAnchor.constraint(equalTo: containrView.bottomAnchor,constant: -5),
            menuLbl.heightAnchor.constraint(equalToConstant: 20),
            
            iconView.topAnchor.constraint(equalTo: containrView.topAnchor,constant: 5),
            iconView.centerXAnchor.constraint(equalTo: containrView.centerXAnchor,constant: 0),
            iconView.bottomAnchor.constraint(equalTo: menuLbl.topAnchor,constant: -3),
            iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor)
            
        ])
        
    }
    func makeViewLabaled(view:UIView,lblView:UIView,padding:(top:CGFloat,leading:CGFloat,bottom:CGFloat,trailing:CGFloat) = (0,0,0,0), lblPadding:CGFloat = 0,lblHeight:CGFloat = 0){
            addSubview(view)
            addSubview(lblView)
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
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
