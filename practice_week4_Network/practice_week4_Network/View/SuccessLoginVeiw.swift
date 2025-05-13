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
    
    private lazy var myInfoButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(myInfoButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = .white
        $0.setTitle("내 닉네임 조회", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.addSubviews(successLoginLabel, myInfoButton)
    }
    
    private func setLayout() {
        successLoginLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        myInfoButton.snp.makeConstraints {
            $0.top.equalTo(successLoginLabel.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
    }
    
    @objc public func myInfoButtonTap() {
        let alert = UIAlertController(title: "닉네임 조회",
                                      message: "유저 ID를 입력해주세요",
                                      preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "예: 451"
            textField.keyboardType = .numberPad
        }
        
        let confirmAction = UIAlertAction(title: "조회", style: .default) { _ in
            guard let text = alert.textFields?.first?.text,
                  let userId = Int64(text) else {
                self.showResultAlert(title: "오류", message: "유효한 숫자를 입력해주세요.")
                return
            }
            
            Task {
                do {
                    // 단일 닉네임 조회
                    if let nickname = try await GetMyInfoService.shared.fetchNickNameList(keyword: nil, userId: userId) {
                        self.showResultAlert(title: "조회 결과", message: "닉네임: \(nickname)")
                    } else {
                        self.showResultAlert(title: "조회 결과", message: "닉네임이 존재하지 않아요.")
                    }
                } catch {
                    self.showResultAlert(title: "조회 실패", message: error.localizedDescription)
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
    
    
    private func showResultAlert(title: String, message: String) {
        let resultAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        resultAlert.addAction(UIAlertAction(title: "확인", style: .default))
        present(resultAlert, animated: true)
    }
}
