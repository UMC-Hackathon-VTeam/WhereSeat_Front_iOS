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
    private func addUI(){
        addSubview(title)
        
        title.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func inputData(text: String){
        addUI()
        let attributedString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        
        
        if text == "O"{
            imageAttachment.image = UIImage(systemName: "circle")
            attributedString.append(NSAttributedString(attachment: imageAttachment))
            title.attributedText = attributedString
        }
        else if text == "X"{
            imageAttachment.image = UIImage(systemName: "xmark")
            attributedString.append(NSAttributedString(attachment: imageAttachment))
            title.attributedText = attributedString
        }
        else{
            attributedString.append(NSAttributedString(string: " "))
            title.attributedText = attributedString
        }
    }
}
