//
//  TMAddActivityViewController.swift
//  Timing
//
//  Created by Rflpz on 19/10/14.
//  Copyright (c) 2014 Rflpz. All rights reserved.
//

import UIKit

class TMAddActivityViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var pckCategory: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        println("addActivity view was load")
        
        txtDescription.delegate = self
        txtName.delegate = self
        
        customizeView()
        
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    func customizeView(){
        title = "New activity"
        
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
            customItemsBar()
    }
    func customItemsBar(){
        UIBarButtonItemStyle.Plain
        
        var imgButton = UIImage(named: "saveButton")
        var buttonRight = UIBarButtonItem(image: imgButton, style: .Plain, target: self, action:("saveActivity"))
        buttonRight.tintColor = .whiteColor()
        self.navigationItem.rightBarButtonItem = buttonRight
        
    }
    func saveActivity(){
        println("Activity saved")
    }
}
