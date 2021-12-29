//
//  ViewController.swift
//  Matches
//
//  Created by Kirill Drozdov on 26.12.2021.
//

import UIKit
import SnapKit
import CoreData

var noteList = [Note]()


class ViewController: UIViewController {
    var firstLoad = true

    private let cellIdentifire = "cellID"
    
    var ar1 = ["Спартак","Зенит","ЦСК", "УФА"]
    var arr2 = ["Барселона", "Реал", "Порту", "Химки"]
    var arr3 = [">", "=", "<", "="]
    
  
    
    
    
    func nonDeletedNotes() ->[Note]{
        var noDeletedNoteList = [Note]()
        for note in noteList{
            if note.deletedDate == nil{
                noDeletedNoteList.append(note)
            }
        }
        return noDeletedNoteList
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CellWithMatches", bundle: nil), forCellReuseIdentifier: cellIdentifire)
        setupView()
        setupContraints()
        
        view.backgroundColor = .white
        navigationItem.title = "Matches"
        let barButton = navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(transtionVC))
        
        if firstLoad {
            firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
            do {
                let results: NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let note = result as! Note
                    noteList.append(note)
                }
            } catch {
                print("Fetch Failed")
            }
        }
    }
    
    @objc func transtionVC(){
        let rootVc = CreateViewController()
//        rootVc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(dismis))
        rootVc.navigationItem.titleView?.backgroundColor = .white
        rootVc.navigationItem.titleView?.tintColor = .white
        
        let navVC = UINavigationController(rootViewController: rootVc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
                
    }
                                                                  
    @objc private func dismis(){
            dismiss(animated: true, completion: nil)
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        
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
//        ar1.count
        nonDeletedNotes().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire) as? CellWithMatches
//        cell?.TeamOne.text = ar1[indexPath.row]
//        cell?.TeamTwo.text = arr2[indexPath.row]
//        cell?.ResultMatches.text = arr3[indexPath.row]
//
//        return cell!
        
        let noteCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath) as! CellWithMatches
        let thisNote: Note!
        thisNote = nonDeletedNotes()[indexPath.row]
        noteCell.TeamOne.text = thisNote.teamOne
        noteCell.TeamTwo.text = thisNote.teamTwo
        noteCell.ResultMatches.text = thisNote.teamWin
        
        return noteCell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
   
    
    
}


extension ViewController: UITableViewDelegate {

}
