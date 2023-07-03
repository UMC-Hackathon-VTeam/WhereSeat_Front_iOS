//
//  WrittenDiaryListViewController.swift
//  WhereSeat_iOS
//
//  Created by 정호진 on 2023/07/03.
//

import UIKit
import SnapKit

final class WrittenDiaryListViewController: UIViewController {
    var selectDate: String?
    private var diaryTextFieldConstraint: Constraint?
    private var data: WrittenDiaryModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0) /* #f8f8f8 */

        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis")?.rotate(degrees: 90),
                                                                     menu: menu)
        seperateDate()
        setKeyboardObserver()
        getDate()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }

    // MARK:
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    // MARK:
    private lazy var contentView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    // MARK:
    private lazy var titleTextField: PaddedTextField = {
        let field = PaddedTextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: field.frame.height))
        field.isEnabled = false
        field.text = "aaa"
        field.font = .boldSystemFont(ofSize: 23)
        field.keyboardType = .default
        field.leftView = paddingView
        field.leftViewMode = .always
        return field
    }()
    
    // MARK:
    private lazy var imgBtn: UIButton = {
        let btn = UIButton()
        btn.isEnabled = false
        btn.setImage(UIImage(named: "11")?.resize(newWidth: view.safeAreaLayoutGuide.layoutFrame.width), for: .normal)
        btn.setImage(UIImage(named: "11")?.resize(newWidth: view.safeAreaLayoutGuide.layoutFrame.width), for: .disabled)
        btn.addTarget(self, action: #selector(clickedImgBtn), for: .touchUpInside)
        return btn
    }()
    
    // MARK:
    private lazy var diaryTextField: PaddedTextField = {
        let field = PaddedTextField()
        field.isEnabled = false
        field.text = "aaa"
        
        field.textAlignment = .left
        field.contentVerticalAlignment = .top
        field.padding = UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 0)

        return field
    }()
    
    private lazy var menuItems: [UIAction] = {
        return [
            UIAction(title: "수정",
                     image: UIImage(systemName: "square.and.arrow.up"),
                     handler: { _ in
                         self.diaryTextField.isEnabled = true
                         self.diaryTextField.backgroundColor = .white
                         self.imgBtn.isEnabled = true
                         self.titleTextField.isEnabled = true
                         self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", image: nil, target: self, action: #selector(self.clickedInsertBtn))
                     }),
            UIAction(title: "삭제",
                     image: UIImage(systemName: "trash"),
                     attributes: .destructive, handler: { _ in
                         /// 삭제 처리 해야함
                     }),
        ]
    }()
    
    private lazy var menu: UIMenu = {
        return UIMenu(title: "", options: [], children: menuItems)
    }()
    
    // MARK:
    private func addUI(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(titleTextField)
        contentView.addSubview(imgBtn)
        contentView.addSubview(diaryTextField)
        
        titleTextField.delegate = self
        diaryTextField.delegate = self
        
        setAutoLayout()
    }
    
    // MARK:
    private func setAutoLayout(){
        
        scrollView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.bottom.equalTo(scrollView.snp.bottom)
            make.width.equalTo(scrollView.snp.width)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(30)
            make.leading.equalTo(contentView.snp.leading).offset(30)
        }
        
        imgBtn.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(30)
            make.leading.equalTo(contentView.snp.leading).offset(30)
            make.trailing.equalTo(contentView.snp.trailing).offset(-30)
        }
        
        diaryTextField.snp.makeConstraints { make in
            make.top.equalTo(imgBtn.snp.bottom).offset(30)
            make.leading.equalTo(contentView.snp.leading).offset(30)
            make.trailing.equalTo(contentView.snp.trailing).offset(-30)
            make.height.equalTo(view.safeAreaLayoutGuide.layoutFrame.height/2)
            self.diaryTextFieldConstraint = make.bottom.equalTo(contentView.snp.bottom).offset(-30).constraint
        }
    }
    
    
    // MARK: 전달 받은 다이어리 날짜 변환
    private func seperateDate(){
        guard let selectDate = self.selectDate else { return }
        
        let date = selectDate.split(separator: " ")[0]
        let day = selectDate.split(separator: " ")[1]
        self.navigationItem.title = "\(date) (\(day))"
    }
    
    
    // MARK:
    private func getDate(){
        data = WrittenDiaryModel(title: "Test!", img: "", description: "testtestsetsetsetests")
        
        addUI()
        titleTextField.text = data?.title
        diaryTextField.text = data?.description
        
    }

    // MARK:
    @objc
    private func clickedInsertBtn(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis")?.rotate(degrees: 90),
                                                                     menu: menu)
        self.diaryTextField.isEnabled = false
        self.diaryTextField.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0) /* #f8f8f8 */
        self.imgBtn.isEnabled = false
        self.titleTextField.isEnabled = false
    }
    
    
    // MARK: 이미지 버튼
    @objc
    private func clickedImgBtn(){
        /*
         
         갤러리 이동 후 사진 선택 해야함
         
         */
    }
    
}

extension WrittenDiaryListViewController {
    func setKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(WrittenDiaryListViewController.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(WrittenDiaryListViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object:nil)
    }
    
    @objc
    func keyboardWillShow(notification: NSNotification) {
        
          if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                  let keyboardRectangle = keyboardFrame.cgRectValue
                  let keyboardHeight = keyboardRectangle.height
              UIView.animate(withDuration: 1) {
                  self.diaryTextFieldConstraint?.update(offset: -(keyboardHeight*3/2))
              }
          }
      }
    
    @objc
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRectangle = keyboardFrame.cgRectValue
                let keyboardHeight = keyboardRectangle.height
            UIView.animate(withDuration: 1) {
                self.diaryTextFieldConstraint?.update(offset: (keyboardHeight*2))
            }
        }
    }


}

 
extension WrittenDiaryListViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == titleTextField {
            textField.resignFirstResponder()
            diaryTextField.becomeFirstResponder()
        } else {
            textField.becomeFirstResponder()
            diaryTextField.resignFirstResponder()
        }
        return true
    }
    
    
}
