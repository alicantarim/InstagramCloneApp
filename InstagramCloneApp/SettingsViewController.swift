//
//  SettingsViewController.swift
//  InstagramCloneApp
//
//  Created by Alican TARIM on 28.03.2024.
//

import UIKit
import Firebase
class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        }
        catch {
            print(error.localizedDescription)
        }
    }

    

}
