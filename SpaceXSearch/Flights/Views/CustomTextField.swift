//
//  CustomTextField.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/9/22.
//

import UIKit
class CustomTextField : UIView, UITextFieldDelegate {
    
    let titleLbl : UILabel = {
        let lbl = UILabel ()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.gray
        lbl.font = UIFont.systemFont(ofSize: 17)
        return lbl
    }()
    lazy var textField : UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Place Holder"
        field.textColor = UIColor.black
        field.delegate = self
        return field
    }()
    
    let bottomLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubviews(titleLbl,textField,bottomLineView)
        
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: topAnchor),
            titleLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            textField.topAnchor.constraint(equalTo: titleLbl.bottomAnchor,constant: 5),
            textField.bottomAnchor.constraint(equalTo: bottomLineView.topAnchor,constant: -5),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            
            bottomLineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomLineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //bottomLineView.backgroundColor = Style.mainColor
        addDoneButtonOnKeyboard()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        //bottomLineView.backgroundColor = UIColor.darkGray
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        self.textField.inputAccessoryView = doneToolbar
        
//         = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        self.textField.resignFirstResponder()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
