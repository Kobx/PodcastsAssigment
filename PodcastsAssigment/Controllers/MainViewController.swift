//
//  ViewController.swift
//  PodcastsAssigment
//
//  Created by Koby Shirazi on 04/07/2022.
//

import UIKit
import RxSwift
import RxCocoa


class MainViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    private let cellIdentifier = "PodcastCell"
    private let apiClient = APIClient()
    private let disposeBag = DisposeBag()
    
    //MARK: LifeCycle
    
    static func instantiate() -> MainViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = nil
        tableView.delegate = nil
        
        configureReactiveBinding()
    }

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
    }
}

