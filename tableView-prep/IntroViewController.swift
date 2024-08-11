//
//  IntroViewController.swift
//  tableView-prep
//
//  Created by Ayokunle Pro on 8/11/24.
//

import UIKit

class IntroViewController: UIViewController {
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupTableView()
    }
    
    override func loadView() {
        super.loadView()
        view = tableView
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}


class DetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "DetailsViewController"
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemTeal
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let destinationVC = DetailsViewController2(text: "Ayo")
        navigationController?.pushViewController(destinationVC, animated: true)
    }


}

class DetailsViewController2: UIViewController {
    
    init(text: String) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "DetailsViewController2"
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .red
    }

}



extension IntroViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Name \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(tableView.cellForRow(at: indexPath)?.textLabel?.text as? String ?? "")
        tableView.deselectRow(at: indexPath, animated: true)
        
        let destinationVC = DetailsViewController()
        
//        present(destinationVC, animated: true)
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}
