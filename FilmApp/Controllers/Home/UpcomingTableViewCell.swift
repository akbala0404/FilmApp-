//
//  UpcomingTableViewCell.swift
//  FilmApp
//
//  Created by Акбала Тлеугалиева on 5/11/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import UIKit
import SDWebImage

class UpcomingTableViewCell: UITableViewCell,  UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var categoryLabel: UILabel!
    var mainMovie = MainMovies()
        
        override func awakeFromNib() {
            super.awakeFromNib()
            collectionView.delegate = self
            collectionView.dataSource = self
            
                    let layout = TopAlignedCollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 22.0, left: 24.0, bottom: 10.0, right: 24.0)
            layout.minimumInteritemSpacing = 16
            layout.minimumLineSpacing = 16
            layout.estimatedItemSize.width = 300
            layout.estimatedItemSize.height = 280
            layout.scrollDirection = .horizontal
            collectionView.collectionViewLayout = layout
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        
        func setData(mainMovie: MainMovies) {
        
            self.mainMovie = mainMovie
            
            collectionView.reloadData()
        }
        
        // MARK: - collectionView
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return mainMovie.banner.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath)
                       
                       //imageview
            let transformer = SDImageResizingTransformer(size: CGSize(width: 250, height: 180), scaleMode: .aspectFill)
                       
            let imageview = cell.viewWithTag(1000) as! UIImageView
            imageview.sd_setImage(with: URL(string: mainMovie.banner[indexPath.row].posterImage), placeholderImage: nil, context: [.imageTransformer: transformer])
            imageview.layer.cornerRadius = 8
            let filmName = cell.viewWithTag(1001) as! UILabel
            filmName.text = mainMovie.banner[indexPath.row].title
                       return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            collectionView.deselectItem(at: indexPath, animated: true)
        }

    }

