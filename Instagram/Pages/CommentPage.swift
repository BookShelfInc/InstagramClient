//
//  CommentPage.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/8/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

class CommentPage: BasePage {
    let tableView = UITableView()
    let textField = UITextField()
    let leaveCommentButton = UIButton()
    
    var comments: [String] = []
    
    var commentBody: CommentBody? {
        didSet {
            print("Fetched")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Comments"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(textField)
        view.addSubview(leaveCommentButton)
        view.addSubview(tableView)
        
        addConstraints()
    }
    
    func addConstraints() {
        textField.placeholder = "Comment"
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.trailing.equalToSuperview()
        }
        
        leaveCommentButton.addTarget(self, action: #selector(addComment), for: .touchUpInside)
        leaveCommentButton.setTitle("Comment", for: .normal)
        leaveCommentButton.setTitleColor(.black, for: .normal)
        leaveCommentButton.backgroundColor = .lightGray
        leaveCommentButton.snp.makeConstraints { (make) in
            make.top.equalTo(textField.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(leaveCommentButton.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    @objc func addComment() {
        guard let comment = textField.text, !comment.isEmpty else {
            return
        }
        
        commentBody!.comment = comment
        
        PhotoAPIManager.leaveComment(with: commentBody!, token: Constants.testToken) { (isValid) in
            if isValid {
                self.comments.append(comment)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("Fail")
            }
        }
    }
}

extension CommentPage: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = comments[indexPath.row]
        return cell!
    }
}
