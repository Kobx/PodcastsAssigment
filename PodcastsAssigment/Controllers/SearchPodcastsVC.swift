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
            .map { PodcastsRequest(searchString: $0)}
            .flatMapLatest { [unowned self] request -> Observable<[Podcast]> in
                return self.apiClient.send(apiRequest: request)
            }
            .bind(to: tableView.rx.items(cellIdentifier: cellIdentifier)) { index, model, cell in
                if let cell = cell as? PodcastCell {
                    cell.configureWith(PodcastCellViewModel.init(model))
                }
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Podcast.self)
            .map { PodcastDetailsViewModel.init($0) }
            .subscribe(onNext: {
                self.tableView.deselectRow(at: self.tableView.indexPathForSelectedRow!, animated: true)
                let appCoordinator = Utils.getCoordinator()
                appCoordinator?.showPodcastDetailsVC(withViewModel: $0)
            })
            .disposed(by: disposeBag)
        
    }
    
    //MARK: SearchBar Delegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}

