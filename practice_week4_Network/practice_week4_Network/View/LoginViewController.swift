//
//  LoginViewController.swift
//  practice_week4_Network
//
//  Created by 신혜연 on 5/10/25.
//

import UIKit

import SnapKit
import Then

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private var loginId: String = ""
    private var password: String = ""
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
    }
    
    private lazy var idTextField = UITextField().then {
                $0.addTarget(self,
                             action: #selector(textFieldDidEditing(_:)),
                             for: .allEvents)
        $0.backgroundColor = .systemGray6
        $0.placeholder = "아이디가 뭐세요?"
        $0.setLeftPadding(10)
        $0.layer.cornerRadius = 10
    }
    
    private lazy var passwordTextField = UITextField().then {
                $0.addTarget(self,
                             action: #selector(textFieldDidEditing(_:)),
                             for: .allEvents)
        $0.backgroundColor = .systemGray6
        $0.placeholder = "패스워드가 뭐세요?"
        $0.setLeftPadding(10)
        $0.layer.cornerRadius = 10
    }
    
    private lazy var loginButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(loginButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = .systemBlue
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.textColor = .white
        $0.layer.cornerRadius = 10
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    // MARK: - UI Setting
    
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setUI() {
        self.view.addSubview(stackView)
        self.stackView.addArrangedSubviews(
            idTextField,
            passwordTextField,
            loginButton
        )
    }
    
    private func setLayout() {
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(250)
        }
        
        idTextField.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        loginButton.snp.makeConstraints {
            $0.height.equalTo(60)
        }
    }
    
    // MARK: - Action
    @objc private func textFieldDidEditing(_ textField: UITextField) {
        switch textField {
        case idTextField:
            loginId = textField.text ?? ""
        default:
            password = textField.text ?? ""
        }
    }
    
    @objc public func loginButtonTap() {
        Task {
            do {
                let response = try await LoginService.shared.PostLoginData(loginId: self.loginId, password: self.password)
                print("로그인 성공! 유저ID: \(response.userId)")
                
                DispatchQueue.main.async {
                    let successVC = SuccessLoginViewController()
                    self.navigationController?.pushViewController(successVC, animated: true)
                }
                
            } catch {
                print("로그인 실패:", error)
            }
        }
    }
}
