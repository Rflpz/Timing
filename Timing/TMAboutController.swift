//
//  TMAboutController.swift
//  Timing
//
//  Created by Rafael Lopez on 20/01/15.
//  Copyright (c) 2015 Rflpz. All rights reserved.
//

import UIKit

class TMAboutController: UIViewController {
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtAboutContainer: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orangeColor()
        txtAboutContainer.textColor = .blackColor()
        txtTitle.textColor = .blackColor()
    }

    @IBAction func pushToGithub(sender: AnyObject) {
        var url : NSURL = NSURL(string: "https://github.com/Rflpz/Timing")!
        UIApplication.sharedApplication().openURL(url)
    }
    @IBAction func hide(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

