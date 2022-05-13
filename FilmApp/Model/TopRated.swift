//
//  TopRated.swift
//  FilmApp
//
//  Created by Акбала Тлеугалиева on 5/2/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import Foundation
import SwiftyJSON
class TopRated {
  var title = ""
  var release_date = ""
  var vote_average = ""
  var original_title = ""
  var overview = ""
  var posterImage = ""
  init (){
      
  }
  init (json: JSON){
     if let temp = json["title"].string{
          title = temp
      }
      if let temp = json["release_date"].string{
               release_date = temp
           }
      if let temp = json["vote_average"].string{
               vote_average = temp
           }
     if let temp = json["original_title"].string{
             original_title = temp
         }
     if let temp = json["overview"].string{
            overview = temp
         }
     if let temp = json["vote_average"].string{
             vote_average = temp
    }
    
    if let temp = json["poster_path"].string{
    let fullPath = "https://image.tmdb.org/t/p/w500/" + temp
    posterImage = fullPath
    }
  }
}


