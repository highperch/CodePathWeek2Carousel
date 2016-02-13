//
//  GetStartedViewController.swift
//  Week2Carousel
//
//  Created by Justin Peng on 2/11/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {

    @IBOutlet weak var fullScreenCheckbox: UIImageView!
    @IBOutlet weak var timeWheelCheckbox: UIImageView!
    @IBOutlet weak var sharePhotoCheckbox: UIImageView!
    
    var full_screen_viewed:Bool!
    var time_wheel_used:Bool!
    var photo_shared:Bool!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func didPressClose(sender: AnyObject) {
            dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        var full_screen_viewed = defaults.boolForKey("full_screen")
        var time_wheel_used = defaults.boolForKey("time_wheel")
        var photo_shared = defaults.boolForKey("photo_share")
        if full_screen_viewed == true {
            fullScreenCheckbox.image = UIImage(named: "checkbox_complete")
        } else if time_wheel_used == true {
            timeWheelCheckbox.image = UIImage(named: "checkbox_complete")
        } else if photo_shared == true {
            sharePhotoCheckbox.image = UIImage(named: "checkbox_complete")
        }
        else {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
