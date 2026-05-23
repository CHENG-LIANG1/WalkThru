import Foundation

extension BeforeSnowMeltsNodes {
    static let firstMeet: [String: StoryNode] = [
        "meet_review_slow": StoryNode(
            id: "meet_review_slow",
            title: "第一次见面复盘",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "你没有立刻把第一次见面变成下一次见面的弹药，而是回去复盘。"),
                DialogueLine(speaker: "我", content: "我复盘自己的站姿、语速、口罩、心率、每一句话的颗粒度，甚至想给自己提单修改。"),
                DialogueLine(speaker: "皖竹", content: "好的，期待你下次问题有所收敛。"),
                DialogueLine(speaker: "我", content: "她这句话不像拒绝。更像是给了一个“下次”的接口。对程序员来说，接口就是希望。"),
                DialogueLine(speaker: "旁白", content: "复盘让你短暂冷静，也让第一次见面变得更长。它不只发生在那半小时里，还继续发生在你的脑子里。"),
                DialogueLine(speaker: "我", content: "但冷静不能解决想见她的问题。冷静只会让我更精确地知道：我确实想见她。")
            ],
            choices: [
                StoryChoice(
                    text: "还是在上班路上等她",
                    destinationID: "morning_cookie",
                    effects: RelationshipEffects(sincerity: 4, ease: 2, boundaries: -2)
                ),
                StoryChoice(
                    text: "先把她当普通同事",
                    destinationID: "ending_friend_line",
                    effects: RelationshipEffects(sincerity: 1, ease: 4, boundaries: 7)
                )
            ],
            fragmentIDToUnlock: "first_meet_review",
            imageName: "MYXJ_20230622210640667_fast"
        ),
        "skate_teach_branch": StoryNode(
            id: "skate_teach_branch",
            title: "滑板教学未遂",
            text: "",
            dialogues: [
                DialogueLine(speaker: "我", content: "我说，哪天有机会你也下来透透气，我教你滑板。"),
                DialogueLine(speaker: "皖竹", content: "可以滑板我想学！"),
                DialogueLine(speaker: "旁白", content: "这句话让你短暂看到了另一个世界：园区空地、下班后的风、你假装很专业，她小心翼翼上板。"),
                DialogueLine(speaker: "我", content: "但这个世界没有立刻发生。现实里你们还在试探，任何邀请都像一块太滑的板，一脚踩不好就会摔。"),
                DialogueLine(speaker: "旁白", content: "你把滑板邀约收进未来，把眼前能做的事继续做得很小：问她吃什么、喝什么、有没有安全到家。"),
                DialogueLine(speaker: "我", content: "那些小事很笨，但它们至少不会让她当场摔倒。")
            ],
            choices: [
                StoryChoice(
                    text: "回到真实发生的早餐曲奇线",
                    destinationID: "morning_cookie",
                    effects: RelationshipEffects(sincerity: 4, ease: 3, boundaries: 0)
                ),
                StoryChoice(
                    text: "把小 gesture 做得太满",
                    destinationID: "small_gesture_branch",
                    effects: RelationshipEffects(sincerity: 4, ease: 2, boundaries: -4)
                )
            ],
            fragmentIDToUnlock: "skate_future",
            imageName: ""
        ),
        "cookie_boundary_branch": StoryNode(
            id: "cookie_boundary_branch",
            title: "少做一点",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "早餐曲奇事件之后，你第一次认真考虑：是不是少做一点，反而更像喜欢。"),
                DialogueLine(speaker: "我", content: "我想见她，也想帮她拿东西，但她说不用的时候，我应该真的听见“不用”。"),
                DialogueLine(speaker: "皖竹", content: "下雨天也是需要透气的。"),
                DialogueLine(speaker: "我", content: "这句话把我从“我可以帮你”拉回“她有自己的节奏”。我能做的不是替她走路，而是在她愿意的时候跟上。"),
                DialogueLine(speaker: "旁白", content: "于是你少说了几句“我帮你”，多问了几句“你想不想”。关系没有立刻升温，但也没有因为热度太高而烫伤。"),
                DialogueLine(speaker: "我", content: "后来我才知道，克制不是撤退。克制只是让我有机会走得更久。")
            ],
            choices: [
                StoryChoice(
                    text: "用光盘借还作为下一次见面",
                    destinationID: "ps_disc",
                    effects: RelationshipEffects(sincerity: 3, ease: 2, boundaries: 3)
                ),
                StoryChoice(
                    text: "把关系停在舒服距离",
                    destinationID: "ending_slow_friend",
                    effects: RelationshipEffects(sincerity: 2, ease: 3, boundaries: 7)
                )
            ],
            fragmentIDToUnlock: "cookie_boundary",
            imageName: ""
        ),
        "small_gesture_branch": StoryNode(
            id: "small_gesture_branch",
            title: "小 Gesture 过载",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "你开始相信小 gesture 的力量。拿外卖、送饮料、推荐食物、计算她到家的时间，每一件事都很小。"),
                DialogueLine(speaker: "我", content: "Sex Education 里的 Otis 说，love is not about grand gestures。我牢牢记住前半句，并差点把后半句用力过猛。"),
                DialogueLine(speaker: "皖竹", content: "你说这种话是不是为了听：没有没有？"),
                DialogueLine(speaker: "我", content: "她太聪明了。聪明到我的小心思像摊开的书，连页码都标好了。"),
                DialogueLine(speaker: "旁白", content: "被看穿不一定是坏事。她没有全盘拒绝，只是提醒你：小动作如果太密，也会变成噪音。"),
                DialogueLine(speaker: "我", content: "我决定把这些动作留下一部分，删掉一部分。真正重要的不是数量，是她能不能在里面感到轻松。")
            ],
            choices: [
                StoryChoice(
                    text: "把 gesture 收束成光盘借还",
                    destinationID: "ps_disc",
                    effects: RelationshipEffects(sincerity: 3, ease: 3, boundaries: 2)
                ),
                StoryChoice(
                    text: "继续笨拙但真诚地靠近",
                    destinationID: "ending_clumsy_line",
                    effects: RelationshipEffects(sincerity: 5, ease: 2, boundaries: -2)
                )
            ],
            fragmentIDToUnlock: "small_gesture",
            imageName: ""
        )
    ]
}
