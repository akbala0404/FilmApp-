//
//  SignInViewController.swift
//  FilmApp
//
//  Created by Акбала Тлеугалиева on 4/20/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire
import SwiftyJSON

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    func configureViews() {
        emailTextField.layer.cornerRadius = 12.0
        emailTextField.layer.borderWidth = 1.0
       
        
        passwordTextField.layer.cornerRadius = 12.0
        passwordTextField.layer.borderWidth = 1.0
        
        signInButton.layer.cornerRadius = 12.0
    }
    
    @IBAction func showPassword(_ sender: Any) {
           passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
       }
    @objc func dismissKeyboard() {
           view.endEditing(true)
       }
       
    func hideKeyboardWhenTappedAround() {
           let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
           tap.cancelsTouchesInView = false
           view.addGestureRecognizer(tap)
       }
    
    @IBAction func SignInButtonDidTapped(_ sender: UIButton) {
    
     let email = emailTextField.text!
            let password = passwordTextField.text!
            
            SVProgressHUD.show()
            
            let parameters = ["email": email,
                              "password": password]
            AF.request(Urls.SIGN_IN_URL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseData { response in
                
                SVProgressHUD.dismiss()
                var resultString = ""
                if let data = response.data {
                    resultString = String(data: data, encoding: .utf8)!
                    print(resultString)
                }
                if response.response?.statusCode == 200 {
                    let json = JSON(response.data!)
                    print("JSON: \(json)")
                    if let token = json["token"].string {
                        Storage.sharedInstance.accessToken = token
                        UserDefaults.standard.set(token, forKey: "token")
                        self.startApp()
                    } else {
                        SVProgressHUD.showError(withStatus: "CONNECTION_ERROR".localizedLowercase)
                        //SVProgressHUD.showError(withStatus:"CONNECTION_ERROR".localized())
                    }
                } else {
                    var ErrorString = "CONNECTION_ERROR".localizedLowercase
                    if let sCode = response.response?.statusCode {
                        ErrorString = ErrorString + " \(sCode)"
                    }
                    ErrorString = ErrorString + " \(resultString)"
                    SVProgressHUD.showError(withStatus: "\(ErrorString)")
                }
            }
        }
        
        func startApp() {
            let tabViewController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController")
            tabViewController?.modalPresentationStyle = .fullScreen
            self.present(tabViewController!, animated: true, completion: nil)
        }
    
    @IBAction func SignUpButtonDidTapped(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
