//
//  ImageButton.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/10/22.
//

import UIKit
class ImageButton : UIButton {
     var iconView:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = Style.grayColor
        view.contentMode = .scaleToFill
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews(iconView)
        
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            iconView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            iconView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
