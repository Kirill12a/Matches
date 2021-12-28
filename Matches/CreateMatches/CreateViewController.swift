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
    var test = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        initilize()
        
    }
    
    
    private func initilize(){
        
        let textFieldFirstTeam: UITextField = {
            let tf = UITextField()
            tf.placeholder = "Первая команда"
            tf.textAlignment = .center
            tf.borderStyle = .line
            tf.clipsToBounds = true
            tf.layer.borderWidth = 2
            tf.layer.cornerRadius = 15
            
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
            tf.placeholder = "Вторая команда"
            tf.textAlignment = .center
            tf.borderStyle = .line
            
            tf.clipsToBounds = true
            tf.layer.borderWidth = 2
            tf.layer.cornerRadius = 15
            
           return tf
        }()
        
        view.addSubview(textFieldSecondTeam)
        textFieldSecondTeam.snp.makeConstraints { make in
            make.top.equalTo(view.bounds.minY + 100)
            make.right.equalToSuperview().inset(5)
//            make.left.equalTo(textFieldFirstTeam).offset(5)
            make.width.equalTo(view.bounds.width / 2 - 7) // дела првоерку на то как прыгает тф
        
    
            let winSegmented: UISegmentedControl = {
               let segmneted = UISegmentedControl(items: items)
                segmneted.selectedSegmentIndex = 0
                segmneted.tintColor = UIColor.black
                segmneted.addTarget(self, action: #selector(self.filterApply), for: .valueChanged)
                
                return segmneted
            }()
            
            self.view.addSubview(winSegmented)
            winSegmented.snp.makeConstraints { make in
                make.right.left.equalToSuperview().inset(50)
                make.height.equalTo(50) // возможно пофиксить
                make.width.equalTo(view.bounds.width - 25)
                make.centerX.equalToSuperview()
                make.top.equalTo(textFieldFirstTeam.snp_bottomMargin).offset(20)
            }
            
            
            let infoAboutMatches: UITextView = {
               let textView = UITextView()
                textView.contentInsetAdjustmentBehavior = .automatic
                textView.textAlignment = .justified
                textView.textColor = .blue
                textView.backgroundColor = UIColor.lightGray
                textView.font = UIFont.systemFont(ofSize: 20)
                textView.layer.cornerRadius = 15
            
                return textView
            }()
            
            view.addSubview(infoAboutMatches)
            infoAboutMatches.snp.makeConstraints { make in
                make.top.equalTo(winSegmented.snp_bottomMargin).offset(40)
                make.width.height.equalTo(100)
                make.centerX.equalToSuperview()
                make.left.equalTo(50) // Странно, привязал в коде только к левому краю, а на деле к правому тоже привязалось
            }
            
            let saveDataAboutMatches: UIButton = {
                let button = UIButton()
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                button.backgroundColor = .black
                button.setTitle("СОХРАНИТЬ", for: .normal)
                button.layer.cornerRadius = 15
                view.addSubview(button)
                
                return button
            }()
            
            view.addSubview(saveDataAboutMatches)
            saveDataAboutMatches.snp.makeConstraints { make in
                make.top.equalTo(infoAboutMatches.snp_bottomMargin).offset(30)
                make.centerX.equalToSuperview()
                make.width.equalTo(250)
                make.height.equalTo(60)
            }
            
        }
        
    }
    
    @objc private func buttonTapped(){
        print("Save data about matches: \(test)")
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @objc private func filterApply(segment: UISegmentedControl) -> Void {
        switch segment.selectedSegmentIndex {
        case 0: print("0")
        case 1: print("1")
        case 2: print("2")
        default: break
        }
    }

}
