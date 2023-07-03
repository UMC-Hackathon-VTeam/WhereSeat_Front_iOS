//
//  CalendarViewController.swift
//  WhereSeat_iOS
//
//  Created by Phil on 2023/07/03.
//

import UIKit
import FSCalendar
import SnapKit

final class CalendarViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addUI()
    }
    
    // MARK:
    private lazy var calendarView: FSCalendar = {
        let cal = FSCalendar()
        cal.locale = Locale(identifier: "ko_KR")
        cal.scope = .month
        cal.scrollEnabled = true
        
        cal.scrollDirection = .vertical
        cal.appearance.titleWeekendColor = .red    // 주말

        return cal
    }()
    
    
    // MARK:
    private func addUI(){
        view.addSubview(calendarView)
        
        calendarView.delegate = self
        calendarView.dataSource = self
        
        setAutoLayout()
    }
    
    // MARK:
    private func setAutoLayout(){
        calendarView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    
    // MARK:
    private func formattingDate(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:MM"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: date)
    }
    
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource{
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
        
        print(formattingDate(date: date))
    }
    
    // 날짜 선택 해제 콜백 메소드
    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        let dateFormatter = DateFormatter()
//        print(dateFormatter.string(from: date) + " 날짜가 선택 해제 되었습니다.")
    }
}
