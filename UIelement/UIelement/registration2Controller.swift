//
//  registration2Controller.swift
//  UIelement
//
//  Created by DCS on 22/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class registration2Controller: UIViewController {
    
    private let myPickerView = UIPickerView()
    private let countries = ["India","Canada","Japan","Germany","Switzerland"]
    
    private let myTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password"
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.textColor = .black
        return textField
    }()
    
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text =  "If Your Above 16 Year Then Click On The Button."
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let mySwitche : UISwitch = {
        let switche = UISwitch()
        return switche
    }()
    
    private let myButton : UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        button.layer.cornerRadius = 20
        return button
    } ()
    
    @objc func handleButtonClick(){
        let vc = movieController()
        navigationController?.pushViewController(vc, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title="Create your Account"
        view .backgroundColor = .black
        view.addSubview(myPickerView)
        myPickerView.dataSource = self
        myPickerView.delegate = self
        view.addSubview(myTextField)
        view.addSubview(myLabel)
        view.addSubview(mySwitche)
        view.addSubview(myButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myTextField.frame=CGRect(x: 20, y: 100, width:view.width - 40, height: 40)
        myLabel.frame=CGRect(x: 20, y: myTextField.bottom + 20, width: view.width - 40, height: 40)
        mySwitche.frame=CGRect(x: 20, y: myLabel.bottom + 20, width: view.width - 40, height: 40)
        myButton.frame=CGRect(x: 20, y: mySwitche.bottom + 20, width: view.width - 40, height: 40)
    }
    
}

extension registration2Controller: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
}

