import PlaygroundSupport
import UIKit
import TableViewFactory

class SimpleTableViewCell: UITableViewCell, Identifiable {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SimpleTableViewCell: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(titleLabel)
    }

    func setupConstraints() {
        titleLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: topAnchor, constant: 16),
             view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
             view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)]
        }
    }
}

class SimpleCellBuilder: TableViewCellBuilder {

    var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }

    func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(SimpleTableViewCell.self)
    }

    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell {
        let cell: SimpleTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }

    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return false
    }
}

class TableViewFactory {

    func make() -> [TableViewSection] {
        let section = StaticSection(
            cellBuilders: cellBuilders(),
            header: header()
        )
        return [section]
    }

    func cellBuilders() -> [TableViewCellBuilder] {
        return (0...5).map { _ in SimpleCellBuilder() }
    }

    func header() -> UIView {
        let header = UIView()
        header.backgroundColor = .black
        return header
    }
}

class ViewModel {
    var dataSource: TableViewDataSource?

    func setupDataSource(in tableView: UITableView) {
        self.dataSource = TableViewDataSource(
            sections: TableViewFactory().make(),
            tableView: tableView
        )
    }
}

final class MyViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 40
        tableView.backgroundColor = .white
        return tableView
    }()

    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(tableView)
        tableView.constraint { view in
            [view.topAnchor.constraint(equalTo: self.view.topAnchor),
             view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
             view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
             view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),]
        }

        viewModel.setupDataSource(in: tableView)    }
}

PlaygroundPage.current.liveView = MyViewController()

//PlaygroundPage.current.liveView = playgroundController(
//    for: MyViewController(),
//    device: .phone4_7inch,
//    orientation: .portrait,
//    traits: .init(preferredContentSizeCategory: .medium)
//)
