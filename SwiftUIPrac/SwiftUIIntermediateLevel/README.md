## 📌 SwiftUI의 기본적인 Property Wrapper들에 대해 학습한 자료입니다.

- 강의 자료 - [Sean Allen의 SwiftUI Fundamentals 강의](https://www.youtube.com/watch?v=b1oC7sLIgpI)

## 📚 학습한 내용

### 프로퍼티 래퍼(Property Wrapper)

- SwiftUI는 기본적으로 Value 타입인 Struct로 구성되어져 있기 때문에 앱의 생명 주기(Life Cycle)동안 메모리에서 사라졌다 없어졌다를 반복하게 됩니다. 따라서 이을 해결해 주기 위해 SwiftUI 자체적으로 어떤 변수에 상태값(State)를 앱 생명주기동안 Struct의 생명 주기와는 별도로 관리해주는 역할을 하는 것이 바로 프로퍼티 래퍼(Property Wrapper)입니다.

### [@State](https://developer.apple.com/documentation/swiftui/state)

- 값 유형의 속성에 대한 저장소입니다.
- 뷰가 생성될 때 최초 한번 생성되고 그 뒤론 앱 생명 주기동안 데이터를 유지해줍니다.

### [@Binding](https://developer.apple.com/documentation/swiftui/binding)

- 두 개의 뷰 간에 데이터를 전달하고 동기화해줍니다.
- 보통 다른 뷰의 @State의 데이터를 전달받는데 사용됩니다.

### [@StateObject](https://developer.apple.com/documentation/swiftui/stateobject)

- Observable한 객체를 인스턴스화시키는 프로퍼티 래퍼 타입입니다.
- 뷰가 생성될 때 최초 한번 생성되고 그 뒤론 앱 생명 주기동안 데이터를 유지해줍니다.
- 주로 @ObservableObject를 채택한 클래스의 인스턴스를 저장하는 용도로 사용됩니다.

### [@ObservableObject](https://developer.apple.com/documentation/combine/observableobject)

- @Published로 선언된 변수의 데이터를 외부로 브로드 캐스팅하는 역할을 해줍니다.

```swift
// 출처 - https://developer.apple.com/documentation/combine/observableobject
class Contact: ObservableObject {
    // 아래 프로퍼티들의 상태값이 변화할 때 이를 구독하고 있는 프로퍼티들에게 브로드 캐스팅됩니다.
    @Published var name: String
    @Published var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func haveBirthday() -> Int {
        age += 1
        return age
    }
}

let john = Contact(name: "John Appleseed", age: 24)
cancellable = john.objectWillChange
    .sink { _ in
        print("\(john.age) will change")
}
print(john.haveBirthday())
// Prints "24 will change"
// Prints "25"　
```

### [@ObservedObject](https://developer.apple.com/documentation/swiftui/observedobject)

- Observable한 객체를 구독하고 있다가 데이터가 변화할 때마다 뷰를 invalid한 상태로 만들어주는 프로퍼티 래퍼 타입입니다.
- 주로 @StateObject로 선언된 프로퍼티가 저장하고 있는 데이터 값을 전달받을 때 사용됩니다.

### [@EnvironmentObject](https://developer.apple.com/documentation/swiftui/environmentobject)

- 앱 전역으로 데이터 상태값을 나타내는데 사용됩니다.
