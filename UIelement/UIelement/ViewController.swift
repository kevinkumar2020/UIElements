//
//  ViewController.swift
//  UIelement
//
//  Created by DCS on 22/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let myImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "atTheMovies")
        return imageView
    }()
    
    private let myLabel : UILabel = {
        let label = UILabel()
        label.text = " Welcome To The AtTheMovies"
        label.textColor = .white
        label.shadowColor = .darkGray
        return label
        
    }()
    
    private let myButton : UIButton = {
        let button = UIButton()
        button.setTitle("Register Now", for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        return button
    } ()
    
    @objc func handleButtonClick()
    {
        let vc = registration1Controller()
        navigationController?.pushViewController(vc, animated: true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Welcome"
        self.view.backgroundColor = .black
        view.addSubview(myImageView)
        view.addSubview(myLabel)
        view.addSubview(myButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myImageView.frame = CGRect(x: 20, y: 100, width: view.width - 40, height: 240)
        myLabel.frame = CGRect(x: 30, y: myImageView.bottom + 20, width: view.width - 40, height: 40)
        myButton.frame = CGRect(x: 25, y: myLabel.bottom + 40, width: view.width - 40, height: 40)
        
    }


}

