//
//  TMViewController.swift
//  Timing
//
//  Created by Rflpz on 05/10/14.
//  Copyright (c) 2014 Rflpz. All rights reserved.
//

import UIKit

class TMViewController: UIViewController,UITableViewDelegate,SideBarDelegate {

    @IBOutlet var tableView: UITableView!
    var tableViewDataTitle = ["Test of custom cell","Test of custom cell","Test of custom cell", "Test of custom cell"]
    var tableViewDataDescription = ["Test of custom cell","Test of custom cell","Test of custom cell", "Test of custom cell"]
    var sideBar:SideBar = SideBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Root view was load")
        sideBar = SideBar(sourceView: self.view, menuItems: ["Activities","Categories", "About"])
        sideBar.delegate = self
        
        var nib = UINib(nibName: "TMCellTableViewCell", bundle: nil)
        
        tableView.registerNib(nib!, forCellReuseIdentifier: "customCell")
        
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        title = "Activities"
        customItemsBar()
        customizeView()
    }
    func tableView(tableView: UITableView!, numberOfRowsInSection section:    Int) -> Int {
        return tableViewDataTitle.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell:TMCellTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("customCell") as TMCellTableViewCell
        cell.lblName.text = tableViewDataTitle[indexPath.row]
        cell.lblDescription.text = tableViewDataDescription[indexPath.row]
        var imgCatCell = UIImage(named: "placeholder")
        
        cell.imgCategory.image = imgCatCell
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.backgroundColor = .clearColor()
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Celda tocada: " + String(indexPath.row))
        let timerViewController = TMTimerViewController(nibName: "TMTimerViewController", bundle: nil)
        timerViewController.titleView = tableViewDataTitle[indexPath.row]
        self.navigationController?.pushViewController(timerViewController, animated: true)
    }
    
    func customItemsBar(){
        UIBarButtonItemStyle.Plain
        
        var imgButton = UIImage(named: "addButton")
        var buttonRight = UIBarButtonItem(image: imgButton, style: .Plain, target: self, action:("addActivity"))
        buttonRight.tintColor = .whiteColor()
        self.navigationItem.rightBarButtonItem = buttonRight
    }
    
    func addActivity(){
        let addActivityViewController = TMAddActivityViewController(nibName: "TMAddActivityViewController", bundle: nil)
        self.navigationController?.pushViewController(addActivityViewController, animated: true)
        println("add activity")
    }
    func customizeView(){
        
        self.navigationController?.navigationBar.barTintColor = .orangeColor()
        self.navigationController?.navigationBar.tintColor = .whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.tableView.backgroundColor = .clearColor()
       
    }
    
    func sideBarDidSelectButtonAtIndex(index: Int) {
        switch(index){
        case 0:
            view.backgroundColor =  .orangeColor()
            break
        case 1:
            view.backgroundColor =  .redColor()
            break
        case 2:
            view.backgroundColor =  .blueColor()
            break
        default:
            break
        }
        println("Opcion " + String(index))
    }
}
