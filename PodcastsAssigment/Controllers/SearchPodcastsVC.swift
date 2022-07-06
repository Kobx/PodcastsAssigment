//
//  ViewController.swift
//  PodcastsAssigment
//
//  Created by Koby Shirazi on 04/07/2022.
//

import UIKit
import RxSwift
import RxCocoa


class SearchPodcastsVC: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    private let cellIdentifier = "PodcastCell"
    private let apiClient = APIClient()
    private let disposeBag = DisposeBag()
    
    
    //MARK: LifeCycle
    
    static func instantiate() -> SearchPodcastsVC {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: "MainViewController") as! SearchPodcastsVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = nil
        tableView.delegate = nil
        
        configureReactiveBinding()
    }
    
    //MARK: RxSwift binding
    
    private func configureReactiveBinding() {
        self.searchBar.rx.text.asObservable()
            .map { ($0 ?? "").lowercased() }
            .map { PodcastsRequest(searchString: $0)} //create request object for our search string
            .debounce(.milliseconds(400), scheduler: MainScheduler.instance) //limit api calls on typing
            .flatMapLatest { [unowned self] request -> Observable<[Podcast]> in
                return self.apiClient.send(apiRequest: request) //run the API call
            } //bind to tableView
            .bind(to: tableView.rx.items(cellIdentifier: cellIdentifier)) { index, model, cell in
                if let cell = cell as? PodcastCell {
                    cell.configureWith(PodcastCellViewModel.init(model)) //configure cell with our ViewModel
                }
            }
            .disposed(by: disposeBag) //memory managment
        
        //On cell selection we show present the details screen by using our AppCoordinator
        tableView.rx.modelSelected(Podcast.self)
            .map { PodcastDetailsViewModel.init($0) } //transform to a ViewModel
            .subscribe(onNext: {
                self.tableView.deselectRow(at: self.tableView.indexPathForSelectedRow!, animated: true)
                Utils.getCoordinator()?.showPodcastDetailsVC(withViewModel: $0)
            })
            .disposed(by: disposeBag) //memory managment
    }
    
    //MARK: SearchBar Delegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}

