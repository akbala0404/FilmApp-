//
//  CategoryTableViewController.swift
//  FilmApp
//
//  Created by Акбала Тлеугалиева on 5/23/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import UIKit
import SDWebImage


class CategoryTableViewController: UITableViewController {
    var movies:[Movie] = []
    var categoryName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = categoryName
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
      // MARK: - convert Date

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
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SearchTableViewCell
        cell?.titleLabel.text = movies[indexPath.row].title
        cell?.yearLabel.text = convertDataFormatter( movies[indexPath.row].release_date)
        cell?.posterImageView.sd_setImage(with: URL(string: movies[indexPath.row].posterImage), completed: nil)
        cell?.ratingLabel.text = "\(movies[indexPath.row].vote_average)"
    
        
        // Configure the cell...
        
        return cell!
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.movie = movies[indexPath.row]
        navigationController?.show(detailViewController, sender: self)
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }    
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
