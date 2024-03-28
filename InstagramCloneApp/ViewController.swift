//
//  ViewController.swift
//  InstagramCloneApp
//
//  Created by Alican TARIM on 27.03.2024.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    //MARK: - UI Elements
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    
    //MARK: - Functions
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Actions
    @IBAction func signInButtonTapped(_ sender: Any) {
        if emailTextField.text != ""  &&  passwordTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { authdata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else {
            makeAlert(titleInput: "Error", messageInput: "Username/Password?")
        }
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {

        if emailTextField.text != ""  &&  passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authdata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else {
            makeAlert(titleInput: "Error", messageInput: "Username/Password?")
        }
        
        
    }
    
    
}

