//
//  WelcomeViewController.swift
//  Week1_practice
//
//  Created by 신혜연 on 4/11/25.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var id: String? = ""
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 120, y: 100, width: 150, height: 150))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Daangnee")
        return imageView
    }()
    
    let titleLabel: UILabel = {
        
        let label = UILabel(frame: CGRect(x: 70, y: 308, width: 256, height: 94))
        label.text = "???님\n반가워요!"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        return label
    }()
    
    @objc var backToMainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 472, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 548, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
        bindID()
    }
    
    private func setLayout() {
        [imageView, titleLabel, backToMainButton, backToLoginButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    private func bindID() {
        self.titleLabel.text = "\(id!)님 \n반가워요!"
    }
    
    // 프로퍼티와 함수를 이용해 데이터 수정
//    func setLabelText(id: String?) {
//        self.id = id
//    }
    
    @objc
    private func backToLoginButtonDidTap() {
        // 모달이면, 현재 뷰를 닫고 이전 화면으로 돌아감
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else { // 네비면, 이전 뷰 컨트롤러로 pop해서 돌아감
            self.navigationController?.popViewController(animated: true)
        }
    }
}
