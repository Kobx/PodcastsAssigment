//
//  ViewController.swift
//  PodcastsAssigment
//
//  Created by Koby Shirazi on 04/07/2022.
//

import UIKit


class MainViewController: UITableViewController {

    //MARK: LifeCycle
    
    static func instantiate() -> MainViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let resultsFetcher = ResultsFetcher.init()
        resultsFetcher.fetchPodcastsResults(forString: "geekonomy")
    }

    
//MARK: TableView DataSource

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PodcastCell", for: indexPath) as! PodcastCell
        //TODO:configure viewModel
//        cell.configureWith(viewModel)
        
//        let podcastModel = Podcast.init(artistName: "Koby Shirazi", trackName: "My home assigment", artworkUrl100: "https://is5-ssl.mzstatic.com/image/thumb/Podcasts125/v4/ac/c4/c7/acc4c703-ae45-af83-5f51-ef4909ad6f3e/mza_13790432082240724320.jpg/100x100bb.jpg")
//        let cellViewModel = PodcastCellViewModel.init(podcastModel)
//        cell.configureWith(cellViewModel)
        
        cell.backgroundColor = .red
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

