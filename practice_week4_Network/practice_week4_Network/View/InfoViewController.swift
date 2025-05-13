//
//  InfoViewController.swift
//  practice_week4_Network
//
//  Created by 신혜연 on 5/9/25.
//
import UIKit
import SnapKit
import Then

final class InfoViewController: UIViewController {

    // MARK: - Properties

    private var keyword: String = ""

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setLayout()
    }
    
    @objc private func textFieldDidEditing(_ textField: UITextField) {
        self.keyword = textField.text ?? ""
    }

    // MARK: - Layout

    private func setLayout() {
        self.view.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(150)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(170)
        }

        [keywordTextField, infoLabel, searchButton].forEach {
            self.stackView.addArrangedSubview($0)
        }
    }

    // MARK: - UI Components

    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 10
    }

    private lazy var keywordTextField = UITextField().then {
        $0.addTarget(self, action: #selector(textFieldDidEditing(_:)), for: .editingChanged)
        $0.backgroundColor = .systemGray6
        $0.placeholder = "검색할 닉네임 키워드를 입력하세요"
        $0.layer.cornerRadius = 8
        $0.setLeftPadding(12)
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private lazy var infoLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 16)
        $0.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private lazy var searchButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(searchButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = .systemBlue
        $0.setTitle("검색", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 8
        $0.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    // MARK: - Actions

    @objc private func searchButtonTap() {
        Task {
            do {
                let nicknameList = try await GetInfoServiece.shared.fetchNickNameList(keyword: self.keyword.isEmpty ? nil : self.keyword)
                
                let nicknameTexts = nicknameList.map { "\($0)" }.joined(separator: "\n")
                self.infoLabel.text = "닉네임 리스트:\n\(nicknameTexts)"
                
            } catch {
                self.infoLabel.text = "조회 실패: \(error.localizedDescription)"
            }
        }
    }
}
