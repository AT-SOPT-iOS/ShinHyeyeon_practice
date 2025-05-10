//
//  SuccessLoginVeiwController.swift
//  practice_week4_Network
//
//  Created by 신혜연 on 5/11/25.
//
import UIKit

import Then

class SuccessLoginViewController: UIViewController {
    
    private let successLoginLabel = UILabel().then {
        $0.text = "로그인 성공 !"
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 24)
        $0.textColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue

        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.addSubview(successLoginLabel)
    }
    
    private func setLayout() {
        successLoginLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
