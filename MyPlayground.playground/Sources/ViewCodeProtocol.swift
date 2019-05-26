import Foundation

public protocol ViewCodeProtocol {
    func setupHierarchy()
    func setupConstraints()
    func additionalSetup()

    func buildView()
}

public extension ViewCodeProtocol {
    func buildView() {
        setupHierarchy()
        setupConstraints()
        additionalSetup()
    }

    func additionalSetup() { }
}
