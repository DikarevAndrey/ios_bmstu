//
//  ViewController.swift
//  DZ2
//
//  Created by Andrey Dikarev on 21/10/2018.
//  Copyright © 2018 Andrey Dikarev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pageHeader: UIView!
    @IBOutlet weak var pageFooter: UIView!
    @IBOutlet weak var pageFooterLabel: UILabel!
    
    private let cellId = "FootballerTableViewCell"
    private let adCellId = "AdvertisingTableViewCell"
    private let segueName = "toFootballerCard"
    
    var model = FeedModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageHeader.layer.borderWidth = 5
        pageHeader.layer.borderColor = UIColor.black.cgColor
        pageFooter.layer.borderWidth = 5
        pageFooter.layer.borderColor = UIColor.black.cgColor
        pageFooterLabel.text = "Total players: \(model.footballers.count)"
        pageFooterLabel.adjustsFontForContentSizeCategory = true
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        tableView.register(UINib(nibName: adCellId, bundle: nil), forCellReuseIdentifier: adCellId)
        tableView.rowHeight = UITableView.automaticDimension
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshTableData(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
//    обновление таблицы
    @objc func refreshTableData(_ refreshControl: UIRefreshControl) {
        model.footballers[0].name = "REFRESHED"
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
//    количество строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.footballers.count + model.footballers.count / 2 + 1
    }
    
//    создание ячейки в строке
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row % 3 == 0) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: adCellId, for: indexPath) as? AdvertisingTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? FootballerTableViewCell else {
                return UITableViewCell()
            }
            let x : Int = (indexPath.row) / 3 + 1
            cell.configureView(footballer: model.footballers[indexPath.row - x])
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = self.tableView.cellForRow(at: indexPath) as? FootballerTableViewCell {
            let footballer = Footballer(image: cell.footballerImage.image!, name: cell.footballerName.text!, team: cell.footballerTeam.text!, rating: Int(cell.footballerRating.text!)!)
            tableView.deselectRow(at: indexPath, animated: true)
            performSegue(withIdentifier: segueName, sender: footballer)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueName {
            guard
                let vc = segue.destination as? FootballerViewController,
                let footballer = sender as? Footballer
                else { return }
            vc.footballer = footballer
        }
    }
}
