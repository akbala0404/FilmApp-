//
//  MovieVideo.swift
//  FilmApp
//
//  Created by Акбала Тлеугалиева on 5/25/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import Foundation
import SwiftyJSON

class MovieVideo{
     var key = ""
    
    init (){
     }
     init (json: JSON){
       if let temp = json["key"].string{
          let fullPath = "https://www.youtube.com/watch?v=" + temp
          key = fullPath
          }
   }
       
   }

