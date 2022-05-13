//
//  LogInSignUpViewController.swift
//  FilmApp
//
//  Created by Акбала Тлеугалиева on 4/21/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import UIKit

class LogInSignUpViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
  override func viewDidLoad() {
              super.viewDidLoad()
              configureViews()
          }
          func configureViews() {
              signUpButton.layer.cornerRadius = 12.0
              loginButton.layer.cornerRadius = 12.0

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
