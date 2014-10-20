//
//  TMViewController.swift
//  Timing
//
//  Created by Rflpz on 05/10/14.
//  Copyright (c) 2014 Rflpz. All rights reserved.
//

import UIKit

class TMViewController: UIViewController,UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    var tableViewData = ["ActOne","ActTwo","ActThree"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Root view was load")
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        title = "Activities"
        customItemsBar()
        customizeView()
    }
    func tableView(tableView: UITableView!, numberOfRowsInSection section:    Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")!
        cell.textLabel?.text = String(indexPath.row);
        cell.detailTextLabel?.text = String(indexPath.row)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Celda tocada: " + String(indexPath.row))
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
       
    }
}
