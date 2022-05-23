//
//  DetailViewController.swift
//  FilmApp
//
//  Created by Акбала Тлеугалиева on 4/13/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var movie = Movie()

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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
