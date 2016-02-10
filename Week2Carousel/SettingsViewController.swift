
//
//  SettingsViewController.swift
//  Week2Carousel
//
//  Created by Justin Peng on 2/8/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsScrollView: UIScrollView!
    @IBOutlet weak var settingsImageView: UIImageView!
    
    @IBAction func didPressClose(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didPressSignOut(sender: AnyObject) {
        let signOutAlertController = UIAlertController(title: "", message: "Are you sure you want to sign out?", preferredStyle: .ActionSheet)
        
        let signOutAction = UIAlertAction(title: "Sign Out", style: .Destructive) { (action) in
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController:UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("IntroViewController") as UIViewController
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.navigationBarHidden = true
            self.presentViewController(navigationController, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
        }
        presentViewController(signOutAlertController, animated: true) {
        }
        signOutAlertController.addAction(signOutAction)
        signOutAlertController.addAction(cancelAction)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsScrollView.contentSize = settingsImageView.image!.size
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
