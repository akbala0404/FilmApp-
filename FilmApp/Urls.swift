//
//  Urls.swift
//  FilmApp
//
//  Created by Акбала Тлеугалиева on 4/22/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import Foundation

class Urls {
    static let BASE_URL = "http://localhost:5000/api/auth/login"
    static let SIGN_IN_URL = "http://localhost:5000/api/auth/login"
    static let SIGN_UP_URL = "http://localhost:5000/api/auth/register"
    static let FAVORITE_URL = ""
    static let TOP_RATED = "https://api.themoviedb.org/3/movie/top_rated?api_key=da0213edba5ce29d325c43cfec6aeab5&language=en-US&page=1"

   static let NOW_PLAYING = "https://api.themoviedb.org/3/movie/now_playing?api_key=da0213edba5ce29d325c43cfec6aeab5&language=en-US&page=1"
   static let UPCOMING = "https://api.themoviedb.org/3/movie/upcoming?api_key=da0213edba5ce29d325c43cfec6aeab5&language=en-US&page=1"
    
}
