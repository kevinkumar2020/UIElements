//
//  registration1Controller.swift
//  UIelement
//
//  Created by DCS on 22/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class registration1Controller: UIViewController {
    
    private let myTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Your Name"
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.textColor = .black
        return textField
    }()
    
    private let myTextView:UITextView = {
        let textView = UITextView()
        textView.text = "Enter Your Email"
        textView.textAlignment = .center
        textView.backgroundColor = .white
        textView.textColor = .black
        return textView
    }()
    
    private let DOB:UILabel = {
        let label=UILabel()
        label.text =  "Select Date Of Birth"
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let myDatePicker:UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        datePicker.addTarget(self, action: #selector(handleDateChange),for: .valueChanged)
        return datePicker
    }()
    
    @objc func handleDateChange(){
        print(myDatePicker.date)
    }
    
    private let gender:UILabel = {
        let label = UILabel()
        label.text =  "Select Your Gender"
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let mySegmentedControl:UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.insertSegment(withTitle: "Male", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Female", at: 1, animated: true)
        segmentedControl.selectedSegmentIndex=0
        segmentedControl.addTarget(self, action: #selector(handleSegment), for: .valueChanged)
        return segmentedControl
    }()
    
    @objc func handleSegment(){
        print(mySegmentedControl.selectedSegmentIndex)
    }
    
    private let myPageControl:UIPageControl = {
        let pageControl=UIPageControl()
        pageControl.numberOfPages=2
        pageControl.addTarget(self, action:#selector(handlePageChange), for: .valueChanged)
        pageControl.backgroundColor = .green
        return pageControl
    }()
    
    @objc func handlePageChange(){
        print(myPageControl.currentPage)
        let vc = registration2Controller()
        navigationController?.pushViewController(vc, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title="Create your Account"
        view .backgroundColor = .black
        
        view.addSubview(myTextField)
        view.addSubview(myTextView)
        view.addSubview(DOB)
        view.addSubview(myDatePicker)
        view.addSubview(gender)
        view.addSubview(mySegmentedControl)
        view.addSubview(myPageControl)
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myTextField.frame=CGRect(x: 20, y:100, width:view.width - 40, height: 40)
        myTextView.frame=CGRect(x: 20, y: myTextField.bottom + 20, width: view.width - 40, height: 40)
        DOB.frame=CGRect(x: 20, y: myTextView.bottom + 20, width: view.width - 40, height: 40)
        myDatePicker.frame=CGRect(x: 20, y: DOB.bottom + 20, width: view.width - 40, height: 40)
        gender.frame=CGRect(x: 20, y: myDatePicker.bottom + 20, width: view.width - 40, height: 40)
        mySegmentedControl.frame=CGRect(x: 20, y: gender.bottom + 20, width: view.width - 40, height: 40)
        myPageControl.frame=CGRect(x: 20, y: mySegmentedControl.bottom + 20, width: view.width - 40, height: 40)
    }

}
