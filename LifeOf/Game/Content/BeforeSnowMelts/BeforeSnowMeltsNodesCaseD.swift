import Foundation

extension BeforeSnowMeltsNodes {
    static let mountainAndReturn: [String: StoryNode] = [
        "no_question_night": StoryNode(
            id: "no_question_night",
            title: "严肃问题先不问",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "你把那个严肃问题咽了回去。绿色招牌、砂锅、大排、奶茶先生，全都停在一个还算安全的晚上。"),
                DialogueLine(speaker: "我", content: "我送她到家门口，站在两米开外，没有越过她的生活边界。"),
                DialogueLine(speaker: "皖竹", content: "明天要不要去小孤山？"),
                DialogueLine(speaker: "旁白", content: "没有那个让空气炸开的答案，也就没有小丑简介，没有“我没有觉得你是小丑”的安慰。"),
                DialogueLine(speaker: "我", content: "这条线更平稳，但少了一次把真心摊开的机会。好处是没那么痛，坏处是也没那么清楚。"),
                DialogueLine(speaker: "旁白", content: "有些关系需要问题，有些关系需要等待。你不知道哪一种更对，只知道真实的你最后还是问了。")
            ],
            choices: [
                StoryChoice(
                    text: "第二天仍然去小孤山",
                    destinationID: "sunday_night",
                    effects: RelationshipEffects(sincerity: 5, ease: 4, boundaries: 2)
                ),
                StoryChoice(
                    text: "把暧昧留在未问出口之前",
                    destinationID: "ending_slow_burn_line",
                    effects: RelationshipEffects(sincerity: 2, ease: 4, boundaries: 7)
                )
            ],
            fragmentIDToUnlock: "unasked_question",
            imageName: ""
        ),
        "ask_too_much_night": StoryNode(
            id: "ask_too_much_night",
            title: "当晚问到底",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "你没有停在那个让人眩晕的答案前，而是继续问。越问越像想立刻得到判决。"),
                DialogueLine(speaker: "我", content: "我以为说清楚会减少痛苦，结果说清楚有时只是把痛苦照得更亮。"),
                DialogueLine(speaker: "皖竹", content: "你为什么不问呢？要不你问一下呢？", effect: .shake),
                DialogueLine(speaker: "旁白", content: "这句话原本已经足够重。你又往上加了问题，像在还没铺好的桥上继续往前跑。"),
                DialogueLine(speaker: "我", content: "她没有消失，但气氛被我推得太快。那天晚上，我第一次意识到：真诚也可能压迫别人。"),
                DialogueLine(speaker: "旁白", content: "你回到电竞酒店，终于不再为自己找借口。喜欢不是审问，喜欢也不能要求即时结算。")
            ],
            choices: [
                StoryChoice(
                    text: "道歉，然后学会等一等",
                    destinationID: "ending_too_fast_line",
                    effects: RelationshipEffects(sincerity: 3, ease: -1, boundaries: 4)
                ),
                StoryChoice(
                    text: "第二天仍然接受小孤山邀约",
                    destinationID: "sunday_night",
                    effects: RelationshipEffects(sincerity: 5, ease: 1, boundaries: -1)
                )
            ],
            fragmentIDToUnlock: "too_many_questions",
            imageName: ""
        ),
        "service_area_pause": StoryNode(
            id: "service_area_pause",
            title: "服务区喘息",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "返宁路上，你没有一路顶着最低限速硬撑，而是在服务区停了一次。灯光、厕所、便利店，把漫长车程切成可以呼吸的两段。"),
                DialogueLine(speaker: "我", content: "我去买水，她在车里等。我突然意识到，只要她坐在副驾驶，我就已经拥有了很多，不必把每一分钟都聊满。"),
                DialogueLine(speaker: "皖竹", content: "你是不是故意开得很慢？"),
                DialogueLine(speaker: "我", content: "我说不是。后来想想，也不全是假的。安全是真的，舍不得结束也是真的。"),
                DialogueLine(speaker: "旁白", content: "停下来以后，你们反而聊得更轻。没有一直推进关系，也没有一直证明相似。夜路安静，关系也获得一点空白。"),
                DialogueLine(speaker: "我", content: "有时候，空白比更多的话更像信任。")
            ],
            choices: [
                StoryChoice(
                    text: "回南京后仍然早起去小龙湾",
                    destinationID: "monday_subway",
                    effects: RelationshipEffects(sincerity: 5, ease: 5, boundaries: 3)
                ),
                StoryChoice(
                    text: "把这种空白保留下来",
                    destinationID: "ending_slow_burn_line",
                    effects: RelationshipEffects(sincerity: 3, ease: 5, boundaries: 7)
                )
            ],
            fragmentIDToUnlock: "service_area_pause",
            imageName: ""
        ),
        "slow_after_return": StoryNode(
            id: "slow_after_return",
            title: "返宁之后慢一点",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "到南京后，你没有把那句“再给我一点时间”理解成胜利宣言，而是认真问她：要不要慢一点。"),
                DialogueLine(speaker: "我", content: "这句话很难问。因为我最想要的答案是“不用慢”，但她真正需要的可能不是我的最想要。"),
                DialogueLine(speaker: "皖竹", content: "我想把自己的事情处理好。"),
                DialogueLine(speaker: "我", content: "我听懂了。听懂不代表不难过，只是我终于不把难过当成催促她的理由。"),
                DialogueLine(speaker: "旁白", content: "你们还是会聊天，还是会见面，只是每一步都多了一次确认。关系没有被拉远，只是被放进更稳的容器里。"),
                DialogueLine(speaker: "我", content: "如果这条线也能抵达后来，那它一定会慢很多，但也许会更温柔。")
            ],
            choices: [
                StoryChoice(
                    text: "还是早起去小龙湾见她",
                    destinationID: "monday_subway",
                    effects: RelationshipEffects(sincerity: 5, ease: 4, boundaries: 4)
                ),
                StoryChoice(
                    text: "把慢一点作为这一章的结尾",
                    destinationID: "ending_slow_burn_line",
                    effects: RelationshipEffects(sincerity: 3, ease: 5, boundaries: 8)
                )
            ],
            fragmentIDToUnlock: "slow_after_return",
            imageName: ""
        ),
        "ask_hand_branch": StoryNode(
            id: "ask_hand_branch",
            title: "牵手前先问",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "地铁下车后，你没有直接试探性地牵住她，而是先问了一句。"),
                DialogueLine(speaker: "我", content: "可以牵一下手吗？"),
                DialogueLine(speaker: "旁白", content: "问出口的瞬间，你觉得自己像把所有心跳都摆在她面前。没有突袭，没有侥幸，只有一个等待回答的人。"),
                DialogueLine(speaker: "皖竹", content: "可以。"),
                DialogueLine(speaker: "我", content: "那只手还是会出汗。不同的是，这一次手汗里少了一点偷袭成功的慌，多了一点被允许的踏实。"),
                DialogueLine(speaker: "旁白", content: "真实发生的第一次牵手没有这句询问，但这个分支并不推翻它。它只是告诉你，喜欢也可以更明亮一点。")
            ],
            choices: [
                StoryChoice(
                    text: "带着被允许的踏实去周三",
                    destinationID: "wednesday_kiss",
                    effects: RelationshipEffects(sincerity: 5, ease: 5, boundaries: 4)
                ),
                StoryChoice(
                    text: "把这一刻作为慢热结尾",
                    destinationID: "ending_slow_burn_line",
                    effects: RelationshipEffects(sincerity: 4, ease: 5, boundaries: 7)
                )
            ],
            fragmentIDToUnlock: "asked_hand",
            imageName: ""
        ),
        "no_holding_hand_branch": StoryNode(
            id: "no_holding_hand_branch",
            title: "只陪她走到公司",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "你没有牵手。你只是和她一起从地铁站走到公司，像两个比昨天更熟一点的人。"),
                DialogueLine(speaker: "我", content: "我当然想牵。想得手心都提前开始潮湿。但我也知道，不发生的事情有时也会留下痕迹。"),
                DialogueLine(speaker: "皖竹", content: "今天好热。"),
                DialogueLine(speaker: "我", content: "我说是的，闷热闷热的。真正想说的是：我刚刚差点把手伸过去。"),
                DialogueLine(speaker: "旁白", content: "你们在园区门口分开。没有里程碑，没有戏剧性，但你第一次觉得，克制也可以是一种共同记忆。"),
                DialogueLine(speaker: "我", content: "它没有证明我不喜欢她，只证明我愿意把喜欢留到她更舒服的时候。")
            ],
            choices: [
                StoryChoice(
                    text: "周三再向前一步",
                    destinationID: "wednesday_kiss",
                    effects: RelationshipEffects(sincerity: 4, ease: 4, boundaries: 4)
                ),
                StoryChoice(
                    text: "把距离保留为慢热结局",
                    destinationID: "ending_slow_burn_line",
                    effects: RelationshipEffects(sincerity: 3, ease: 4, boundaries: 8)
                )
            ],
            fragmentIDToUnlock: "no_holding_hand",
            imageName: ""
        ),
        "real_slow_after_kiss": StoryNode(
            id: "real_slow_after_kiss",
            title: "这次真的停住",
            text: "",
            dialogues: [
                DialogueLine(speaker: "皖竹", content: "我觉得我们有点太快了，明天不许亲。"),
                DialogueLine(speaker: "我", content: "好。"),
                DialogueLine(speaker: "旁白", content: "这一次，你没有把“好”说成一种暂时妥协，而是真的停住了。"),
                DialogueLine(speaker: "我", content: "我送她回去，路上没有试图把气氛重新点燃。安静有点难熬，但她看起来轻松。"),
                DialogueLine(speaker: "旁白", content: "第二天你们重新见面，真的像重新认识了一下。没有倒车到陌生人，只是把车速调回城市道路。"),
                DialogueLine(speaker: "我", content: "我后来才知道，慢一点不是扣分项。她愿意提醒我慢一点，本身就是没有离开的意思。")
            ],
            choices: [
                StoryChoice(
                    text: "把慢一点带进日常",
                    destinationID: "daily_sweet",
                    effects: RelationshipEffects(sincerity: 5, ease: 6, boundaries: 7)
                ),
                StoryChoice(
                    text: "让这一章停在温柔刹车",
                    destinationID: "ending_slow_burn_line",
                    effects: RelationshipEffects(sincerity: 4, ease: 5, boundaries: 8)
                )
            ],
            fragmentIDToUnlock: "real_slow",
            imageName: "MYXJ_20240608201207144_fast"
        ),
        "reset_cute_branch": StoryNode(
            id: "reset_cute_branch",
            title: "明天重新认识",
            text: "",
            dialogues: [
                DialogueLine(speaker: "我", content: "好，我同意开倒车。明天咱俩重新认识一下。"),
                DialogueLine(speaker: "旁白", content: "这句话把严肃的刹车变得轻了一点。你没有否认太快，也没有假装自己不想继续，只是给关系换了一个可爱的说法。"),
                DialogueLine(speaker: "皖竹", content: "你最好是。"),
                DialogueLine(speaker: "我", content: "第二天我确实想重新认识她，但不是回到陌生人。我想认识一个愿意说“太快了”的她，也想让她认识一个愿意听见这句话的我。"),
                DialogueLine(speaker: "旁白", content: "于是你们继续向前。速度慢一点，笑更多一点。那条真实发生的路线里，笨拙和甜都没有被删掉。"),
                DialogueLine(speaker: "我", content: "开倒车当然是不可能真的开倒车。历史的车轮滚滚向前，只是这次没有压到她。")
            ],
            choices: [
                StoryChoice(
                    text: "进入后来那些日常",
                    destinationID: "daily_sweet",
                    effects: RelationshipEffects(sincerity: 5, ease: 7, boundaries: 5)
                ),
                StoryChoice(
                    text: "把可爱倒车作为结局",
                    destinationID: "ending_clumsy_line",
                    effects: RelationshipEffects(sincerity: 5, ease: 5, boundaries: 3)
                )
            ],
            fragmentIDToUnlock: "reset_cute",
            imageName: "MYXJ_20240608201207144_fast"
        )
    ]
}
