//
//  CalendarViewCell.swift
//  WhereSeat_iOS
//
//  Created by 정호진 on 2023/07/03.
//

import Foundation
import UIKit
import SnapKit
import FSCalendar

final class CalendarViewCell: FSCalendarCell{
    static let identifier = "CalendarViewCell"
    
    override init!(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init!(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    // MARK:
    private lazy var title: UILabel = {
        let label = UILabel()
        return label
    }()
        
    // MARK:
    private lazy var selectView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        return view
    }()
    
    // MARK:
    private func addUI(){
//        addSubview(title)
        addSubview(selectView)
        
//        title.snp.makeConstraints { make in
//            make.bottom.equalToSuperview()
//            make.centerX.equalToSuperview()
//        }
        selectView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    func inputData(text: String){
        addUI()
        
        selectView.backgroundColor = .cyan
        
//        let attributedString = NSMutableAttributedString(string: "")
//        let imageAttachment = NSTextAttachment()
        
//
//        if text == "O"{
//            imageAttachment.image = UIImage(systemName: "circle")
//            attributedString.append(NSAttributedString(attachment: imageAttachment))
//            title.attributedText = attributedString
//        }
//        else if text == "X"{
//            imageAttachment.image = UIImage(systemName: "xmark")
//            attributedString.append(NSAttributedString(attachment: imageAttachment))
//            title.attributedText = attributedString
//        }
//        else{
//            attributedString.append(NSAttributedString(string: " "))
//            title.attributedText = attributedString
//        }
    }
}
