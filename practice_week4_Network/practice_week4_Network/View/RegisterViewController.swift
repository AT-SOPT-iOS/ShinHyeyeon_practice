//
//  LoginViewController.swift
//  practice_week4_Network
//
//  Created by 신혜연 on 5/9/25.
//

import UIKit

import SnapKit
import Then

class RegisterViewController: UIViewController {
    
    // MARK: - Properties
    
    private var loginId: String = ""
    private var password: String = ""
    private var nickName: String = ""
    
    private let textFieldsStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 16
        $0.distribution = .equalSpacing
    }

    private let buttonsStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 20
        $0.distribution = .fillEqually
    }

    private let mainStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 60
    }
    
    private lazy var idTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .systemGray6
        $0.placeholder = "아이디를 입력하슈"
        $0.setLeftPadding(10)
        $0.layer.cornerRadius = 10
    }
    
    private lazy var passwordTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .systemGray6
        $0.placeholder = "패스워드를 입력하슈"
        $0.setLeftPadding(10)
        $0.layer.cornerRadius = 10
    }
    
    private lazy var nickNameTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .systemGray6
        $0.placeholder = "닉네임을 입력하슈"
        $0.setLeftPadding(10)
        $0.layer.cornerRadius = 10
    }
    
    private lazy var registerButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(registerButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = .systemBlue
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.textColor = .white
        $0.layer.cornerRadius = 10
    }
    
    private lazy var userInfoButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(infoViewButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = .systemBlue
        $0.setTitle("회원정보 조회", for: .normal)
        $0.titleLabel?.textColor = .white
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
        view.addSubview(mainStackView)
        textFieldsStackView.addArrangedSubviews(
            idTextField,
            passwordTextField,
            nickNameTextField
        )
        
        buttonsStackView.addArrangedSubviews(
            registerButton,
            userInfoButton,
            loginButton
        )
        
        mainStackView.addArrangedSubviews(
            textFieldsStackView,
            buttonsStackView
        )
    }
    
    private func setLayout() {
        mainStackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(140)
        }
        
        [idTextField, passwordTextField, nickNameTextField].forEach {
            $0.snp.makeConstraints { $0.height.equalTo(40) }
        }
        
        [registerButton, userInfoButton, loginButton].forEach {
            $0.snp.makeConstraints { $0.height.equalTo(60) }
        }
    }
    
    // MARK: - Actions
    
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
    
    @objc private func infoViewButtonTap() {
        let infoVC = InfoViewController()
        let navigationVC = UINavigationController(rootViewController: infoVC)
        self.present(navigationVC, animated: true)
    }
    
    @objc public func registerButtonTap() {
        Task {
            do {
                let response = try await RegisterService.shared.PostRegisterData(loginId: self.loginId,
                                                                                 password: self.password,
                                                                                 nickName: self.nickName)
                let alert = UIAlertController(
                    title: "계정 생성 성공",
                    message: "환영합니다, \(response.nickname)님! (ID: \(response.userId))",
                    preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                
            } catch {
                let alert = UIAlertController(
                    title: "계정 생성 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("회원가입 에러:", error)
            }
        }
    }
    
    @objc public func loginButtonTap() {
        Task {
            do {
                let response = try await LoginService.shared.PostLoginData(loginId: self.loginId, password: self.password)
                print("로그인 성공! 유저ID: \(response.userId)")
                
                let successVC = SuccessLoginViewController()
                self.navigationController?.pushViewController(successVC, animated: true)
            } catch {
                print("로그인 실패:", error)
            }
        }
    }
}
