import Foundation

extension BeforeSnowMeltsNodes {
    static let endings: [String: StoryNode] = [
        "branch_gallery": StoryNode(
            id: "branch_gallery",
            title: "差一点的世界线",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "后来回看，很多选择都像只差一点就会分叉。"),
                DialogueLine(speaker: "我", content: "如果 5.25 没有坦白，如果 5.28 没有说有效期十分钟，如果宿松没有去，如果返宁路上我停了下来，故事都会不同。"),
                DialogueLine(speaker: "旁白", content: "不同不等于错误。有些世界线会慢一点，有些会更笨一点，有些会停在朋友，有些会因为太急而学会道歉。"),
                DialogueLine(speaker: "我", content: "但这些差一点的世界线，都还围着同一个事实转：我想靠近她，也要学会让她舒服。"),
                DialogueLine(speaker: "旁白", content: "选择一个回声，看看它会把第一章带到哪里。")
            ],
            choices: [
                StoryChoice(
                    text: "回到真实发生的世界线",
                    destinationID: "endings_dummy",
                    effects: RelationshipEffects(sincerity: 0, ease: 0, boundaries: 0)
                ),
                StoryChoice(
                    text: "查看舒服朋友线",
                    destinationID: "ending_friend_line",
                    effects: RelationshipEffects(sincerity: 0, ease: 0, boundaries: 0)
                ),
                StoryChoice(
                    text: "查看慢热线",
                    destinationID: "ending_slow_burn_line",
                    effects: RelationshipEffects(sincerity: 0, ease: 0, boundaries: 0)
                ),
                StoryChoice(
                    text: "查看笨拙真诚线",
                    destinationID: "ending_clumsy_line",
                    effects: RelationshipEffects(sincerity: 0, ease: 0, boundaries: 0)
                ),
                StoryChoice(
                    text: "查看太急了线",
                    destinationID: "ending_too_fast_line",
                    effects: RelationshipEffects(sincerity: 0, ease: 0, boundaries: 0)
                )
            ],
            imageName: "MYXJ_20250103174946614_fast"
        ),
        "ending_friend_line": StoryNode(
            id: "ending_friend_line",
            title: "舒服朋友线",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "你把那份喜欢收得很好。好到她没有被吓到，好到你们可以继续分享游戏、电影、猫和不想上班的夜晚。"),
                DialogueLine(speaker: "我", content: "我还是会在她发截图的时候第一时间看见，还是会把她推荐的东西加入列表，还是会在她说下班了的时候替她高兴。"),
                DialogueLine(speaker: "皖竹", content: "你真的很真诚，相处起来也很舒服。"),
                DialogueLine(speaker: "我", content: "这句话在这条线里没有变成通往恋爱的钥匙，而是变成了一张长期有效的通行证。"),
                DialogueLine(speaker: "旁白", content: "故事没有抵达宿松三日，也没有地铁牵手。可它保留了一个重要结果：你没有因为喜欢，而把她从生活里弄丢。"),
                DialogueLine(speaker: "旁白", content: "有些结局不是失败，只是把热烈改写成一个很长的朋友。")
            ],
            choices: [],
            fragmentIDToUnlock: "slowly_nanjing",
            endingIDToTrigger: "friend_end",
            imageName: ""
        ),
        "ending_slow_friend": StoryNode(
            id: "ending_slow_friend",
            title: "慢一点线",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "你没有立刻制造下一次见面，也没有让所有行动都冲向告白。你选择等一等。"),
                DialogueLine(speaker: "我", content: "等待比行动更难。行动至少有反馈，等待只有想象。"),
                DialogueLine(speaker: "皖竹", content: "有缘会见到的。"),
                DialogueLine(speaker: "我", content: "我不信命，我会努力见到你的。可在这条线里，我把“努力”改成了更安静的版本。"),
                DialogueLine(speaker: "旁白", content: "你们仍然会偶遇，会聊天，会在某个下班后的时间点笑出声。只是世界线没有急转弯，它选择用更长的路靠近。"),
                DialogueLine(speaker: "旁白", content: "雪没有立刻融化，但它已经不是冬天最硬的那一块。")
            ],
            choices: [],
            fragmentIDToUnlock: "slow_waiting",
            endingIDToTrigger: "slow_end",
            imageName: ""
        ),
        "ending_slow_burn_line": StoryNode(
            id: "ending_slow_burn_line",
            title: "慢热但不熄灭",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "这条线里，你们没有少喜欢，只是把所有关键动作都加了一层确认。"),
                DialogueLine(speaker: "我", content: "我问能不能去宿松，问能不能牵手，问要不要慢一点。每一次问，都像把自己放到一个可能被拒绝的位置。"),
                DialogueLine(speaker: "皖竹", content: "我想把自己的事情处理好。"),
                DialogueLine(speaker: "我", content: "我说好。不是因为我突然不急了，而是因为我终于知道，她愿意慢慢处理，已经比我想象中更靠近。"),
                DialogueLine(speaker: "旁白", content: "后来你们也许还是会在一起，也许会晚一点。晚一点不坏，晚一点只是少了几次把她吓到的瞬间。"),
                DialogueLine(speaker: "旁白", content: "如果正确时间真的存在，那么等待也可以是抵达正确时间的一部分。")
            ],
            choices: [],
            fragmentIDToUnlock: "slow_burn",
            endingIDToTrigger: "slow_end",
            imageName: "MYXJ_20240608173810341_fast"
        ),
        "ending_clumsy_line": StoryNode(
            id: "ending_clumsy_line",
            title: "笨拙但真诚线",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "你还是做了很多小动作。有的可爱，有的明显，有的像把自己藏在门后又露出半个脑袋。"),
                DialogueLine(speaker: "我", content: "我计算她到家的时间，记她喜欢吃什么，想给她拿外卖，想给她拍照，想在她需要之前先出现。"),
                DialogueLine(speaker: "皖竹", content: "说实话，你当时有点太明显了。"),
                DialogueLine(speaker: "我", content: "我汗流浃背。但她没有把“明显”说成“讨厌”。她说还挺喜欢这种被放在心上的感觉。"),
                DialogueLine(speaker: "旁白", content: "于是这条线没有因为笨拙而结束。它只是把你按在原地，让你学会小 gesture 不是越多越好。"),
                DialogueLine(speaker: "旁白", content: "真诚是你的核心数值，笨拙是它的动画效果。动画可以调，核心不用删。")
            ],
            choices: [],
            fragmentIDToUnlock: "clumsy_sincere",
            endingIDToTrigger: "clumsy_end",
            imageName: ""
        ),
        "ending_too_fast_line": StoryNode(
            id: "ending_too_fast_line",
            title: "太急了线",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "你问得太多，靠得太快，把原本可以自然浮上来的东西提前拉到灯下。"),
                DialogueLine(speaker: "我", content: "我以为勇敢就是不绕路。后来才知道，勇敢也包括在别人还没准备好时停住。"),
                DialogueLine(speaker: "皖竹", content: "我觉得我们有点太快了。"),
                DialogueLine(speaker: "我", content: "这句话在这条线里更重。它不是调情后的刹车，而是一次认真的提醒。"),
                DialogueLine(speaker: "旁白", content: "你没有失去一切，但你失去了继续加速的资格。你必须把喜欢从冲刺改成步行。"),
                DialogueLine(speaker: "旁白", content: "第一章没有判你出局。它只是把手放在你的肩膀上，说：别急，真的别急。")
            ],
            choices: [],
            fragmentIDToUnlock: "learn_to_wait",
            endingIDToTrigger: "too_fast_end",
            imageName: ""
        )
    ]
}
