//
//  CreateViewController.swift
//  Week2Carousel
//
//  Created by Justin Peng on 2/9/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var createButtonParentView: UIView!
    @IBOutlet weak var createFieldParentView: UIView!
    @IBOutlet weak var agreeButton: UIButton!
    @IBOutlet weak var createScrollView: UIScrollView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var createIndicator: UIActivityIndicatorView!
    
    var create_field_initialY: CGFloat!
    var create_field_offset: CGFloat!
    var create_button_initialY: CGFloat!
    var create_button_offset: CGFloat!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func didPressBack(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func didPressAgree(sender: AnyObject) {
        if agreeButton.selected == false {
            agreeButton.selected = true
        }
        else {
            agreeButton.selected = false
        }
    }
    
    @IBAction func didPressCreate(sender: AnyObject) {
        if firstName.text!.isEmpty {
            let firstNameAlertController = UIAlertController(title: "First name missing", message: "Please enter a first name to continue", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            }
            self.presentViewController(firstNameAlertController, animated: true) {
            }
            firstNameAlertController.addAction(okAction)
        } else if lastName.text!.isEmpty {
            let lastNameAlertController = UIAlertController(title: "Last name missing", message: "Please enter a last name to continue", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            }
            self.presentViewController(lastNameAlertController, animated: true) {
            }
            lastNameAlertController.addAction(okAction)
        } else if email.text!.isEmpty {
            let emailAlertController = UIAlertController(title: "E-mail missing", message: "Please enter an e-mail address to continue", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            }
            self.presentViewController(emailAlertController, animated: true) {
            }
            emailAlertController.addAction(okAction)
        } else if password.text!.isEmpty {
            let passwordAlertController = UIAlertController(title: "Password missing", message: "Please enter a password to continue", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            }
            self.presentViewController(passwordAlertController, animated: true) {
            }
            passwordAlertController.addAction(okAction)
        }
        else if agreeButton.selected == false {
            let termsAlertController = UIAlertController(title: "Terms of Service", message: "Please agree to the terms of service before continuing", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            }
            self.presentViewController(termsAlertController, animated: true) {
            }
            termsAlertController.addAction(okAction)
        }
        else {
            createIndicator.startAnimating()
            defaults.setObject(firstName.text, forKey: "first_name")
            defaults.setObject(lastName.text, forKey: "last_name")
            defaults.setObject(email.text, forKey: "email")
            defaults.setObject(password.text, forKey: "password")
            defaults.synchronize()
            delay(2) {
                self.createIndicator.stopAnimating()
                self.performSegueWithIdentifier("createSegue", sender: self)
            }
        }
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= -50 {
            view.endEditing(true)
        }
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        createFieldParentView.frame.origin.y = create_field_initialY + create_field_offset
        createButtonParentView.frame.origin.y = create_button_initialY + create_button_offset
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        createFieldParentView.frame.origin.y = create_field_initialY
        createButtonParentView.frame.origin.y = create_button_initialY
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createScrollView.delegate = self
        createScrollView.contentSize = createScrollView.frame.size
        createScrollView.contentInset.bottom = 100
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        create_field_initialY = createFieldParentView.frame.origin.y
        create_field_offset = -63
        create_button_initialY = createButtonParentView.frame.origin.y
        create_button_offset = -221

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
