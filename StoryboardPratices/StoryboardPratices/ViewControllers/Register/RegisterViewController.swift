//
//  RegisterViewController.swift
//  StoryboardPratices
//
//  Created by user179081 on 24/08/20.
//  Copyright © 2020 guimagames. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

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
        
        navigationController?.isNavigationBarHidden = false
        
        
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
        else
        {
            //Creat cleaned versions of the data
            let firstName =  firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let email = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = txtPwd.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Register user
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
              //Check errors
                if error != nil {
                    self.showError("Erro ao criar usuário")
                }
                else
                {
                    //Usuário criado com sucesso. (Pods Firebase/Core . Firebase/Firestore
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname": firstName,
                        "lastname": lastName,
                        "uid": authResult!.user.uid]) { (error) in
                        
                            if error != nil {
                                //show error
                                self.showError("Erro ao salvar dados do usuário.")
                            }
                    }
                    
                    //Transiction Discover
                    self.transitionToHome()
                }
                
            }
            
            
        }

    }
    
    
}
