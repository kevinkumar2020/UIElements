//
//  movieController.swift
//  UIelement
//
//  Created by DCS on 22/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class movieController: UIViewController {
    
    private let myImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "MovieImage")
        return imageView
    }()
    
    private let rating : UILabel = {
        let label = UILabel()
        label.text = "Give Rating"
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    private let myStepper : UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 5
        stepper.addTarget(self, action: #selector(handlerating), for: .valueChanged)
        return stepper
    } ()
    
    @objc func handlerating()
    {
        let rate = myStepper.value
        rateingValue.text = String(rate)
        
    }
    
    private let rateingValue : UITextView = {
        let textView = UITextView()
        //textView.isEditable = false
        //textView.font = UIFont.systemFont(ofSize: 17.0)
        textView.backgroundColor = .black
        textView.textColor = .white
        textView.textAlignment = .center
        textView.layer.cornerRadius = 10
        return textView
    } ()
    
    private let Brightness : UILabel = {
        let label = UILabel()
        label.text = "Manage Brightness Level"
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    private let mySlider : UISlider = {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.addTarget(self, action: #selector(handleBrightness), for: .valueChanged)
        return slider
    }()
    
    @objc func handleBrightness() {
        let res = Int(mySlider.value)
        brightnessValue.text = String(res)
    }
    
    private let brightnessValue : UITextView = {
        let textView = UITextView()
        //textView.isEditable = false
        //textView.font = UIFont.systemFont(ofSize: 17.0)
        textView.backgroundColor = .gray
        textView.textColor = .white
        textView.textAlignment = .center
        textView.layer.cornerRadius = 10
        return textView
    } ()
    
    private let myButton : UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        button.layer.cornerRadius = 20
        return button
    } ()
    
    @objc func handleButtonClick(){
        let vc = uploadController()
        navigationController?.pushViewController(vc, animated: true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        title="Movies"
        view .backgroundColor = .black
        
        view.addSubview(myImageView)
        view.addSubview(rating)
        view.addSubview(myStepper)
        view.addSubview(rateingValue)
        view.addSubview(Brightness)
        view.addSubview(mySlider)
        view.addSubview(brightnessValue)
        view.addSubview(myButton)
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myImageView.frame=CGRect(x: 20, y: 80, width:view.width - 40, height: 200)
        rating.frame=CGRect(x: 20, y: myImageView.bottom + 20, width: view.width - 40, height: 40)
        myStepper.frame=CGRect(x: 20, y: rating.bottom + 10, width: view.width - 40, height: 40)
        rateingValue.frame=CGRect(x: 20, y: myStepper.bottom + 5, width: view.width - 40, height: 40)
        Brightness.frame=CGRect(x: 20, y: rateingValue.bottom + 20, width: view.width - 40, height: 40)
        mySlider.frame=CGRect(x: 20, y: Brightness.bottom + 10, width: view.width - 40, height: 40)
        brightnessValue.frame=CGRect(x: 20, y: mySlider.bottom + 5, width: view.width - 40, height: 40)
        myButton.frame=CGRect(x: 20, y: brightnessValue.bottom + 20, width: view.width - 40, height: 40)
        
    }


}
