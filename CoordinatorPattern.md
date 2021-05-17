## Coordinator 패턴

### Preface

2년 전에 같은 팀 리드 개발자분이 iOS 앱 아키텍처를 설명하시면서 Coordinator와 MVVM 패턴을 언급하셨습니다. 

저는 그 전까지 Coordinator 패턴을 몰랐습니다. MVVM 패턴도 알기만 했지 진지하게 생각해본 적은 없었죠. (그 전까진 MVC 패턴을 고수하였습니다.)

MVVM 패턴은 그 때 처음 적용하여 사용해봤는데 코드가 세상 깔끔해지더군요. :D 

반면, Coordinator는 적용하기엔 시간적으로 여유가 없어서 그냥 기술 부채로 남겨두고 있었습죠.

그러던 중 MVVM 패턴을 사용하면서 약간의 불만(?)을 느끼게 되었는데, 바로 View의 전환을 ViewController에서 한다는 것이었습니다. 



**A view에서 B view를 모달로 띄울 때 기존 방식**

각각 다른 class에서 present()와 dismiss()를 호출하게 된다.


```objectivec

@IBAction func btnDetailPressed(_ sender: Any) {
	let detailViewController = DetailViewController()
	self.present(detailViewController, animated: true, completion: nil)
}

```

```objectivec

@IBAction func btnDismissPressed(_ sender: Any) {
	self.dismiss(animated: true, completion: nil)
}

```


물론 Rx를 사용하거나 ViewController 내부적으로 동작에 대한 캡슐화를 잘 구현한다면 그 방식을 사용하면 되겠죠? 😀

ViewModel을 사용하여 비지니스 로직의 분리는 가능한데, View 전환은 분리가 안될까? ViewController에서 관리하기엔 그 흐름을 따라가기도 힘들고 왠지 관심사 분리에 크게 위배되는 것 같은 느낌적인 느낌이랄까요? 


그래서 이번 기회에 **Coordinator에 대해 알아보자!** 하고 팔을 걷게 되었습니다. 


### Coordinator란? 

![viewcontroller](https://user-images.githubusercontent.com/52783516/98208138-24e20800-1f80-11eb-9a00-e80118edcebb.png)


위의 그림에서 볼 수 있듯이 ViewController에서 Navigation의 책임을 다른 클래스로 전가하겠다는.. 즉, Coordinator에 맡기겠다는 것입니다.  



### Coordinator의 특징 

느낌상으로 생각나는 것을 적어보아요. 

Coordinator는 화면 전환을 관리하는 놈이라고 했다. 

-> iOS에서 화면 전환하는 케이스를 보면 UINavigationController, UITabBarController, UIPageViewController, 그리고 모달로 띄우는 경우가 있다. 

-> 위에 것들은 보통 [viewController] 배열을 가지고 있다. 

-> delegate도 가지고 있다. 

-> **그러니까 Coordinator도 자식을 가지고 있고, delegate를 가지고 있으면 되지 않을까?**

-> **덧붙여 Coordinator는 보통 시작점(start)을 가지고 있다고 한다.**

의식의 흐름이 다소 😕? 스럽지만, 저는 기본 용어나 지식을 제외하고는 되도록이면 일단은 그 기본을 먼저 생각해보는 날것의(?) 훈련을 해보기로 하였습니다. 맞든 틀리든 말이죠. (틀리면 틀릴 때마다 계속해서 개선점을 찾으면 될 일!)



### 과제 수행

아래와 같이 과제 수행 방식으로 알아가보려고 합니다. 미션을 하나씩 클리어하는 맛이랄까요? ㅎㅎ

- **Task 1.** Coordinator를 간단히 구현해보자.
- **Task 2.** Deeplink도 구현해보자.
- **Task 3.** Authentication(인증) 상태에 따라 View 전환을 달리 해보자.
- **Task 4.** Coordinator 라이브러리를 찾아보고 사용해보자.