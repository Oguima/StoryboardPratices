//
//  RegisterViewController.swift
//  StoryboardPratices
//
//  Created by user179081 on 24/08/20.
//  Copyright © 2020 guimagames. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class RegisterViewController: UIViewController {

    //weak var delegate: LoggedOutViewController?

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPwd: UITextField!

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        errorLabel.alpha = 0
    }
    
    //MARK: Validate Fields: devolve nil caso campos estajam ok, e uma mensagem no caso de erro.
    func validateFields() -> String? {
        
        //Check tha all fields are filled
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            txtEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            txtPwd.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Por favor preencha todos campos."
        }
        
        //Check if password is secure...
        let cleanedPassword = txtPwd.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false
        {
            return "Sua senha precisa conter ao menos 8 caracteres, um caracter especial e um número."
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
        else
        {
            //Register user
            Auth.auth().createUser(withEmail: txtEmail.text!, password: txtPwd.text!) { authResult, error in
              //Check errors
                if error != nil {
                    self.showError("Erro ao criar usuário")
                }
                else
                {
                    //Usuário criado com sucesso. (Pods Firebase/Core . Firebase/Firestore
                    //let db = Firestore.firestore()
                    
                }
                
            }
            
            //Transiction Discover
        }

    }
}
