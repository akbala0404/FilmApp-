//
//  ProfileViewController.swift
//  FilmApp
//
//  Created by Акбала Тлеугалиева on 4/6/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func Logout(_ sender: Any) {
    let logoutVC = storyboard?.instantiateViewController(withIdentifier: "LogoutViewController") as! LogoutViewController
        
        logoutVC.modalPresentationStyle = .overFullScreen
        
        present(logoutVC, animated: true, completion: nil)
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
