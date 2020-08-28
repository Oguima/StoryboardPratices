//
//  LoginViewController.swift
//  StoryboardPratices
//
//  Created by user179081 on 24/08/20.
//  Copyright © 2020 guimagames. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        errorLabel.alpha = 0
    }
    
    //MARK: Validate Fields: devolve nil caso campos estajam ok, e uma mensagem no caso de erro.
    func validateFields() -> String? {
        
        //Check tha all fields are filled
        if txtEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            txtPwd.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Por favor preencha todos campos."
        }
        
        return nil //Caso campos estajam ok... , senão devolve a mensagem de erro.
    }
    
    func showError(_ message:String)
    {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    
    @IBAction func nextTaped(_ sender: UIButton) {
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }

    }
    
}
