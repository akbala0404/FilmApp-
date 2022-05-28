//
//  DetailViewController.swift
//  FilmApp
//
//  Created by Акбала Тлеугалиева on 4/13/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import UIKit
import SVProgressHUD
import SwiftyJSON
import Alamofire
import SDWebImage

class DetailViewController: UIViewController {
    var movie = Movie()
    var movieList = MovieVideo()
    var videoKey: String?


    @IBOutlet weak var backdropImageView: UIImageView!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    

    override func viewDidLoad() {
         super.viewDidLoad()
        backdropImageView.sd_setImage(with: URL(string: movie.backdrop_path), completed: nil)
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        ratingLabel.text = "\(movie.vote_average)"
        posterImageView.sd_setImage(with: URL(string: movie.posterImage), completed: nil)
        dateLabel.text = convertDataFormatter(movie.release_date)
        downloadMoviesByCategory()
         // Do any additional setup after loading the view.
     }
    func convertDataFormatter(_ date: String?) -> String {
            var fixDate = ""
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if let originalDate = date {
                if let newDate = dateFormatter.date(from: originalDate){
                    dateFormatter.dateFormat = "d MMM, yyyy"
                    fixDate = dateFormatter.string(from: newDate)
                }
            }
            return fixDate
     }
    
    func downloadMoviesByCategory() {
        SVProgressHUD.show()
        AF.request("https://api.themoviedb.org/3/movie/\(movie.id)/videos?api_key=da0213edba5ce29d325c43cfec6aeab5&language=en-US", method: .get).responseData { response in
            
            SVProgressHUD.dismiss()
            var resultString = ""
            if let data = response.data {
                resultString = String(data: data, encoding: .utf8)!
                print(resultString)
            }
            
            if response.response?.statusCode == 200 {
                let json = JSON(response.data!)
                print("JSON: \(json)")
                
                if json["results"].exists() {
                    if let array = json["results"].array {
                        for item in array {
                            let movie = MovieVideo(json: item)
//
                            self.movieList = movie
                            print(self.movieList.key)
//
//                            self.videoKey = movie.key
//                            print(self.videoKey)
                        }
                        
                    }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            let vc = segue.destination as! PlayViewController
            vc.movie.key = movieList.key

        }
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
