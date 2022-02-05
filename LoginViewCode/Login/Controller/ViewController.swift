//
//  ViewController.swift
//  LoginViewCode
//
//  Created by Dev on 31/01/22.
//

import UIKit
import Firebase

class ViewController: UIViewController {   
   
    var loginScreen: LoginScreen?
    var auth: Auth?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegates(delegate: self)
        self.auth = Auth.auth()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen?.validaTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension ViewController: LoginScreenProtocol {
    func actionRegisterButton() {
        let registerController = RegisterViewController()
        self.navigationController?.pushViewController(registerController, animated: true)
    }
    
    func actionLoginButton() {
        guard let login = self.loginScreen else { return }
        
        self.auth?.signIn(
            withEmail: login.getEmail(),
            password: login.getPassword(),
            completion: { (result, error) in
                if error != nil {
                    print("atenção dados incorretos")
                } else if result == nil {
                    print("tivemos um problema inesperado")
                } else {
                    print("usuario logado com sucesso")
                }
        })
    }
}
