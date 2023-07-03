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
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK:
    private lazy var calendarTitle: UILabel = {
        let label = UILabel()
        label.text = "캘린더"
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    // 다음 달로 이동 버튼
    private lazy var prevButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    // 다음 달로 이동 버튼
    private lazy var nextButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    
    // MARK: calenderView를 감싸는 View
    private lazy var outSideView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.layer.shadowOffset = CGSize(width: -3, height: 3)
        view.layer.shadowRadius = 20
        view.layer.shadowOpacity = 0.3
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
        cal.appearance.headerTitleFont = .boldSystemFont(ofSize: 25)
        
        cal.appearance.titleFont = .systemFont(ofSize: 20)
        return cal
    }()
    
    
    // MARK: add UI
    private func addUI(){
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
    
    // MARK: setting AutoLayout
    private func setAutoLayout(){
        calendarTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        outSideView.snp.makeConstraints { make in
            make.top.equalTo(calendarTitle.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-view.safeAreaLayoutGuide.layoutFrame.height/10)

        }
        
        calendarView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(view.safeAreaLayoutGuide.layoutFrame.height/2)
            make.centerY.equalToSuperview()
        }
        
        prevButton.snp.makeConstraints { make in
            make.centerY.equalTo(calendarView.calendarHeaderView.snp.centerY).multipliedBy(1.1)
            make.leading.equalTo(calendarView.calendarHeaderView.snp.leading).inset(40)
        }
        
        nextButton.snp.makeConstraints { make in
            make.centerY.equalTo(calendarView.calendarHeaderView.snp.centerY).multipliedBy(1.1)
            make.trailing.equalTo(calendarView.calendarHeaderView.snp.trailing).inset(40)
        }
        
        
    }
    
    // MARK: Change Date -> String
    private func formattingDate(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        
        return dateFormatter.string(from: date)
    }
    
    // MARK: Prev, Next Button Action
    private func setAction(){
        [prevButton, nextButton].forEach {
            $0.addTarget(self, action: #selector(moveMonthButtonDidTap(sender:)), for: .touchUpInside)
        }
    }
    
    // MARK: 선택된 버튼 Action 실행
    @objc
    private func moveMonthButtonDidTap(sender: UIButton){
        moveMonth(next: sender == nextButton)
    }
    
    // MARK: 달 이동 로직
    private func moveMonth(next: Bool) {
        var currentPage = calendarView.currentPage
        var dateComponents = DateComponents()
        dateComponents.month = next ? 1 : -1
        currentPage = Calendar.current.date(byAdding: dateComponents, to: currentPage)!
        calendarView.setCurrentPage(currentPage, animated: true)
    }
    
    
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance{
    
    // MARK: cell을 눌렀을 때
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(formattingDate(date: date))
        let nextPage = WrittenDiaryListViewController()
        nextPage.selectDate = formattingDate(date: date)
        navigationController?.pushViewController(nextPage, animated: true)
    }
    
    // MARK: cell 글씨 색상, (토,일 색상 변경)
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
    
    // MARK: 선택된 기본 색상 지정
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        
        let date = formattingDate(date: date)
        switch date {
        case "2023-07-22":
            return #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        case "2023-07-23":
            return #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        case "2023-07-24":
            return #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        default:
            return .white
        }
    
    }

    
}
