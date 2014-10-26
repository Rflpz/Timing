//
//  TMAddActivityViewController.swift
//  Timing
//
//  Created by Rflpz on 19/10/14.
//  Copyright (c) 2014 Rflpz. All rights reserved.
//

import UIKit
import CoreData
class TMAddActivityViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var pckCategory: UIPickerView!
    
    var dataPicker: NSArray!
    var selectedRow: Int!
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("addActivity view was load")
        txtDescription.delegate = self
        txtName.delegate = self
        customizeView()
        conectDataPicker()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        customItemsBar()
    }
    
    //MARK: Functionality for textFileds (Hide keyboard)
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
}
//MARK: - Save activity
extension TMAddActivityViewController{
    
    func saveActivity(){
        let entityDescripition = NSEntityDescription.entityForName("Activity", inManagedObjectContext: managedObjectContext!)
        let task = Activity(entity: entityDescripition!, insertIntoManagedObjectContext: managedObjectContext)
        task.name = txtName.text
        task.desc = txtDescription.text
        var  selectionPicker = [self .pickerView(self.pckCategory, titleForRow: selectedRow, forComponent: 0)]
        task.category = selectionPicker[0]
        println(task.category)
        managedObjectContext?.save(nil)
        println("Activity saved")
    }
}
//MARK: - Customize navigatioController
extension TMAddActivityViewController{
    func customizeView(){
        title = "New activity"
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    func customItemsBar(){
        UIBarButtonItemStyle.Plain
        
        var imgButton = UIImage(named: "saveButton")
        var buttonRight = UIBarButtonItem(image: imgButton, style: .Plain, target: self, action:("saveActivity"))
        buttonRight.tintColor = .whiteColor()
        self.navigationItem.rightBarButtonItem = buttonRight
    }
}
//MARK: - Set data pickerView
extension TMAddActivityViewController{
    func conectDataPicker(){
        // Initialize data pckCategory
        dataPicker = ["One","Two","Three","Four"]
        self.pckCategory.delegate = self;
        selectedRow = 0
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return dataPicker.count
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String! {
        return self.dataPicker.objectAtIndex(row) as String
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row
    }
}