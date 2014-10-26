//
//  TMTimerViewController.swift
//  Timing
//
//  Created by Rflpz on 20/10/14.
//  Copyright (c) 2014 Rflpz. All rights reserved.
//

import UIKit

class TMTimerViewController: UIViewController {
    
    var titleView:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeView()
        customItemsBar()
    }

}
//MARK: - Customize navigatioController
extension TMTimerViewController{
    func customizeView(){
        title = titleView
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    
    func customItemsBar(){
        UIBarButtonItemStyle.Plain
        
        var imgButton = UIImage(named: "edit")
        var buttonRight = UIBarButtonItem(image: imgButton, style: .Plain, target: self, action:("editActivity"))
        buttonRight.tintColor = .whiteColor()
        self.navigationItem.rightBarButtonItem = buttonRight
    }
}
//MARK: - Edit activity
extension TMTimerViewController{
    
    func editActivity(){
        println("Edit")
    }
}