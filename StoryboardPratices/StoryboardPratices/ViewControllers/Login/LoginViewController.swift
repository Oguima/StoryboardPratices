//
//  LoginViewController.swift
//  StoryboardPratices
//
//  Created by user179081 on 24/08/20.
//  Copyright © 2020 guimagames. All rights reserved.
//

import UIKit
import FirebaseAuth

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
    
    func transitionToHome(){
        //Change root view controller... (DiscoverViewController)
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? DiscoverViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    
    @IBAction func nextTaped(_ sender: UIButton) {
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }
        
        let email = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pwd = txtPwd.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, link: pwd) { (result, error) in
            
            if error != nil {
                //Couldn´t sign in
                self.showError("Não foi possível fazer o login: \(error!.localizedDescription)")
            }
            else
            {
                //Ir para home...
                self.transitionToHome()
            }
        }

    }
    
}
