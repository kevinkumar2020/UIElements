//
//  uploadController.swift
//  UIelement
//
//  Created by DCS on 22/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class uploadController: UIViewController {
    
    private let myImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "uploadImage")
        return imageView
    }()
    
    private let toolbar :UIToolbar = {
        let toolbar = UIToolbar()
        let close = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleback))
        let gallery = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(handlegallery))
        toolbar.items = [close,gallery]
        
        return toolbar
    } ()
    
    @objc func handleback() {
        
        self.dismiss(animated: true)
    }
    @objc func handlegallery() {
        myImagePicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.myImagePicker, animated: true)
        }
        
    }
    
    private let tabbar: UITabBar = {
        let tabbar = UITabBar()
        let history = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        let downloads = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        tabbar.items = [history,downloads]
        return tabbar
    } ()
    
    private let myImagePicker: UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        return imagePicker
    } ()
    
    private let upload : UILabel = {
        let label = UILabel()
        label.text = "Upload Movie"
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    private let myButton : UIButton = {
        let button = UIButton()
        button.setTitle("Upload", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        return button
    } ()
    
    
    private let myActivityIndicator : UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
     //   activity.style = .large
        activity.color = .blue
        activity.startAnimating()
        return activity
    } ()
    
    @objc func handleButtonClick()
    {
        print("Button Click")
        DispatchQueue.main.async {
            self.myActivityIndicator.isHidden = !self.myActivityIndicator.isHidden
            self.myActivityIndicator.isHidden ? self.myActivityIndicator.stopAnimating() : self.myActivityIndicator.startAnimating()
        }
    }

    
    private let progress : UIProgressView = {
        let progress = UIProgressView()
        progress.setProgress(0.0, animated: true)
        progress.progressTintColor = .yellow
        return progress
    } ()
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        UIView.animate(withDuration: 10.0){
            self.progress.setProgress(1.0, animated: true)
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(toolbar)
        view.addSubview(tabbar)
        view.addSubview(myImageView)
        view.addSubview(upload)
        view.addSubview(myActivityIndicator)
        view.addSubview(progress)
        view.addSubview(myButton)
        title = "Upload Movie"
        self.view.backgroundColor = .black
        tabbar.delegate = self
        myImagePicker.delegate = self
      
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let toolBarHeight:CGFloat = view.safeAreaInsets.top + 10
        toolbar.frame = CGRect(x: 0, y: 0, width: view.width, height: toolBarHeight)
        
        let tabBarHeight:CGFloat = view.safeAreaInsets.bottom + 49
        tabbar.frame = CGRect(x: 0, y: view.height - tabBarHeight, width: view.width, height: tabBarHeight)
        
        myImageView.frame = CGRect(x: 20, y: 70, width: view.width - 40, height: 200)
        upload.frame = CGRect(x: 20, y: myImageView.bottom + 10, width: view.width - 40, height: 40)
        myActivityIndicator.frame = CGRect(x: 20, y: upload.bottom + 20, width: view.width - 40, height: 40)
        progress.frame = CGRect(x: 20, y: myActivityIndicator.bottom + 20, width: view.width - 40, height: 40)
        myButton.frame = CGRect(x: 20, y: progress.bottom + 20, width: view.width - 40, height: 40)
        
    }
}

extension uploadController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.tag)
    }
}
extension uploadController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedimg = info[.originalImage] as? UIImage {
            myImageView.image = selectedimg
        }
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

