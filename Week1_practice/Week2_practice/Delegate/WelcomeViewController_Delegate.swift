//
//  WelcomeViewController_Delegate.swift
//  Week1_practice
//
//  Created by 신혜연 on 4/22/25.
//

import UIKit

// 클래스에만 사용가능한 프로토콜 선언
protocol DataBindDelegate: AnyObject {
    // 구현해야할 메서드 선언
    func dataBinding(id: String)
}

class WelcomeViewController_Delegate: UIViewController {
    // deleate 변수 선언
    weak var delegate: DataBindDelegate?
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
    
    var backtoMainButton: UIButton = {
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
        [imageView, titleLabel, backtoMainButton, backToLoginButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    private func bindID() {
        self.titleLabel.text = "\(id ?? "혜연")님 \n반가워요!"
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        
        if let id = id {
            delegate?.dataBinding(id: id) // delegate 할 일 지시
        }
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
