//
//  NewWriteViewController.swift
//  WhereSeat_iOS
//
//  Created by 정호진 on 2023/07/04.
//

import UIKit
import SnapKit

final class NewWriteViewController: UIViewController {
    var selectDate: String?
    private var diaryTextFieldConstraint: Constraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0) /* #f8f8f8 */

        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "등록", image: nil, target: self, action: #selector(self.clickedDoneBtn))
        seperateDate()
        setKeyboardObserver()
        addUI()
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
    private lazy var titleTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "제목을 입력해주세요"
        field.font = .boldSystemFont(ofSize: 23)
        field.keyboardType = .default
        return field
    }()
    
    // MARK:
    private lazy var imgBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "11")?.resize(newWidth: view.safeAreaLayoutGuide.layoutFrame.width), for: .normal)
        btn.addTarget(self, action: #selector(clickedImgBtn), for: .touchUpInside)
        return btn
    }()
    
    // MARK:
    private lazy var diaryTextField: PaddedTextField = {
        let field = PaddedTextField()
        field.text = "오늘의 스토리는 무엇인가요?"
        field.backgroundColor = .white
        field.textAlignment = .left
        field.contentVerticalAlignment = .top
        
        field.padding = UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 0)
        return field
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
    
    // MARK: 이미지 버튼
    @objc
    private func clickedImgBtn(){
        
        /*
         
         갤러리 이동 후 사진 선택 해야함
         
         */
        
        
    }

    // MARK: 등록 버튼
    @objc
    private func clickedDoneBtn(){
        
        if !(imgBtn.imageView?.image?.isEqual(UIImage(named: "기본 사진")) ?? true) && titleTextField.text != ""{
            let alert = UIAlertController(title: "일기 등록 완료!", message: "등록이 완료되었습니다.", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default, handler: {_ in
                self.navigationController?.popViewController(animated: true)
                
                guard let title = self.titleTextField.text else { return }
                guard let image = self.imgBtn.imageView?.image else { return }
                let description = self.titleTextField.text ?? ""
                
                
                
            })
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
}

extension NewWriteViewController {
    func setKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(NewWriteViewController.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(NewWriteViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object:nil)
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

 
extension NewWriteViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == titleTextField {
            textField.resignFirstResponder()
            diaryTextField.becomeFirstResponder()
        }
        else {
            textField.becomeFirstResponder()
            diaryTextField.resignFirstResponder()
        }
        
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == titleTextField {
            titleTextField.text = ""
        }
        else {
            diaryTextField.text = ""
        }
        
    }
    
}
