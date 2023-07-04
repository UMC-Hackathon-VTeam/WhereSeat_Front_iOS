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
    private var diaryDateList: [String] = []
    private var check: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0) /* #f8f8f8 */
        
        addUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DiaryService.service.getWrittenDiaryList(completion: getData(data:))
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: Calendar Page Control
    private lazy var calendarTitle: UILabel = {
        let label = UILabel()
        label.text = "캘린더"
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    // Go to Previous Month Button
    private lazy var prevButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    // Go to Next Month Button
    private lazy var nextButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    // MARK: Cover Outside of Calendar
    private lazy var outSideView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.layer.shadowOffset = CGSize(width: -3, height: 3)
        view.layer.shadowRadius = 20
        view.layer.shadowOpacity = 0.3
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    // MARK: Calendar View
    private lazy var calendarView: FSCalendar = {
        let cal = FSCalendar()
        cal.backgroundColor = .white
        cal.scope = .month
        cal.scrollEnabled = false
        cal.scrollDirection = .vertical
        
        cal.appearance.weekdayTextColor = .black
        // Header
        cal.appearance.headerDateFormat = "YYYY년 MM월"
        cal.appearance.headerMinimumDissolvedAlpha = 0.0   /// 0으로 설정 시 옆 부분 날짜 안보임
        cal.appearance.headerTitleFont = .boldSystemFont(ofSize: 25)
        
        cal.appearance.titleFont = .systemFont(ofSize: 20)
        return cal
    }()
    
    // MARK: Add UI
    private func addUI() {
        view.addSubview(calendarTitle)
        view.addSubview(outSideView)
        outSideView.addSubview(calendarView)
        outSideView.addSubview(prevButton)
        outSideView.addSubview(nextButton)
        
        calendarView.delegate = self
        calendarView.dataSource = self
        
        setAutoLayout()
        setAction()
    }
    
    // MARK: Setting AutoLayout
    private func setAutoLayout() {
        calendarTitle.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        outSideView.snp.makeConstraints {
            $0.top.equalTo(calendarTitle.snp.bottom).offset(30)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-view.safeAreaLayoutGuide.layoutFrame.height/10)
        }
        
        calendarView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(view.safeAreaLayoutGuide.layoutFrame.height/2)
            $0.centerY.equalToSuperview()
        }
        
        prevButton.snp.makeConstraints {
            $0.centerY.equalTo(calendarView.calendarHeaderView.snp.centerY).multipliedBy(1.1)
            $0.leading.equalTo(calendarView.calendarHeaderView.snp.leading).inset(40)
        }
        
        nextButton.snp.makeConstraints {
            $0.centerY.equalTo(calendarView.calendarHeaderView.snp.centerY).multipliedBy(1.1)
            $0.trailing.equalTo(calendarView.calendarHeaderView.snp.trailing).inset(40)
        }
    }
    
    // MARK: Change Date -> String
    private func formattingDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd E"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        
        return dateFormatter.string(from: date)
    }
    
    // MARK: Prev, Next Button Action
    private func setAction() {
        [prevButton, nextButton].forEach {
            $0.addTarget(self, action: #selector(moveMonthButtonDidTap(sender:)), for: .touchUpInside)
        }
    }
    
    // MARK: Select Button Action
    @objc
    private func moveMonthButtonDidTap(sender: UIButton){
        moveMonth(next: sender == nextButton)
    }
    
    // MARK: Month Move Logic
    private func moveMonth(next: Bool) {
        var currentPage = calendarView.currentPage
        var dateComponents = DateComponents()
        dateComponents.month = next ? 1 : -1
        currentPage = Calendar.current.date(byAdding: dateComponents, to: currentPage)!
        calendarView.setCurrentPage(currentPage, animated: true)
        DiaryService.service.getWrittenDiaryList(completion: getData(data:))
    }
    
    // MARK: Get Data
    private func getData(data: [String]) {
        diaryDateList = []
        data.forEach { date in
            diaryDateList.append(date)
        }
        print(diaryDateList)
        self.calendarView.reloadData()
    }
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    // MARK: Ontap Cell
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(formattingDate(date: date))
        let stirngDate = formattingDate(date: date).split(separator: " ")[0]
        
        if !self.diaryDateList.filter({stirngDate == $0}).isEmpty {
            let nextPage = WrittenDiaryListViewController()
            nextPage.selectDate = formattingDate(date: date)
            navigationController?.pushViewController(nextPage, animated: true)
        } else {
            let nextPage = NewWriteViewController()
            nextPage.selectDate = formattingDate(date: date)
            navigationController?.pushViewController(nextPage, animated: true)
        }
    }
    
    // MARK: Cell Text Color (Weekend Color Change)
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
    
    // MARK: Designate Selected Default Color
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let date = formattingDate(date: date).split(separator: " ")[0]
        
        if !self.diaryDateList.filter({date == $0}).isEmpty {
            return #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        } else {
            return .white
        }
    }
}
