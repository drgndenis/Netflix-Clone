//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Denis DRAGAN on 13.07.2023.
//

import UIKit

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
}

class HomeViewController: UIViewController {
    
    // URLs
    private let trendingMoviesURL = "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)"
    private let trendingTvURL = "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)"
    private let popularURL = "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)"
    private let upcomingMoviesURL = "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)"
    private let topRatedURL = "\(Constants.baseURL)/3/tv/top_rated?api_key=\(Constants.API_KEY)"
    
    let sectionTitles: [String] = ["Trendıng Movıes", "Trendıng TV", "Popular" , "Upcomıng Movıes", "Top Rated"]
    
    // TableView olusturulmasi
    private let homeFeedTable : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        configureNavbar()
        // tableHeaderView'a gorunum olusturma
        let heroView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        homeFeedTable.tableHeaderView = heroView
    }
    
    // Cerceve verme
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds // Ekranı komple kaplamasi
    }
    
    private func fetchAndPrintData(url: URL?, cell: CollectionViewTableViewCell) {
        APICaller.shared.getData(url: url) { results in
            switch results {
            case .success(let titles):
                cell.configure(with: titles)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func configureNavbar() {
        let logoImage = UIImage(named: "netflixLogo")?.withRenderingMode(.alwaysOriginal)
        let logoBarButtonItem = UIBarButtonItem(image: logoImage, style: .done, target: self, action: nil)
        logoBarButtonItem.imageInsets = UIEdgeInsets(top: 0, left: -100, bottom: 0, right: 0)
        
        navigationItem.leftBarButtonItem = logoBarButtonItem
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        
        navigationController?.navigationBar.tintColor = .white
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count // Olusacak bolum sayisi
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // Bolum icerisindeki hucre sayisi
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        
        // API ile fotograflarin cekilip gerekli satirlara gelmesi
        switch indexPath.section {
        case Sections.TrendingMovies.rawValue:
            fetchAndPrintData(url: URL(string: trendingMoviesURL), cell: cell)
        case Sections.TrendingTv.rawValue:
            fetchAndPrintData(url: URL(string: trendingTvURL), cell: cell)
        case Sections.Popular.rawValue:
            fetchAndPrintData(url: URL(string: popularURL), cell: cell)
        case Sections.Upcoming.rawValue:
            fetchAndPrintData(url: URL(string: upcomingMoviesURL), cell: cell)
        case Sections.TopRated.rawValue:
            fetchAndPrintData(url: URL(string: topRatedURL), cell: cell)
        default:
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    // Asagiya kaydirildiginda navigation sabit kalması yerine hareket etmesi
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}
