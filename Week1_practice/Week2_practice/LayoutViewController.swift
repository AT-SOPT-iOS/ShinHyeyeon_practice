//
//  LayoutViewController.swift
//  Week1_practice
//
//  Created by 신혜연 on 4/22/25.
//

import UIKit

class LayoutViewController: UIViewController {
    
    // 화면의 반으로 설정된 너비와 4분의 1로 설정된 높이를 초기화
    private var width = UIScreen.main.bounds.width/2
    private var height = UIScreen.main.bounds.height/4

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [yellowView, greenView, blackView, blueView].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // 각 뷰의 제약조건 설정
        NSLayoutConstraint.activate([
            yellowView.widthAnchor.constraint(equalToConstant: width),
            yellowView.heightAnchor.constraint(equalToConstant: height)])
        
        NSLayoutConstraint.activate([
            blackView.topAnchor.constraint(equalTo: self.yellowView.bottomAnchor, constant: height),
            blackView.widthAnchor.constraint(equalToConstant: width),
            blackView.heightAnchor.constraint(equalToConstant: height)])
        
        NSLayoutConstraint.activate([
            greenView.leadingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 0),
            greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 0),
            greenView.widthAnchor.constraint(equalToConstant: width),
            greenView.heightAnchor.constraint(equalToConstant: height)])
        
        NSLayoutConstraint.activate([
            blueView.leadingAnchor.constraint(equalTo: blackView.trailingAnchor, constant: 0),
            blueView.topAnchor.constraint(equalTo: blackView.bottomAnchor, constant: 0),
            blueView.widthAnchor.constraint(equalToConstant: width),
            blueView.heightAnchor.constraint(equalToConstant: height)])
        
    }
    
    var yellowView: UIView = {
       let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    var greenView: UIView = {
       let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    var blackView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    var blueView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()

}
