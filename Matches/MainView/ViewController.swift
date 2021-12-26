//
//  ViewController.swift
//  Matches
//
//  Created by Kirill Drozdov on 26.12.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let cellIdentifire = "cellID"
    
    var ar1 = ["Спартак","Зенит"]
    var arr2 = ["Барселона", "Реал"]
    var arr3 = [">", "="]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CellWithMatches", bundle: nil), forCellReuseIdentifier: cellIdentifire)
        setupView()
        setupContraints()
        
        view.backgroundColor = .white
        navigationItem.title = "Matches"
        let barButton = navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        
        return tableView
    }()
    
    
    private func setupView(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupContraints(){
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview().inset(0)
        }
    }


}





extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ar1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire) as? CellWithMatches
        cell?.TeamOne.text = ar1[indexPath.row]
        cell?.TeamTwo.text = arr2[indexPath.row]
        cell?.ResultMatches.text = arr3[indexPath.row]
        
        return cell!
    }
    
    
}


extension ViewController: UITableViewDelegate {

}
