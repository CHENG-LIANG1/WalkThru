import Foundation

enum BeforeSnowMeltsEndings {
    static let all: [GameEnding] = [
        GameEnding(
            id: "true_end",
            name: "正确时间出现",
            description: "你以为自己靠方法赢了，其实关键只有一个：她也喜欢你。宿松的雨和返宁的夜，只是让这件事终于显形。",
            isTrueEnding: true,
            isAbsurd: false,
            icon: "heart.text.square.fill"
        ),
        GameEnding(
            id: "friend_end",
            name: "舒服朋友线",
            description: "你把喜欢收进更轻的语气里，先做她觉得真诚又舒服的人。宿松、牵手和亲吻没有按真实时间发生，但关系没有被你弄丢。",
            isTrueEnding: false,
            isAbsurd: false,
            icon: "bubble.left.and.bubble.right.fill"
        ),
        GameEnding(
            id: "slow_end",
            name: "慢热但不熄灭",
            description: "你在关键处多问一句、多等一晚、多停一次。正确时间没有消失，它只是被你们一起调慢。",
            isTrueEnding: false,
            isAbsurd: false,
            icon: "flame.fill"
        ),
        GameEnding(
            id: "clumsy_end",
            name: "小 Gesture 线",
            description: "你做了很多笨拙的小动作，也终于学会小 gesture 不是越密越好。被放在心上的感觉很好，透气也同样重要。",
            isTrueEnding: false,
            isAbsurd: false,
            icon: "hands.sparkles.fill"
        ),
        GameEnding(
            id: "too_fast_end",
            name: "太急了线",
            description: "你把问题问得太满，把靠近推得太快。明天不许亲不是结束，而是故事要求你重新学会等一等。",
            isTrueEnding: false,
            isAbsurd: false,
            icon: "pause.circle.fill"
        ),
        GameEnding(
            id: "life_end",
            name: "生活证据",
            description: "从追星成功走到一起回家。吹头发、清理浴室、吃萨莉亚，都成了这条世界线的证词。",
            isTrueEnding: false,
            isAbsurd: false,
            icon: "house.and.flag.fill"
        )
    ]
}
