import Foundation

extension BeforeSnowMeltsNodes {
    static let susongTrip: [String: StoryNode] = [
        "disc_only_branch": StoryNode(
            id: "disc_only_branch",
            title: "只借光盘",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "你决定不把周六饭局变成跨省行动。光盘可以借，心意可以藏，宿松可以暂时不去。"),
                DialogueLine(speaker: "我", content: "我把《战神》放进机器，第一次觉得奎托斯也有点像社交礼仪导师：少说，先打。"),
                DialogueLine(speaker: "皖竹", content: "好玩吗？"),
                DialogueLine(speaker: "我", content: "好玩。但我真正想回答的是：只要是你借我的，都好玩。还好我没有这么说。"),
                DialogueLine(speaker: "旁白", content: "这条线里，你们保持联系，偶尔见面，关系像光盘读取一样慢慢转。没有宿松三日，也就没有那段把一切推向转折的封闭车程。"),
                DialogueLine(speaker: "我", content: "不是坏结局。只是有些故事如果少了一场雨，就会晚一点发芽。")
            ],
            choices: [
                StoryChoice(
                    text: "接受慢一点的关系",
                    destinationID: "ending_slow_friend",
                    effects: RelationshipEffects(sincerity: 2, ease: 4, boundaries: 7)
                ),
                StoryChoice(
                    text: "还是忍不住问她返程怎么办",
                    destinationID: "ask_before_susong",
                    effects: RelationshipEffects(sincerity: 4, ease: 2, boundaries: 2)
                )
            ],
            fragmentIDToUnlock: "disc_only",
            imageName: "MYXJ_20230402002305678_fast"
        ),
        "ask_before_susong": StoryNode(
            id: "ask_before_susong",
            title: "先问一句",
            text: "",
            dialogues: [
                DialogueLine(speaker: "我", content: "我先问她：如果我去宿松送你回南京，会不会让你为难？"),
                DialogueLine(speaker: "旁白", content: "这句话比“我要去”难发。因为它允许她拒绝，也承认你的计划确实离谱。"),
                DialogueLine(speaker: "皖竹", content: "真的假的？你想把我吓死。"),
                DialogueLine(speaker: "我", content: "我说是真的，但你可以当它是一个提议，不是通知。"),
                DialogueLine(speaker: "旁白", content: "她没有立刻答应，也没有立刻否定。震惊还是震惊，但震惊里多了一点被尊重的余地。"),
                DialogueLine(speaker: "我", content: "这一点余地很重要。喜欢如果只剩下执行力，就会像一辆不看路况的车。")
            ],
            choices: [
                StoryChoice(
                    text: "她没有拒绝，继续准备宿松",
                    destinationID: "susong_prep",
                    effects: RelationshipEffects(sincerity: 6, ease: 2, boundaries: 2)
                ),
                StoryChoice(
                    text: "她犹豫了，于是你停下来",
                    destinationID: "ending_friend_line",
                    effects: RelationshipEffects(sincerity: 2, ease: 3, boundaries: 8)
                )
            ],
            fragmentIDToUnlock: "ask_before_susong",
            imageName: ""
        ),
        "daylight_susong": StoryNode(
            id: "daylight_susong",
            title: "白天出发",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "你决定白天再出发。没有凌晨一点的孤注一掷，也没有服务区里每三十分钟闭眼的硬撑。"),
                DialogueLine(speaker: "我", content: "这条线里的我更像正常人。正常到有点不像我。"),
                DialogueLine(speaker: "皖竹", content: "那你住哪里呢？"),
                DialogueLine(speaker: "我", content: "有澡堂、网吧、电竞酒店，就没有我住不了的地方。这句还是说了，因为不说就不是我。"),
                DialogueLine(speaker: "旁白", content: "白天的路更清楚，车灯没有把所有东西都照成命运。你抵达得晚一点，疲惫少一点，离谱也少一点。"),
                DialogueLine(speaker: "我", content: "可是少一点离谱，也会少一点那种“我真的来了”的证据。")
            ],
            choices: [
                StoryChoice(
                    text: "抵达宿松，继续真实发生的三日",
                    destinationID: "susong_trip",
                    effects: RelationshipEffects(sincerity: 7, ease: 1, boundaries: 1)
                ),
                StoryChoice(
                    text: "只吃周六那顿饭，不进入三日",
                    destinationID: "ending_slow_friend",
                    effects: RelationshipEffects(sincerity: 3, ease: 4, boundaries: 6)
                )
            ],
            fragmentIDToUnlock: "daylight_drive",
            imageName: ""
        ),
        "invited_susong": StoryNode(
            id: "invited_susong",
            title: "你可以拒绝",
            text: "",
            dialogues: [
                DialogueLine(speaker: "我", content: "我把计划说得很清楚：我想去宿松，但你可以拒绝。你不用因为我做了决定，就替我承担后果。"),
                DialogueLine(speaker: "旁白", content: "你难得没有把“我可以为你做任何事”放在第一句，而是把她的感受放在第一位。"),
                DialogueLine(speaker: "皖竹", content: "可是宿松实在不是什么好地方。"),
                DialogueLine(speaker: "我", content: "我说，我不是去旅游的。我是想看看你长大的地方。如果你觉得不方便，我就在南京等你。"),
                DialogueLine(speaker: "旁白", content: "她沉默了一会儿。沉默不是拒绝，也不是答应，它像真正的选择正在形成。"),
                DialogueLine(speaker: "我", content: "这条线里，我第一次明白：让她选择，也是靠近她的一种方式。")
            ],
            choices: [
                StoryChoice(
                    text: "她让你来，于是你出发",
                    destinationID: "susong_trip",
                    effects: RelationshipEffects(sincerity: 8, ease: 3, boundaries: 3)
                ),
                StoryChoice(
                    text: "她说下次吧，于是你等",
                    destinationID: "ending_slow_burn_line",
                    effects: RelationshipEffects(sincerity: 3, ease: 4, boundaries: 8)
                )
            ],
            fragmentIDToUnlock: "invited_susong",
            imageName: ""
        )
    ]
}
