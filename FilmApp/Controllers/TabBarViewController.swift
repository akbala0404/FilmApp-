//
//  TabBar ViewController.swift
//  FilmApp
//
//  Created by Акбала Тлеугалиева on 4/1/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeSelected = UIImage(named: "SelectedHome")!.withRenderingMode(.alwaysOriginal)
        
        let profileSelected = UIImage(named: "SelectedProflle")!.withRenderingMode(.alwaysOriginal)
        
        
        tabBar.items?[0].selectedImage = homeSelected
        tabBar.items?[2].selectedImage = profileSelected
        
        
        
        
        
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
