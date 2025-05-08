//
//  ChatTableViewController.swift
//  Week1_practice
//
//  Created by 신혜연 on 5/2/25.
//

import UIKit
import SnapKit

class ChatTableViewController: UIViewController {
    
    // MARK: - Properties
    private let tableView: UITableView = (UITableView(frame: .zero, style: .plain))
    private let chatList = ChatModel.dummy()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        register()
        setLayout()
        setDelegate()
    }
    
    // MARK: - Layout
    private func setLayout() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    // 셀 등록하기
    private func register() {
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: Protocol
extension ChatTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ChatTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 재사용 큐에서 필요한 cell을 dequeue하는 함수
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ChatTableViewCell.identifier, //셀에 선언해둔 식별자
            for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        // 데이터 바인딩 함수호출
        cell.dataBind(chatList[indexPath.row])
        return cell
    }
}
