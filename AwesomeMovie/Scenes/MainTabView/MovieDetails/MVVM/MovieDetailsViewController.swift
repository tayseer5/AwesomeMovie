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
            DetailsTableView.registerNib(BasicInfoTableViewCell.self)
            DetailsTableView.registerNib(DetailsTableViewCell.self)
            DetailsTableView.estimatedRowHeight = 100.0;
            DetailsTableView.delegate = self
            DetailsTableView.dataSource = self
            DetailsTableView.backgroundColor = UIColor(hexString: HexColors.grayshGreen.rawValue)
        }
    }
    // MARK: var
    var finishFlow: (() -> Void)?
    var viewModel: (MovieDetailsViewModelInput & MovieDetailsViewModelOutput)?
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = .white
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
        switch indexPath.row {
        case detailsOrder.poseterImage.rawValue:
            return 250
        case detailsOrder.basicInfo.rawValue:
            return 100
        case detailsOrder.details.rawValue:
            return UITableView.automaticDimension
        default:
            return UITableView.automaticDimension
        }
        
    }
}
//MARK: - UITableViewDataSource Extention
extension MovieDetailsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = viewModel?.getData() else {
            return UITableViewCell ()
        }
        switch indexPath.row {
        case detailsOrder.poseterImage.rawValue:
            let cell = tableView.dequeue(PosterImageTableViewCell.self, indexPath: indexPath)
            cell.configure(data: data, indexPath: indexPath)
            return cell
        case detailsOrder.basicInfo.rawValue:
            let cell = tableView.dequeue(BasicInfoTableViewCell.self, indexPath: indexPath)
            cell.configure(data: data, indexPath: indexPath)
            return cell
        case detailsOrder.details.rawValue:
            let cell = tableView.dequeue(DetailsTableViewCell.self, indexPath: indexPath)
            cell.configure(data: data, indexPath: indexPath)
            return cell
        default:
            return UITableViewCell ()
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layoutIfNeeded()
    }
    
}

enum detailsOrder: Int {
    case poseterImage = 0
    case basicInfo = 1
    case details  = 2
}
