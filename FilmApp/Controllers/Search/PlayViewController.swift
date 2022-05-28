//
//  PlayViewController.swift
//  FilmApp
//
//  Created by Акбала Тлеугалиева on 5/24/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import UIKit
import WebKit

class PlayViewController: UIViewController {
    var movie = MovieVideo()
    var id = 0
    @IBOutlet weak var webKit: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: movie.key)
        let urlRequest = URLRequest(url: url!)
        webKit.load(urlRequest)
      
        
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
