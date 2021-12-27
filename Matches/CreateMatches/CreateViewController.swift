//
//  CreateViewController.swift
//  Matches
//
//  Created by Kirill Drozdov on 26.12.2021.
//

import UIKit
import SnapKit

class CreateViewController: UIViewController {
    private let items = [">", "=", "<"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        initilize()
        
    }
    
    
    private func initilize(){
        
        let textFieldFirstTeam: UITextField = {
            let tf = UITextField()
            tf.placeholder = "Введите плиз"
            tf.borderStyle = .line
            
            tf.clipsToBounds = true
            
           return tf
        }()
        
        view.addSubview(textFieldFirstTeam)
        textFieldFirstTeam.snp.makeConstraints { make in
            make.top.equalTo(view.bounds.minY + 100)
            make.left.equalToSuperview().inset(5)
            make.width.equalTo(view.bounds.width / 2 - 7) // дела првоерку на то как прыгает тф

            
        }
        
        
        let textFieldSecondTeam: UITextField = {
            let tf = UITextField()
            tf.placeholder = "Введите плиз"
            tf.borderStyle = .line
            
            tf.clipsToBounds = true
            
           return tf
        }()
        
        view.addSubview(textFieldSecondTeam)
        textFieldSecondTeam.snp.makeConstraints { make in
            make.top.equalTo(view.bounds.minY + 100)
            make.right.equalToSuperview().inset(5)
//            make.left.equalTo(textFieldFirstTeam).offset(5)
            make.width.equalTo(view.bounds.width / 2 - 7) // дела првоерку на то как прыгает тф

            
            
            
            let winSegmented: UISegmentedControl = {
               var segmneted = UISegmentedControl(items: items)
                segmneted.selectedSegmentIndex = 0
                segmneted.tintColor = UIColor.black
                segmneted.addTarget(self, action: #selector(self.filterApply), for: .valueChanged)
                return segmneted
            }()
            
            self.view.addSubview(winSegmented)
            winSegmented.snp.makeConstraints { make in
                make.right.left.equalToSuperview().inset(50)
                make.height.equalTo(50)
                make.width.equalTo(view.bounds.width - 25)
                make.centerX.equalToSuperview()
                make.top.equalTo(textFieldFirstTeam.snp_bottomMargin).offset(20)
            }
            
            
        }
        
        
    }
    
    
    @objc private func filterApply(segment: UISegmentedControl) -> Void {
        switch segment.selectedSegmentIndex {
        case 1: break
        case 2: break
        case 3: break
        default: break
            
        }
    }

}
