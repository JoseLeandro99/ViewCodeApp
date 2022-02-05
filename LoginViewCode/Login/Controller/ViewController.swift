//
//  ViewController.swift
//  LoginViewCode
//
//  Created by Dev on 31/01/22.
//

import UIKit

class ViewController: UIViewController {   
   
    var loginScreen: LoginScreen?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegates(delegate: self)
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
        print("Deu certo login conteúdo")
    }
}
