//
//  TMViewController.swift
//  Timing
//
//  Created by Rflpz on 05/10/14.
//  Copyright (c) 2014 Rflpz. All rights reserved.
//

import UIKit
import CoreData

class TMViewController: UIViewController,UITableViewDelegate,SideBarDelegate {

    @IBOutlet var tableView: UITableView!

    var listData : Array<AnyObject> = []
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    var sideBar:SideBar = SideBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Root view was load")
        sideBar = SideBar(sourceView: self.view, menuItems: ["About"])
        sideBar.delegate = self
        var nib = UINib(nibName: "TMCellTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "customCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        title = "Activities"
        customItemsBar()
        customizeView()
        fillTableView()
    }
    
    //MARK: Customize navigationBarItems
    func customItemsBar(){
        UIBarButtonItemStyle.Plain
        var imgButton = UIImage(named: "addButton")
        var buttonRight = UIBarButtonItem(image: imgButton, style: .Plain, target: self, action:("addActivity"))
        buttonRight.tintColor = .whiteColor()
        self.navigationItem.rightBarButtonItem = buttonRight
    }
    
    func customizeView(){
        self.navigationController?.navigationBar.barTintColor = .orangeColor()
        self.navigationController?.navigationBar.tintColor = .whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.tableView.backgroundColor = .clearColor()
        
    }
    
    //MARK: Root to addActivityViewController
    func addActivity(){
        let addActivityViewController = TMAddActivityViewController(nibName: "TMAddActivityViewController", bundle: nil)
        self.navigationController?.pushViewController(addActivityViewController, animated: true)
        println("add activity")
    }
}
// MARK: - Extension to tableView
extension TMViewController{
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section:    Int) -> Int {
        return listData.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell:TMCellTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("customCell") as TMCellTableViewCell
        if let ip = indexPath{
            var data: NSManagedObject = listData[ip.row] as NSManagedObject
            cell.lblName.text = data.valueForKey("name") as String?
            cell.lblDescription.text = data.valueForKey("desc") as String?
        }
        var imgCatCell = UIImage(named: "placeholder")
        cell.imgCategory.image = imgCatCell
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.backgroundColor = .clearColor()
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Touched cell: " + String(indexPath.row))
        let timerViewController = TMTimerViewController(nibName: "TMTimerViewController", bundle: nil)
        var data: NSManagedObject = listData[indexPath.row] as NSManagedObject
        timerViewController.titleView = data.valueForKey("name") as String?
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.navigationController?.pushViewController(timerViewController, animated: true)
    }
    
    func fillTableView(){
        let fRequest = NSFetchRequest(entityName: "Activity")
        listData = managedObjectContext!.executeFetchRequest(fRequest, error: nil)!
        tableView.reloadData()
    }
    func tableView(tableView: UITableView,canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool{
        return true
    }
    func tableView(tableView: UITableView,commitEditingStyle editingStyle: UITableViewCellEditingStyle,forRowAtIndexPath indexPath: NSIndexPath){
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            managedObjectContext?.deleteObject(listData[indexPath.row] as NSManagedObject)
            listData.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
        var error: NSError? = nil
        if !(managedObjectContext?.save(&error) != nil){
            abort()
        }
    }
}
//MARK: - Extension to sideBarMenu
extension TMViewController{
    
    func sideBarDidSelectButtonAtIndex(index: Int) {
        switch(index){
        case 0:
            var aboutController = TMAboutController(nibName: "TMAboutController", bundle: nil)
            presentViewController(aboutController, animated: true, completion: nil)
            sideBar.showSideBar(false)
            break
        default:
            break
        }
        println("Opcion " + String(index))
    }
}
