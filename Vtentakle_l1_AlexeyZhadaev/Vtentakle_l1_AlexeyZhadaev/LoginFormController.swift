//
//  LoginFormController.swift
//  Vtentakle_l1_AlexeyZhadaev
//
//  Created by Жадаев Алексей on 29.07.2020.
//  Copyright © 2020 Жадаев Алексей. All rights reserved.
//

import UIKit

class LoginFormController: UIViewController {

    @IBOutlet weak var uiScrollView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        uiScrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        self.uiScrollView?.contentInset = contentInsets
        uiScrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        uiScrollView?.contentInset = contentInsets
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func hideKeyboard() {
        self.uiScrollView?.endEditing(true)
    }
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let login = loginInput.text!
        let password = passwordInput.text!
        
        if login == "geek" && password == "brains" {
            print("успешная авторизация")
        } else {
            print("неуспешная авторизация")
        }
        
    }

}
