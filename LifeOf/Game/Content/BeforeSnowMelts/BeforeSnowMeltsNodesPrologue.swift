import Foundation

extension BeforeSnowMeltsNodes {
    static let prologue: [String: StoryNode] = [
        "chapter_open": StoryNode(
            id: "chapter_open",
            title: "身边的强者 Board",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "故事不是从一句开场白开始的，而是从 N5 楼下那块「身边的强者」展板开始的。"),
                DialogueLine(speaker: "我", content: "我在右下角看见她。工号、岗位、年会主持、养猫、可爱，所有信息像线索一样摆在那里。"),
                DialogueLine(speaker: "路人", content: "她是不是相亲角里最美的那一个？"),
                DialogueLine(speaker: "我", content: "我没有凑过去发表意见，只是把她的手机号加进通讯录。那时我还不知道，这个动作会改变后面的一整年。"),
                DialogueLine(speaker: "旁白", content: "后来你在小红书关注她，她也回关。两个人就这样互相躺在列表里，几个月一言不发。"),
                DialogueLine(speaker: "我", content: "我以为这就是全部。她在我人生里闪了一下，然后继续发光，和我无关。")
            ],
            choices: [
                StoryChoice(
                    text: "在沉默里等到魂游白金",
                    destinationID: "qingming_dm",
                    effects: RelationshipEffects(sincerity: 0, ease: 0, boundaries: 0)
                )
            ],
            fragmentIDToUnlock: "strong_board",
            imageName: "MYXJ_20230402011358178_fast"
        ),
        "qingming_dm": StoryNode(
            id: "qingming_dm",
            title: "魂游白金作战",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "清明前后，她把魂游全白金截图发遍所有平台。还好，她没有忘记小红书。"),
                DialogueLine(speaker: "我", content: "这是命运递过来的手柄，也是我唯一敢按下的确认键。加 PS 好友，比直接说想认识你安全得多。"),
                DialogueLine(speaker: "聊天记录", content: "我还没有几个 ps 好友捏，身边没太多朋友。"),
                DialogueLine(speaker: "皖竹", content: "好呀好呀！加好友！"),
                DialogueLine(speaker: "我", content: "她带着一串语气词和感叹号冲过来，我当场确认：她不只是好看，她还会让陌生人的紧张落地。"),
                DialogueLine(speaker: "旁白", content: "游戏、科幻、电影、动漫、桌搭、猫。话题一条条亮起来，你开始相信，你们不是突然说上话，而是早就等着这个入口。")
            ],
            choices: [
                StoryChoice(
                    text: "把网友身份说清楚",
                    destinationID: "may25_confess",
                    effects: RelationshipEffects(sincerity: 5, ease: 1, boundaries: -1)
                ),
                StoryChoice(
                    text: "先当一个普通游戏好友",
                    destinationID: "dm_game_friend",
                    effects: RelationshipEffects(sincerity: 2, ease: 4, boundaries: 3)
                ),
                StoryChoice(
                    text: "把所有相似点都当成命运证据",
                    destinationID: "dm_overread",
                    effects: RelationshipEffects(sincerity: 4, ease: 1, boundaries: -3)
                )
            ],
            fragmentIDToUnlock: "first_message",
            imageName: "MYXJ_20230622205433050_fast"
        ),
        "may25_confess": StoryNode(
            id: "may25_confess",
            title: "坦白和过量彩虹屁",
            text: "",
            dialogues: [
                DialogueLine(speaker: "我", content: "5 月 25 日，我终于说出那句早就憋不住的话：我一直感觉我在哪见过你。"),
                DialogueLine(speaker: "皖竹", content: "真的假的宝宝你在南京吗？"),
                DialogueLine(speaker: "我", content: "在的，而且离得离谱地近。N5、N4、南门、地铁、食堂，那些被我误认为偶然的几秒，其实都在收束。"),
                DialogueLine(speaker: "皖竹", content: "我们不会是同事吧！"),
                DialogueLine(speaker: "旁白", content: "于是你从「姐妹」变成同事，从网友变成一个需要交代清楚的人。你开始彩虹屁轰炸，夸她在南研、南京、中国乃至四维时空都有一战之力。"),
                DialogueLine(speaker: "我", content: "她笑了，没有跑。对我来说，这已经是重大利好。"),
                DialogueLine(speaker: "旁白", content: "接下来几天，你想一起上班、一起下班、送奶茶、拿外卖。每个请求都有礼貌的外壳，也都有一个藏不住的目的：我想见你。")
            ],
            choices: [
                StoryChoice(
                    text: "提出一个十分钟的见面请求",
                    destinationID: "may28_meet",
                    effects: RelationshipEffects(sincerity: 6, ease: 1, boundaries: -4)
                ),
                StoryChoice(
                    text: "先把边界放在前面",
                    destinationID: "boundary_first_wait",
                    effects: RelationshipEffects(sincerity: 4, ease: 2, boundaries: 6)
                ),
                StoryChoice(
                    text: "继续用加班和游戏话题绕一晚",
                    destinationID: "worknight_messages",
                    effects: RelationshipEffects(sincerity: 2, ease: 4, boundaries: 1)
                )
            ],
            imageName: ""
        ),
        "may28_meet": StoryNode(
            id: "may28_meet",
            title: "有效期十分钟",
            text: "",
            dialogues: [
                DialogueLine(speaker: "我", content: "我已经想到了：你来 n4 和 n5 的太空舱连接处，有效期十分钟。"),
                DialogueLine(speaker: "皖竹", content: "太空舱连接处是哪儿？"),
                DialogueLine(speaker: "我", content: "就是两组载人电梯之间的桥，n4 和 n5 三楼的双向通道。"),
                DialogueLine(speaker: "皖竹", content: "在来噜。"),
                DialogueLine(speaker: "旁白", content: "你戴上口罩，心率一路报警。她穿着红裙子出现在视线里，第一句话却把所有紧张都戳破了。"),
                DialogueLine(speaker: "皖竹", content: "你可以说中文吗？"),
                DialogueLine(speaker: "我", content: "我终于能看清她。此前所有夸奖都显得词不达意，我像一个突然失去修辞能力的人，只能反复确认：她真的来了。"),
                DialogueLine(speaker: "旁白", content: "半小时、一次合照、一句「追星成功」。从那天起，偶遇不再够用，你开始想要下一次。")
            ],
            choices: [
                StoryChoice(
                    text: "从一次见面，变成每天想见",
                    destinationID: "morning_cookie",
                    effects: RelationshipEffects(sincerity: 5, ease: 3, boundaries: -3)
                ),
                StoryChoice(
                    text: "先写复盘，不急着制造偶遇",
                    destinationID: "meet_review_slow",
                    effects: RelationshipEffects(sincerity: 3, ease: 2, boundaries: 4)
                ),
                StoryChoice(
                    text: "趁热打铁，约她以后学滑板",
                    destinationID: "skate_teach_branch",
                    effects: RelationshipEffects(sincerity: 4, ease: 5, boundaries: -1)
                )
            ],
            fragmentIDToUnlock: "first_meet",
            imageName: "MYXJ_20230622210640667_fast"
        ),
        "morning_cookie": StoryNode(
            id: "morning_cookie",
            title: "不早说与早餐曲奇",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "见过一次之后，你开始研究所有不算打扰、又能见到她的方法。外卖、奶茶、下雨、透气，每一项都被你纳入行动预案。"),
                DialogueLine(speaker: "我", content: "以后点外卖提前通知我，我会接你的单。白天送外卖躲保安，晚上当保安抓外卖员，你总有用得着我的地方。"),
                DialogueLine(speaker: "皖竹", content: "不用！我就趁拿外卖的时间出去透气了。"),
                DialogueLine(speaker: "旁白", content: "后来你给她点了瑞幸早餐曲奇，想一早亲手交到她手上。偏偏她 8:40 到，你 8:40 去南门拿外卖。"),
                DialogueLine(speaker: "我", content: "我一路往回赶，根本没看见路上的 lo 娘。最后在卖早餐的地方等了二十分钟，顺便了解了很多早餐行业内幕。"),
                DialogueLine(speaker: "旁白", content: "曲奇最终还是送到了。虽然流程像一次失败演练，但只要能把心意交出去，你就觉得不虚此行。")
            ],
            choices: [
                StoryChoice(
                    text: "寻找下一次见面的借口",
                    destinationID: "ps_disc",
                    effects: RelationshipEffects(sincerity: 3, ease: 2, boundaries: -1)
                ),
                StoryChoice(
                    text: "吸取教训，这次真的少做一点",
                    destinationID: "cookie_boundary_branch",
                    effects: RelationshipEffects(sincerity: 2, ease: 1, boundaries: 5)
                ),
                StoryChoice(
                    text: "把“不早说”变成每天的小 gesture",
                    destinationID: "small_gesture_branch",
                    effects: RelationshipEffects(sincerity: 4, ease: 3, boundaries: -4)
                )
            ],
            fragmentIDToUnlock: "first_photo",
            imageName: ""
        ),
        "ps_disc": StoryNode(
            id: "ps_disc",
            title: "光盘、手柄和未来某一天",
            text: "",
            dialogues: [
                DialogueLine(speaker: "我", content: "为了玩她的 PS 光盘，我斥巨资买了个光驱。表面理由是补课，真实理由是：一借一还，就能见两次。"),
                DialogueLine(speaker: "旁白", content: "第一张盘是《战神》。奎托斯还没来得及教会你冷静，你已经在现实里做出了比战神更莽的决定。"),
                DialogueLine(speaker: "聊天记录", content: "希望宝宝早日接过我的手柄。"),
                DialogueLine(speaker: "我", content: "那时这句话还像玩笑。可你知道自己真正想说的是：希望有一天，我们不用找借口，也能坐在同一个屏幕前。"),
                DialogueLine(speaker: "旁白", content: "第一张盘还没打完，故事就被新的路线覆盖了。她松口说，端午后的周六，如果不加班，可以一起吃饭。")
            ],
            choices: [
                StoryChoice(
                    text: "把周六的饭局变成一趟宿松",
                    destinationID: "susong_prep",
                    effects: RelationshipEffects(sincerity: 4, ease: 3, boundaries: -1)
                ),
                StoryChoice(
                    text: "只借光盘，不把她的假期卷进来",
                    destinationID: "disc_only_branch",
                    effects: RelationshipEffects(sincerity: 2, ease: 1, boundaries: 6)
                ),
                StoryChoice(
                    text: "先问她想不想被送回南京",
                    destinationID: "ask_before_susong",
                    effects: RelationshipEffects(sincerity: 5, ease: 2, boundaries: 4)
                )
            ],
            imageName: "MYXJ_20230402002305678_fast"
        ),
        "susong_prep": StoryNode(
            id: "susong_prep",
            title: "出发前夜",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "端午前，她要回宿松。你听说她没买到返程车票，脑子里那条离谱路线开始发光。"),
                DialogueLine(speaker: "我", content: "我想带你去 Costco。"),
                DialogueLine(speaker: "皖竹", content: "为毛？"),
                DialogueLine(speaker: "我", content: "这当然不是重点。重点是我昨晚翻来覆去，觉得这就是我这个假期最想做的事情：看看你长大的地方。"),
                DialogueLine(speaker: "皖竹", content: "可是宿松实在不是什么好地方……"),
                DialogueLine(speaker: "我", content: "那是因为你太熟了。我什么都不知道，所以每一条街都像未解锁地图。"),
                DialogueLine(speaker: "旁白", content: "她还是不信。你说要踩油门了，她说真的假的。凌晨一点多，你真的出发了。")
            ],
            choices: [
                StoryChoice(
                    text: "凌晨出发，去她长大的地方",
                    destinationID: "susong_trip",
                    effects: RelationshipEffects(sincerity: 10, ease: -1, boundaries: -5)
                ),
                StoryChoice(
                    text: "白天再出发，不把她吓醒",
                    destinationID: "daylight_susong",
                    effects: RelationshipEffects(sincerity: 6, ease: 1, boundaries: 4)
                ),
                StoryChoice(
                    text: "把离谱计划说清楚：你可以拒绝",
                    destinationID: "invited_susong",
                    effects: RelationshipEffects(sincerity: 7, ease: 2, boundaries: 6)
                )
            ],
            fragmentIDToUnlock: "costco_joke",
            imageName: ""
        ),
        "susong_trip": StoryNode(
            id: "susong_trip",
            title: "宿松 Day 1",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "早上六点半，你抵达宿松。先去她的母校侧门打卡，又吃了一碗十块钱的手擀面。疲惫还没落地，她说晚上带你去吃东西。"),
                DialogueLine(speaker: "我", content: "那句话自然得像她早有计划。我本来只求见一面，她却给了我一个晚上。苍天有眼，早餐行业有救。"),
                DialogueLine(speaker: "旁白", content: "你走进理发店。Tony 老师拿出 497、597、697 三档命运清单，并自信表示他懂你要的那种卷。"),
                DialogueLine(speaker: "我", content: "我摘下眼镜，等于把人生交给一个陌生人的审美。一个多小时后，我戴上眼镜，开始担心第一印象会不会被头发毁掉。"),
                DialogueLine(speaker: "旁白", content: "傍晚，绿色招牌前，她穿淡绿色裙子走来。她带你吃从小吃到大的砂锅和大排，又带你看高中、小学和雨里的奶茶先生。"),
                DialogueLine(speaker: "我", content: "我坦白了很多事：怎么认识她，怎么偷偷查她，怎么给她建书单，怎么把没处发的信写完。她没有讨厌我，甚至像小孩一样开心。"),
                DialogueLine(speaker: "旁白", content: "夜里送她回家，你问了一个会让自己后悔的问题。她的回答把空气炸开。你笑着告别，回电竞酒店，把难过藏进被子里。")
            ],
            choices: [
                StoryChoice(
                    text: "把难过藏起来，等待第二天",
                    destinationID: "sunday_night",
                    effects: RelationshipEffects(sincerity: 6, ease: 2, boundaries: 0)
                ),
                StoryChoice(
                    text: "那个严肃问题先不问",
                    destinationID: "no_question_night",
                    effects: RelationshipEffects(sincerity: 3, ease: 3, boundaries: 5)
                ),
                StoryChoice(
                    text: "当晚把话问到底",
                    destinationID: "ask_too_much_night",
                    effects: RelationshipEffects(sincerity: 5, ease: -2, boundaries: -7)
                )
            ],
            fragmentIDToUnlock: "susong_arrival",
            imageName: "MYXJ_20230702160252943_fast"
        ),
        "sunday_night": StoryNode(
            id: "sunday_night",
            title: "小孤山停车场与返宁八小时",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "第二天你把社交账号简介都换成小丑。她没有装作没看见。"),
                DialogueLine(speaker: "皖竹", content: "我没有觉得你是小丑，你也不要这样觉得。我觉得你很真诚，相处起来也很舒服。"),
                DialogueLine(speaker: "我", content: "我本来想果断拒绝小孤山邀约，在酒店完成一场体面的自我放下。结果嘴角根本压不住，立刻答应。"),
                DialogueLine(speaker: "旁白", content: "雨很大。去小孤山、停在小孤山停车场、再从小孤山返回，你们几乎没下车。可电影、书、音乐、游戏和成长经历，在车里越聊越多。"),
                DialogueLine(speaker: "旁白", content: "第三天，你到处找乐事红烩味薯片。外卖没有，超市没有，车站小卖部也没有。只能得出结论：宿松人不爱红烩味。"),
                DialogueLine(speaker: "我", content: "下午两点多从宿松东站出发，晚上十点半到南京。我嘴上说不是故意开慢，心里知道自己长期顶着最低限速。"),
                DialogueLine(speaker: "旁白", content: "八个半小时没有变长，反而不够用。你们从电影聊到恶心故事，从朋友聊到一点暧昧。她说，再给她一点时间。"),
                DialogueLine(speaker: "我", content: "那一刻我才明白，决定性的不是我做对了多少事，而是她也喜欢我，而且比我想象中更喜欢我。")
            ],
            choices: [
                StoryChoice(
                    text: "第二天早起十五分钟",
                    destinationID: "monday_subway",
                    effects: RelationshipEffects(sincerity: 8, ease: 8, boundaries: -1)
                ),
                StoryChoice(
                    text: "中途停一次服务区，给彼此喘息",
                    destinationID: "service_area_pause",
                    effects: RelationshipEffects(sincerity: 4, ease: 3, boundaries: 5)
                ),
                StoryChoice(
                    text: "到南京后认真问她要不要慢一点",
                    destinationID: "slow_after_return",
                    effects: RelationshipEffects(sincerity: 6, ease: 4, boundaries: 6)
                )
            ],
            fragmentIDToUnlock: "return_drive",
            endingIDToTrigger: "true_end",
            imageName: "MYXJ_20240608173810341_fast"
        ),
        "monday_subway": StoryNode(
            id: "monday_subway",
            title: "小龙湾的早班地铁",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "第二天一早，你早起十五分钟赶到小龙湾站。那是你第一次和她一起上班。"),
                DialogueLine(speaker: "我", content: "地铁里她本来扶着扶手，后来放心地靠过来。我突然觉得车厢里所有人都在看我：这个人凭什么。"),
                DialogueLine(speaker: "旁白", content: "下车之后，你试探性地牵住她的手。她没有躲开。"),
                DialogueLine(speaker: "我", content: "我和她一样容易出手汗。刚牵没多久，两个人都大汗淋漓。原来第一次牵手不是电影镜头，是手心里诚实的潮湿。"),
                DialogueLine(speaker: "旁白", content: "从那天开始，之前「远远看一眼就满足」的阈值被彻底抬高。你想每天见到她，也想每天下班听她说一声。")
            ],
            choices: [
                StoryChoice(
                    text: "把手心里的汗带到周三",
                    destinationID: "wednesday_kiss",
                    effects: RelationshipEffects(sincerity: 5, ease: 6, boundaries: -3)
                ),
                StoryChoice(
                    text: "牵手前先问她一句",
                    destinationID: "ask_hand_branch",
                    effects: RelationshipEffects(sincerity: 5, ease: 4, boundaries: 5)
                ),
                StoryChoice(
                    text: "不牵手，只陪她走到公司",
                    destinationID: "no_holding_hand_branch",
                    effects: RelationshipEffects(sincerity: 3, ease: 3, boundaries: 7)
                )
            ],
            fragmentIDToUnlock: "right_time",
            imageName: ""
        ),
        "wednesday_kiss": StoryNode(
            id: "wednesday_kiss",
            title: "机器人之梦之后",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "两天后，你们下班去看《机器人之梦》。电影开场前，在老门东的一家饰品店，关系又向前挪了一步。"),
                DialogueLine(speaker: "我", content: "我轻轻亲了她一下，她没有躲。我短暂地失去自信：这可是我之前觉得这辈子都接触不到的人。"),
                DialogueLine(speaker: "皖竹", content: "我觉得我们有点太快了，明天不许亲。"),
                DialogueLine(speaker: "我", content: "我立刻同意开倒车，甚至愿意明天重新认识一下。"),
                DialogueLine(speaker: "旁白", content: "但你们都知道，故事已经不可能退回 N5 楼下。所谓慢一点，不是取消喜欢，而是给喜欢一个更舒服的速度。")
            ],
            choices: [
                StoryChoice(
                    text: "进入后来那些普通又离谱的日常",
                    destinationID: "daily_sweet",
                    effects: RelationshipEffects(sincerity: 6, ease: 7, boundaries: 2)
                ),
                StoryChoice(
                    text: "听她说慢一点，这次真的停住",
                    destinationID: "real_slow_after_kiss",
                    effects: RelationshipEffects(sincerity: 5, ease: 3, boundaries: 8)
                ),
                StoryChoice(
                    text: "开倒车，明天重新认识一下",
                    destinationID: "reset_cute_branch",
                    effects: RelationshipEffects(sincerity: 4, ease: 6, boundaries: 4)
                )
            ],
            fragmentIDToUnlock: "learn_to_wait",
            imageName: "MYXJ_20240608201207144_fast"
        ),
        "daily_sweet": StoryNode(
            id: "daily_sweet",
            title: "生活证据",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "后来有很多证据证明，这不是一场靠冲动维持的故事。她去高铁站前主动抱你一下，你永远记得。"),
                DialogueLine(speaker: "我", content: "周日我给她取快递，买书、零食和花，提前几个小时到南京南站。准备得像攻略，结果找错出站口。"),
                DialogueLine(speaker: "旁白", content: "那天晚上你们又坐在萨莉亚，面对面吃芝士。短短几天里，你以为好日子差点结束，结果它只是换了个座位继续。"),
                DialogueLine(speaker: "皖竹", content: "你在我面前不用自卑。"),
                DialogueLine(speaker: "我", content: "我最喜欢给她吹头发，最擅长每天晚上清理浴室的头发。女神皖竹没有消失，她只是也会变成我怀里的宝宝。"),
                DialogueLine(speaker: "旁白", content: "6 月 24 日，她送你一个蝴蝶标本。奇异人生、蝴蝶效应、每一个 reality，好像都在说：稍微差一点，你们也会找到彼此。")
            ],
            choices: [
                StoryChoice(
                    text: "查看这条世界线的回声",
                    destinationID: "endings_dummy",
                    effects: RelationshipEffects(sincerity: 0, ease: 0, boundaries: 0)
                ),
                StoryChoice(
                    text: "回看那些差一点改写结局的瞬间",
                    destinationID: "branch_gallery",
                    effects: RelationshipEffects(sincerity: 0, ease: 0, boundaries: 0)
                )
            ],
            fragmentIDToUnlock: "daily_life",
            endingIDToTrigger: "life_end",
            imageName: "MYXJ_20240804092821775_fast"
        ),
        "endings_dummy": StoryNode(
            id: "endings_dummy",
            title: "融雪之前",
            text: "",
            dialogues: [
                DialogueLine(speaker: "旁白", content: "这条世界线从 N5 展板开始，经过魂游白金、太空舱连接处、宿松雨夜、返宁长路，最后落到普通生活里。"),
                DialogueLine(speaker: "我", content: "如果我从 2024 年 5 月 28 日晚上醒来，我还是会发那句话：你来 n4 和 n5 的太空舱连接处，有效期十分钟。"),
                DialogueLine(speaker: "旁白", content: "你已经知道答案，却仍然愿意重新紧张一次。"),
                DialogueLine(speaker: "我", content: "即使已经和你经历了一切，我还是能对你保持热情。"),
                DialogueLine(speaker: "旁白", content: "融雪之前，故事还没有完成。它只是学会了说：明天见。")
            ],
            choices: [],
            fragmentIDToUnlock: "clumsy_sincere",
            imageName: "MYXJ_20250103174946614_fast"
        )
    ]
}
