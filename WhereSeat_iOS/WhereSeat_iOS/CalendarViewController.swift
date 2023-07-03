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
    
    // MARK: calenderView를 감싸는 View
    private lazy var outSideView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 20
        view.layer.shadowOpacity = 0.5
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    // MARK: 달력 View
    private lazy var calendarView: FSCalendar = {
        let cal = FSCalendar()
        cal.backgroundColor = .white
        cal.scope = .month
        cal.scrollEnabled = true
        cal.scrollDirection = .vertical
        
        cal.appearance.weekdayTextColor = .black
        /// 제목 부분
        cal.appearance.headerDateFormat = "YYYY년 MM월"
        cal.appearance.headerMinimumDissolvedAlpha = 0.0   /// 0으로 설정 시 옆 부분 날짜 안보임
        
        return cal
    }()
    
    
    // MARK: add UI
    private func addUI(){
        view.addSubview(outSideView)
        outSideView.addSubview(calendarView)
        
        calendarView.delegate = self
        calendarView.dataSource = self
        calendarView.register(CalendarViewCell.self, forCellReuseIdentifier: CalendarViewCell.identifier)
        setAutoLayout()
    }
    
    // MARK: setting AutoLayout
    private func setAutoLayout(){
        outSideView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-view.safeAreaLayoutGuide.layoutFrame.height/10)
            
        }
        
        calendarView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
    }
    
    
    // MARK: Change Date -> String
    private func formattingDate(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        
        return dateFormatter.string(from: date)
    }
    
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance{
    
    
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        guard let cell = calendar.dequeueReusableCell(withIdentifier: CalendarViewCell.identifier, for: date, at: position) as? CalendarViewCell else {return FSCalendarCell()}
        
        cell.inputData(text: " ")
        cell.backgroundColor = .white
            
        return cell
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        print(formattingDate(date: date))
        
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        let day = Calendar.current.component(.weekday, from: date) - 1
        
        if Calendar.current.shortWeekdaySymbols[day] == "Sun" || Calendar.current.shortWeekdaySymbols[day] == "일" {
            return .systemRed
        } else if Calendar.current.shortWeekdaySymbols[day] == "Sat" || Calendar.current.shortWeekdaySymbols[day] == "토" {
            return .systemBlue
        } else {
            return .label
        }
    }

  
}
