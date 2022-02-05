//
//  RegisterViewController.swift
//  LoginViewCode
//
//  Created by Dev on 04/02/22.
//

import UIKit

class RegisterViewController : UIViewController {
    
    var registerScreen: RegisterScreen?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerScreen?.delegate(delegate: self)
        self.registerScreen?.configTextFieldDelegate(delegate: self)
    }
}

extension RegisterViewController : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.validaTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension RegisterViewController : RegisterScreenProtocol {
    func BackButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func RegisterButton() {
        print("Registrar")
    }
}
