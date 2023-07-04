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
    private let imagePickerController = UIImagePickerController()
    
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

    // MARK: Scorll
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        
        return scroll
    }()
    
    // MARK: Content
    private lazy var contentView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    // MARK: Text Field Title
    private lazy var titleTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "제목을 입력해주세요"
        field.font = .boldSystemFont(ofSize: 23)
        field.keyboardType = .default
        
        return field
    }()
    
    // MARK: Image Button
    private lazy var imgBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "Easteregg")?.resize(newWidth: view.safeAreaLayoutGuide.layoutFrame.width), for: .normal)
        btn.addTarget(self, action: #selector(clickedImgBtn), for: .touchUpInside)
        
        return btn
    }()
    
    // MARK: Diary Text Field
    private lazy var diaryTextField: PaddedTextField = {
        let field = PaddedTextField()
        field.text = "오늘의 스토리는 무엇인가요?"
        field.backgroundColor = .white
        field.textAlignment = .left
        field.contentVerticalAlignment = .top
        
        field.padding = UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 0)
        
        return field
    }()
    
    // MARK: Add UI
    private func addUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleTextField)
        contentView.addSubview(imgBtn)
        contentView.addSubview(diaryTextField)
        
        titleTextField.delegate = self
        diaryTextField.delegate = self
        
        setAutoLayout()
    }
    
    // MARK: Setting AutoLayout
    private func setAutoLayout() {
        scrollView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            $0.leading.equalTo(scrollView.snp.leading)
            $0.trailing.equalTo(scrollView.snp.trailing)
            $0.bottom.equalTo(scrollView.snp.bottom)
            $0.width.equalTo(scrollView.snp.width)
        }
        
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(30)
            $0.leading.equalTo(contentView.snp.leading).offset(30)
        }
        
        imgBtn.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(30)
            $0.leading.equalTo(contentView.snp.leading).offset(30)
            $0.trailing.equalTo(contentView.snp.trailing).offset(-30)
        }
        
        diaryTextField.snp.makeConstraints {
            $0.top.equalTo(imgBtn.snp.bottom).offset(30)
            $0.leading.equalTo(contentView.snp.leading).offset(30)
            $0.trailing.equalTo(contentView.snp.trailing).offset(-30)
            $0.height.equalTo(view.safeAreaLayoutGuide.layoutFrame.height/2)
            
            self.diaryTextFieldConstraint = $0.bottom.equalTo(contentView.snp.bottom).offset(-30).constraint
        }
    }
    
    // MARK: Convert Diary Date
    private func seperateDate() {
        guard let selectDate = self.selectDate else { return }
        
        let date = selectDate.split(separator: " ")[0]
        let day = selectDate.split(separator: " ")[1]
        self.navigationItem.title = "\(date) (\(day))"
    }
    
    // MARK: Image Button
    @objc
    private func clickedImgBtn() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "사진 찍기", style: .default, handler: {(ACTION:UIAlertAction) in
            self.imagePickerController.delegate = self
            self.imagePickerController.sourceType = .camera
            self.present(self.imagePickerController, animated: true, completion: nil)
            })
        )
        
        actionSheet.addAction(UIAlertAction(title: "갤러리에서 불러오기", style: .default, handler: {(ACTION:UIAlertAction) in
            self.imagePickerController.delegate = self
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true, completion: nil)
            })
        )
        
        self.present(actionSheet, animated: true, completion: nil)
    }

    // MARK: Done Button
    @objc
    private func clickedDoneBtn() {
        if !(imgBtn.imageView?.image?.isEqual(UIImage(named: "기본 사진")) ?? true) && titleTextField.text != "" {
            let alert = UIAlertController(title: "일기 등록 완료!", message: "등록이 완료되었습니다.", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default, handler: { _ in
                self.navigationController?.popViewController(animated: true)
                
                guard let title = self.titleTextField.text else { return }
                guard (self.imgBtn.imageView?.image) != nil else { return } // guard let image = self.imgBtn.imageView?.image else { return }
                let description = self.titleTextField.text ?? ""
                guard let time = self.selectDate?.split(separator: " ")[0] else { return }
                
                DiaryService.service.inputData(data: DiaryModel(image: "Review", visitedAt: "\(String(describing: time))", comment: title,description: description))
                }
            )

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
 
extension NewWriteViewController: UITextFieldDelegate {
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == titleTextField {
            titleTextField.text = ""
        } else {
            diaryTextField.text = ""
        }
    }
}

extension NewWriteViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imgBtn.setImage(image.resize(newWidth: self.imgBtn.frame.width, newHeight: self.imgBtn.frame.height), for: .normal)
            self.imgBtn.clipsToBounds = true
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
