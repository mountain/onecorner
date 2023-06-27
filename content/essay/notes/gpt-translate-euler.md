+++
title = "ChatGPT 与欧拉存世文献的翻译"
description = "ChatGPT 可以让我们跨越语言的障碍直接读取翻译后的欧拉存世文献。"

date = 2023-06-27
weight = 0
draft = false
slug = "gpt-translate-euler"
template = "page.html"

+++

事情的缘起是去年底看到一篇新闻报道，丘成桐先生访问科大讯飞，提到了用机器学习翻译拉丁语的欧拉存世文献，可以使世人更加了解欧拉当年求解无穷级数的一些技巧。刚好我目前的研究有一部分和这个有关，我会关注算术表达式几何里的路径在无穷远边界上的一些问题，其中一部分路径就体现为特定的无穷级数。所以，我就花了一些精力和时间在 GPT 上作翻译实验。

经过一番调查，我确定了下述的工作流程和工具选择：
* 从[欧拉存世文献站](http://eulerarchive.maa.org/)获得扫描的原始文献的电子档
* 将电子档转换成一页页的图片，适当的剪裁边缘，将文档相关的插图提取出来
* 使用目前最好的 OCR 软件，[来自百度的 PaddleOCR](https://github.com/PaddlePaddle/PaddleOCR)，进行图片逐行分割和识别。
* 因为有 OCR 识别的疏漏，还需要人工整理成文，一般工作量不大。对欧拉的存世文献来说，这些草稿大部分都会是拉丁语的。
* 整理成文的草稿交给 ChatGPT 做一轮文字拼写的校正，原因是有 OCR 识别错误，且有一类错误率非常高，是因为古今字体差异导致的。
* 搜集文献相关的参考资料，比如维基百科、一些好的综述，确定术语的翻译方案，建立适当的体例要求，比如人名的翻译规则、术语编辑上的要求
* 根据文风的把握与控制，搜集一些典范文章和翻译，撰写翻译和编辑的 prompts
* 用 GPT 翻译文章，翻译的时候可以指定 GPT 翻译到多语言，比如汉语、英语和德语，此时翻译质量会稍有提高。
* 用 GPT 编辑翻译稿件，可以应用事先写好的体例规则

下面展示一下各个步骤的中间结果。

原始档 001 的扫描的第三页和 PaddleOCR 的分割的方案，我们能看到分割的方案有跳脱，还需要人工修正。

<div style="display:block">
    <hr style="width:100%" />
    <img style="float:left;width:45%" src="/essay/notes/gpt-euler-001-03.png"/>
    <img style="float:right;width:45%" src="/essay/notes/gpt-euler-seg_001-03.png"/>
    <hr style="width:100%" />
</div>

采用的翻译的 prompt 如下：

```txt
汉语论说文有上千年的传统，伟大史学家司马迁《报任安书》可为一例。

人固有一死，或重于泰山，或轻于鸿毛，用之所趋异也。……古者富贵而名摩灭，不可胜记，唯倜傥非常之人称焉。盖文王拘而演《周易》；仲尼厄而作《春秋》；屈原放逐，乃赋《离骚》；左丘失明，厥有《国语》；孙子膑脚，兵法修列；不韦迁蜀，世传《吕览》；韩非囚秦，《说难》、《孤愤》；《诗》三百篇，大抵圣贤发愤之所为作也。此人皆意有郁结，不得通其道，故述往事，思来者。……仆诚以著此书，藏诸名山，传之其人，通邑大都，则仆偿前辱之责，虽万被戮，岂有悔哉！然此可为智者道，难为俗人言也。

当代汉语散文的气息，可以见于如下的例文：

但如果将秋作为一个过程，秋的美丽其实不在这种清朗与逐渐的清静、清瘦与清寥，我不喜欢这过程中的秋风生哀、花落悲心。我喜欢夺人的秋声在早秋那种清高与清锐中的秋声浩荡。贾岛有诗句“一点新萤报秋信”，意思是说，秋天是随萤火虫出现而始。萤火虫三月出幼虫，没有翅膀的幼虫要经六蜕成蛹，雄虫蛹羽化后才漫天飞舞。按《汲冢周书》的说法，“大暑之日腐草化为萤”，我却一直以为秋实际是从夏至就开始了——夏至阴阳会聚，阳气盛到至极，阴气就开始产生。秋是阴气开始逐渐弥漫的季节，又是秋虫们用歌声一点点呼唤再一点点送走的季节。《诗经·七月》中有“五月鸣蜩”、“五月斯螽动股”，蝉就是蜩，斯螽就是螽斯。《诗经·周南》中专有一首有名的《螽斯》：“螽斯羽，诜诜兮”，这个“斯”在最早使用中我怀疑是助词，后来才与“螽”合成一个名词。大自然的事情处处耐人寻味——夏至后蝉在高处树干上歌颂夏天，螽斯则在低处草浪中呼唤秋天。夏至后过一个月才是大暑。

王佐良译培根《论读书》是典雅的中文翻译的一例，请注意各个语法成分在两种语言里语序不同、作用不同。例文如下：

原文：Studies serve for delight, for ornament, and for ability. Their chief use for delight is in privateness and retiring; for ornament, is in discourse; and for ability, is in the judgment and disposition of business. For expert men can execute, and perhaps judge of particulars, one by one; but the general counsels, and the plots and marshalling of affairs, come best from those that are learned. To spend too much time in studies is sloth; to use them too much for ornament, is affectation; to make judgment wholly by their rules, is the humor of a scholar. They perfect nature, and are perfected by experience: for natural abilities are like natural plants, that need pruning, by study; and studies themselves do give forth directions too much at large, except they be bounded in by experience. Crafty men condemn studies, simple men admire them, and wise men use them; for they teach not their own use; but that is a wisdom without them, and above them, won by observation.
中译：读书足以怡情，足以博彩，足以长才。其怡情也，最见于独处幽居之时；其博彩也，最见于高谈阔论之中；其长才也，最见于处世判事之际。练达之士虽能分别处理细事或一一判别枝节，然纵观统筹，全局策划，则舍好学深思者莫属。读书费时过多易惰，文采藻饰太盛则矫，全凭条文断事乃学究故态。读书补天然之不足，经验又补读书之不足，盖天生才干犹如自然花草，读书然后知如何修剪移接，而书中所示，如不以经验范之，则又大而无当。有一技之长者鄙读书，无知者羡读书，唯明智之士用读书，然书并不以用处告人，用书之智不在书中，而在书外，全凭观察得之。

专名翻译须全文统一，对人名我们采用汉语译名，译文中的法布里、笛卡尔和牛顿都遵循此例：

原文：Inter recentiores HONORATUS FABRI atque CARTESIUS invenerunt sonum consistere in æris tremore, de isto autem tremore pariter confuse sentiebant. Acutissimus NEUTONUS, hanc rem accuratius expendere atque exponere aggressus est, præcipue soni propagationem explicando, verum parum feliciori successu.
中译：近代的荣誉法布里和笛卡尔发现声音实际上源于空气的震动，但他们对于这种震动的理解仍然相当混乱。睿智的牛顿尝试更加精确地权衡和解释这个问题，特别是通过阐述声音的传播，但成功却甚微。

对于文中的每个数学符号、公式，包括行文中的符号、公式和独立的公式，都分别用 LaTex 的 $ 或者 $$ 来包裹。

原文：For example, a ray of light proceeds from A at A-time tA towards B, arrives and is reflected from B at B-time tB, and returns to A at A-time t'A. According to the definition, both clocks are synchronous, if t_B - t_A = t'_A - t_B
译文：例如，让一束光在“$A$-时间”启程从 $A$ 往 $B$，在“$B$-时间”它在 $B$ 反射回向 $A$，并在“$A$-时间” $t'_A$ 再次回到 $A$。按照定义，这两个钟对好了时，若 $$t_{B}-t_{A}=t'_{A}-t_{B}}$$

考虑到前面我们所建立的背景知识的上下文和术语的译法，请用典雅、凝练的语言，翻译如下拉丁诗文，可文白夹杂。

原文：

Constructio linearum isochronarum in medio quocunque resistente
Autore Leonhardo Eulero, Basileensi.

Notum est inter Geometras cycloidem ordinariam esse in medio non resistente isochronam seu tautochronam, vi gravitatis uniformiter versus centrum infinitae distantiae tendente. In medioque pro simplici celeritatum ratione resistente, isochronam esse eandem cycloidem, ostendit summus Newtonus in principiis suis Philosophiae Naturalis Lib. II Prop 6. Oppido utem miror, neminem adhuc quicquam de isochronis in aliis mediis resistente hypothesibus, non imaginariis, quemadmodum sunt hae ductae dictae, meditatum fuisse; cum tamen haec egregia materia bene mereatur, quae in scientiae de motu corporum in medio resistente augmentum profundius examinetur: Ego, quae hactenus reperi, quasque feliciter detexi curvas tautochronas in medio quomodocunque resistente, centro virium infinite distante et uniformiter attrahente, his cum publico communicabo ut orbi literario ansam praebeant; hanc materiam penitius perscrutandi.

中译：
```

这个翻译的最终结果，可以在[这里](https://github.com/mountain/euler-demo/blob/main/001/001-07-zhs.pdf)看到。

这次尝试学习到了一些冷门的小知识：古代印刷体里看着非常像 f 的字母其实是 s。

如果有同好希望能够系统的翻译一些存世的经典文献，请和我联系。
