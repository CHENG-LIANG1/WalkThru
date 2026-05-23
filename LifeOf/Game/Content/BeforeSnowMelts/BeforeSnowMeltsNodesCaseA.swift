import Foundation

extension BeforeSnowMeltsNodes {
    static let firstMessage: [String: StoryNode] = [
        "dm_game_friend": StoryNode(
            id: "dm_game_friend",
            title: "普通游戏好友线",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "你决定先不把现实身份抛出来。魂游白金已经足够珍贵，不必立刻把它升级成一场关系事件。"),
                DialogueLine(speaker: "我", content: "我开始认真扮演一个正常游戏好友。讨论血源、浪人、对马岛、桌搭、藏线，像所有刚认识的网友那样礼貌又兴奋。"),
                DialogueLine(speaker: "皖竹", content: "天啦我们的爱好也太像了。"),
                DialogueLine(speaker: "我", content: "这句话在我脑内被自动高亮。我知道正常人应该回一个“哈哈哈是啊”，但我已经在心里把技能点、投胎前、四维时空都分析了一遍。"),
                DialogueLine(speaker: "旁白", content: "你忍住了，没有把这些分析全发出去。你们像两个列表里越来越熟的人，慢慢把彼此从陌生头像变成具体的人。"),
                DialogueLine(speaker: "我", content: "这条线很舒服。舒服到危险，因为我开始害怕：如果我永远不说明白，她会不会永远只把我当成一个很会聊天的网友。")
            ],
            choices: [
                StoryChoice(
                    text: "5.25 还是坦白现实身份",
                    destinationID: "may25_confess",
                    effects: RelationshipEffects(sincerity: 4, ease: 1, boundaries: -1)
                ),
                StoryChoice(
                    text: "把喜欢收成舒服距离",
                    destinationID: "ending_friend_line",
                    effects: RelationshipEffects(sincerity: 1, ease: 5, boundaries: 7)
                )
            ],
            fragmentIDToUnlock: "game_friend",
            imageName: "MYXJ_20230622205433050_fast"
        ),
        "dm_overread": StoryNode(
            id: "dm_overread",
            title: "命运证据过载",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "你把每一个相似点都看成命运给出的盖章：游戏、电影、科幻、猫、加班、摸鱼，甚至连“买游戏才是最好玩的游戏”都像暗号。"),
                DialogueLine(speaker: "我", content: "我越聊越觉得，这不是普通网友。这是基本现实被永恒之人改写后，概率极低但必须发生的相遇。"),
                DialogueLine(speaker: "皖竹", content: "哈哈哈哈不许彩虹屁。"),
                DialogueLine(speaker: "我", content: "她越这么说，我越想继续。因为她没有真的讨厌，她只是在笑。笑对我来说就是通行证。"),
                DialogueLine(speaker: "旁白", content: "但通行证不是永久免检。你意识到，如果把所有热情都一次性倒出去，她可能会被你的确定吓到。"),
                DialogueLine(speaker: "我", content: "喜欢一个人最难的地方，不是证明你多喜欢，而是控制自己不要把证明材料塞满对方桌面。")
            ],
            choices: [
                StoryChoice(
                    text: "冷静一下，再坦白身份",
                    destinationID: "may25_confess",
                    effects: RelationshipEffects(sincerity: 4, ease: 1, boundaries: 2)
                ),
                StoryChoice(
                    text: "先把边界放在前面",
                    destinationID: "boundary_first_wait",
                    effects: RelationshipEffects(sincerity: 3, ease: 2, boundaries: 5)
                )
            ],
            fragmentIDToUnlock: "overread_signals",
            imageName: ""
        ),
        "boundary_first_wait": StoryNode(
            id: "boundary_first_wait",
            title: "边界优先",
            text: "",
            dialogues: [
                DialogueLine(speaker: "我", content: "我决定先说一句不那么像追人的话：如果你觉得不舒服，可以不回，也不用解释。"),
                DialogueLine(speaker: "旁白", content: "这句话发出去以后，你反而更紧张。因为它把主动权交出去，也把你的等待变成了真正的等待。"),
                DialogueLine(speaker: "皖竹", content: "没有不舒服啦。"),
                DialogueLine(speaker: "我", content: "四个字像临时避难所。你知道这不等于喜欢，也不等于许可你继续上头，但至少说明你没有把门撞坏。"),
                DialogueLine(speaker: "旁白", content: "你们继续聊工作、游戏和猫。气氛比之前更稳，也更慢。慢到你开始怀疑，故事会不会就停在这里。"),
                DialogueLine(speaker: "我", content: "可真实发生的那条线里，我没有停。我很笨，但我还是想见她。")
            ],
            choices: [
                StoryChoice(
                    text: "等到 5.28，还是请求见面",
                    destinationID: "may28_meet",
                    effects: RelationshipEffects(sincerity: 5, ease: 2, boundaries: -1)
                ),
                StoryChoice(
                    text: "把关系留在舒服朋友的位置",
                    destinationID: "ending_friend_line",
                    effects: RelationshipEffects(sincerity: 1, ease: 5, boundaries: 8)
                )
            ],
            fragmentIDToUnlock: "boundary_first",
            imageName: ""
        ),
        "worknight_messages": StoryNode(
            id: "worknight_messages",
            title: "加班夜绕行",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "你没有立刻约见面，而是把话题绕回加班、夜宵、PSN 和那种只有华子人才懂的疲惫。"),
                DialogueLine(speaker: "皖竹", content: "老 pan，告诉正非，我想下班了。"),
                DialogueLine(speaker: "我", content: "我把这句话看了很多遍。它不是情话，但它说明她愿意把一个狼狈的夜晚丢给我接住。"),
                DialogueLine(speaker: "旁白", content: "你们聊到凌晨，聊手柄，聊游戏库，聊环境安装失败。现实身份已经坦白，真正的距离却还隔着 N4 和 N5 那条通道。"),
                DialogueLine(speaker: "我", content: "如果一切都只在聊天框里发生，我可能会越来越会说话，却永远不知道她站在面前是什么样子。"),
                DialogueLine(speaker: "旁白", content: "第二天，那个十分钟的念头还是回来了。它没有礼貌，也没有周全，但它很真实。")
            ],
            choices: [
                StoryChoice(
                    text: "第二天还是想见她",
                    destinationID: "may28_meet",
                    effects: RelationshipEffects(sincerity: 5, ease: 3, boundaries: -3)
                ),
                StoryChoice(
                    text: "再等等，不制造见面",
                    destinationID: "ending_slow_friend",
                    effects: RelationshipEffects(sincerity: 2, ease: 4, boundaries: 7)
                )
            ],
            fragmentIDToUnlock: "worknight_chat",
            imageName: ""
        )
    ]
}
