//
//  PodscastCell.swift
//  PodcastsAssigment
//
//  Created by Koby Shirazi on 04/07/2022.
//

import UIKit
import SDWebImage

class PodcastCell : UITableViewCell {
    @IBOutlet weak var podcastImageView: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func configureWith(_ viewModel: PodcastViewModelType){
        artistLabel.text = viewModel.artistName
        trackLabel.text = viewModel.trackName
        
        let placeholderImage = UIImage(named: "placeholder_podcast")
        let imageURL = URL(fileURLWithPath: viewModel.logoURL)
        self.podcastImageView.sd_setImage(with: imageURL, placeholderImage:placeholderImage )
        
    }
    
    
    
}
