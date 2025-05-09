//
//  LoginViewController.swift
//  practice_week4_Network
//
//  Created by 신혜연 on 5/9/25.
//

import UIKit

import SnapKit
import Then

class LoginViewController: UIViewController {
    
    private var loginId: String = ""
    private var password: String = ""
    private var nickName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
//    @objc private func infoViewButtonTap() {
//        let infoVC = InfoViewController()
//        self.present(infoVC, animated: true)
//    }
    
    
    @objc private func textFieldDidEditing(_ textField: UITextField) {
        switch textField {
        case idTextField:
            loginId = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        default:
            nickName = textField.text ?? ""
        }
    }
    
    private func setLayout() {
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(200)
        }
        
        [idTextField, passwordTextField, nickNameTextField, registerButton, infoViewButton].forEach {
            self.stackView.addArrangedSubview($0)
        }
    }
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 20
    }
    
    private lazy var idTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .lightGray
        $0.placeholder = "아이디를 입력하슈"
        $0.layer.cornerRadius = 6
    }
    
    private lazy var passwordTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .lightGray
        $0.placeholder = "패스워드를 입력하슈"
        $0.layer.cornerRadius = 6
    }
    
    private lazy var nickNameTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .lightGray
        $0.placeholder = "닉네임을 입력하슈"
        $0.layer.cornerRadius = 6
    }
    
    private lazy var registerButton = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.textColor = .white
        $0.layer.cornerRadius = 6
    }
    
    private lazy var infoViewButton = UIButton().then {
//        $0.addTarget(self,
//                     action: #selector(infoViewButtonTap),
//                     for: .touchUpInside)
        $0.backgroundColor = .systemBlue
        $0.setTitle("회원정보 조회", for: .normal)
        $0.titleLabel?.textColor = .white
        $0.layer.cornerRadius = 6
    }
}

