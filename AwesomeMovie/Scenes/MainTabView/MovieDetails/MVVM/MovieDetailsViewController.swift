//
//  MovieDetailsViewController.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 12/02/2023.
//

import UIKit

class MovieDetailsViewController: UIViewController,MovieDetailsView {
    //MARK: IBOutlet
    @IBOutlet weak var DetailsTableView: UITableView! {
        didSet {
            DetailsTableView.registerNib(PosterImageTableViewCell.self)
            DetailsTableView.delegate = self
            DetailsTableView.dataSource = self
        }
    }
    // MARK: var
    var finishFlow: (() -> Void)?
    var viewModel: (MovieDetailsViewModelInput & MovieDetailsViewModelOutput)?
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
//MARK: - UITableViewDelegate Extention
extension MovieDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
//MARK: - UITableViewDataSource Extention
extension MovieDetailsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = viewModel?.getData() else {
            return UITableViewCell ()
        }
        let cell = tableView.dequeue(PosterImageTableViewCell.self, indexPath: indexPath)
        cell.configure(data: data, indexPath: indexPath)
        return cell
    }
    
    
}
