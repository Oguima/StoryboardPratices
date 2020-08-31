//
//  LoggedOutViewController.swift
//  StoryboardPratices
//
//  Created by user179081 on 24/08/20.
//  Copyright © 2020 guimagames. All rights reserved.
//

import UIKit

//, EmailProtocol
class LoggedOutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    @IBAction func returned(_ seg: UIStoryboardSegue)
    {
        print("Returned")
    }
    
    /*
    func handleData(emailData: EmailData) {
        print ("Email:\(emailData.email) pwd: \(emailData.password)")
    }*/

    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "register", let vc = segue.destination as? RegisterViewController {
            vc.delegate = self
        }
    }*/

}
