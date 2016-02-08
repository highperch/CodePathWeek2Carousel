//
//  WelcomeViewController.swift
//  Week2Carousel
//
//  Created by Justin Peng on 2/8/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var welcomeScrollView: UIScrollView!
    @IBOutlet weak var welcomePageControl: UIPageControl!
    @IBOutlet weak var welcomeBackupButton: UIImageView!
    
    @IBAction func welcomeSpinButton(sender: AnyObject) {
    }
    
    func scrollViewDidEndDecelerating(welcomeScrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(welcomeScrollView.contentOffset.x / 320))
        // Set the current page, so the dots will update
        welcomePageControl.currentPage = page
        if page == 3 {
            UIView.animateWithDuration(0.5) { () -> Void in
            self.welcomeBackupButton.alpha = 1
            self.welcomePageControl.hidden = true
            }
        } else {
            welcomePageControl.hidden = false
            welcomeBackupButton.alpha = 0
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeScrollView.delegate = self
        welcomeScrollView.contentSize = CGSize(width: 1280, height: 568)
        welcomeBackupButton.alpha = 0
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
