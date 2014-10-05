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
        println("View was load")
        [self .customItemBar()]
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section:    Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")!
        cell.textLabel?.text = tableViewData[indexPath.row]
        cell.detailTextLabel?.text = String(indexPath.row)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        println("Cell " + String(indexPath.row) + " touched")
    }
    
    func customItemBar(){
        UIBarButtonItemStyle.Plain
        
        var imgButton = UIImage(named: "addButton")
        var buttonRight = UIBarButtonItem(image: imgButton, style: .Plain, target: self, action:("addActivity"))
        buttonRight.tintColor = UIColor.orangeColor()
        self.navigationItem.rightBarButtonItem = buttonRight
    
        imgButton = UIImage(named: "menuButton")
        var buttonMenu = UIBarButtonItem(image: imgButton, style: .Plain, target: self, action: ("showMenu"))
        buttonMenu.tintColor = UIColor.orangeColor()
        self.navigationItem.leftBarButtonItem = buttonMenu
    }
    
    func addActivity(){
        println("add activity")
    }
    
    func showMenu(){
        println("show menu")
    }
}
