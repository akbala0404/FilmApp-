//
//  TopRatedCollectionViewCell.swift
//  FilmApp
//
//  Created by Акбала Тлеугалиева on 5/2/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import UIKit
import SDWebImage


class TopRatedCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!

override func awakeFromNib() {
      super.awakeFromNib()
      imageView.layer.cornerRadius = 8
  }
    
    func setData(nowPlaying: Movie) {
           let transformer = SDImageResizingTransformer(size: CGSize(width: 300, height: 164), scaleMode: .aspectFill)
           
           imageView.sd_setImage(with: URL(string: nowPlaying.posterImage), placeholderImage: nil, context: [.imageTransformer: transformer])
           titleLabel.text = nowPlaying.title
           dateLabel.text = nowPlaying.release_date
       }
}
