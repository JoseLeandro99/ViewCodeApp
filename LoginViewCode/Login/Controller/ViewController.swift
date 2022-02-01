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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Começou edit")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Terminou edit")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension ViewController: LoginScreenProtocol {
    func actionRegisterButton() {
        print("Redirecionar para registro")
    }
    
    func actionLoginButton(login: String, password: String) {
        print("Deu certo login conteúdo, login:\(login) - senha: \(password)")
    }
}
