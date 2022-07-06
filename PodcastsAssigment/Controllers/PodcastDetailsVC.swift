//
//  PodcastDetailsVC.swift
//  PodcastsAssigment
//
//  Created by Koby Shirazi on 06/07/2022.
//

import UIKit

class PodcastDetailsVC: UIViewController {
    @IBOutlet weak var podcastImageView: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    public var viewModel: PodcastDetailsViewModel?
    
    
    //MARK: Lifecycle
    
    static func instantiate() -> PodcastDetailsVC {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: "PodcastDetailsVC") as! PodcastDetailsVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        configureViews()
    }
    
    //MARK: UI
    
    func configureViews() {
        guard let viewModel = self.viewModel else {
            return
        }
        self.podcastImageView.sd_setImage(with: viewModel.artworkUrl)
        self.artistLabel.text = viewModel.artistName
        self.trackLabel.text = viewModel.trackName
        self.releaseDateLabel.text = viewModel.releaseDate
    }
    
    
    
    
    
    
}
