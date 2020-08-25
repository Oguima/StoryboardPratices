//
//  RegisterViewController.swift
//  StoryboardPratices
//
//  Created by user179081 on 24/08/20.
//  Copyright © 2020 guimagames. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    weak var delegate: LoggedOutViewController?

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPwd: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let email = txtEmail.text, email != "" else {
            print("Email is empty")
            return
        }

        guard let pwd = txtPwd.text, pwd != "" else {
            print("Password is empty")
            return
        }

        if segue.identifier == "returnedSegue" {
            let data: EmailData
            data.email = email
            data.password = pwd 

            delegate?.handleData(emailData: data)
        }
    }

}
