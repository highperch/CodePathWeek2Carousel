//
//  PhotoDetailViewController.swift
//  Week2Carousel
//
//  Created by Justin Peng on 2/12/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func didPressClose(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func didPressShare(sender: AnyObject) {
        let shareAlertController = UIAlertController(title: "Shared Link Created", message: "A shared link has been created for settings.png", preferredStyle: .ActionSheet)
        let okAction = UIAlertAction(title: "OK", style: .Default) { (action) in
        }
        presentViewController(shareAlertController, animated: true) {
        }
        shareAlertController.addAction(okAction)
        defaults.setBool(true, forKey: "photo_share")
        defaults.synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.setBool(true, forKey: "full_screen")
        defaults.synchronize()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
