//
//  ViewController.swift
//  Tweet
//
//  Created by Diego Gomes on 22/10/2015.
//  Copyright (c) 2015 Nylon. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    @IBAction func tweetButton(sender: UIButton) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            var  score = 9000
            let tweeterController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            tweeterController.setInitialText("They Score is more than \(score) ")
            
            self.presentViewController(tweeterController,animated:true, completion:nil)
        }
        else {
            let alert = UIAlertController(title: "Accounts", message: "Please Login in Twitter", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            alert.addAction(UIAlertAction(title: "Settings", style: UIAlertActionStyle.Default, handler: {(UIAlertAction)
            in
                let settingsURL = NSURL(string: UIApplicationOpenSettingsURLString)
                if let url = settingsURL{
                    UIApplication.sharedApplication().openURL(url)
                }
            }))
            
            self.presentViewController(alert,animated: true, completion: nil)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

