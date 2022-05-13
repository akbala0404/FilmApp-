//
//  SignUpViewController.swift
//  FilmApp
//
//  Created by Акбала Тлеугалиева on 4/20/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
     override func viewDidLoad() {
           super.viewDidLoad()
           configureViews()
           hideKeyboardWhenTappedAround()
       }
       func configureViews() {
           emailTextField.layer.cornerRadius = 12.0
           emailTextField.layer.borderWidth = 1.0
        
           usernameTextField.layer.cornerRadius = 12.0
           usernameTextField.layer.borderWidth = 1.0
          
           passwordTextField.layer.cornerRadius = 12.0
           passwordTextField.layer.borderWidth = 1.0
        
           confirmPasswordTextField.layer.cornerRadius = 12.0
           confirmPasswordTextField.layer.borderWidth = 1.0
    
           signUpButton.layer.cornerRadius = 12.0
       }
       
       @IBAction func showPassword(_ sender: Any) {
              passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
              confirmPasswordTextField.isSecureTextEntry = !confirmPasswordTextField.isSecureTextEntry
    }
    
       @objc func dismissKeyboard() {
              view.endEditing(true)
          }
    
    func hideKeyboardWhenTappedAround() {
              let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
              tap.cancelsTouchesInView = false
              view.addGestureRecognizer(tap)
          }
       
       @IBAction func SignUpButtonDidTapped(_ sender: UIButton) {
       
               let email = emailTextField.text!
               let password = passwordTextField.text!
               
               SVProgressHUD.show()
               
               let parameters = ["email": email,
                                 "password": password]
               AF.request(Urls.SIGN_UP_URL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseData { response in
                   
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
          
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
