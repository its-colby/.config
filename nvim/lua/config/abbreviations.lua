-- Text abbreviations and expansions
-- Auto-generated from text-replacements
local M = {}

-- Helper function to set abbreviations
local function set_abbrev(lhs, rhs)
    vim.cmd(string.format("iabbrev %s %s", lhs, rhs))
end

function M.setup()
    -- Text abbreviations
    -- Open Brace: {
    set_abbrev("jopenbrace", "{")
    -- Open Brace: {
    set_abbrev("jlbrace", "{")
    -- Close Brace: }
    set_abbrev("jclosebrace", "}")
    -- Close Brace: }
    set_abbrev("jrbrace", "}")
    -- Open Bracket: [
    set_abbrev("jopenbracket", "[")
    -- Open Bracket: [
    set_abbrev("jlbracket", "[")
    -- Close Bracket: ]
    set_abbrev("jclosebracket", "]")
    -- Close Bracket: ]
    set_abbrev("jrbracket", "]")
    -- Open Parenthesis: (
    set_abbrev("jopenparen", "(")
    -- Open Parenthesis: (
    set_abbrev("jlparen", "(")
    -- Close Parenthesis: )
    set_abbrev("jcloseparen", ")")
    -- Close Parenthesis: )
    set_abbrev("jrparen", ")")
    -- Open Angle Bracket: ⟨
    set_abbrev("jopenangle", "⟨")
    -- Open Angle Bracket: ⟨
    set_abbrev("jlangle", "⟨")
    -- Close Angle Bracket: ⟩
    set_abbrev("jcloseangle", "⟩")
    -- Close Angle Bracket: ⟩
    set_abbrev("jrangle", "⟩")
    -- Equals: =
    set_abbrev("jequals", "=")
    -- Equals: =
    set_abbrev("jequal", "=")
    -- Not Equal: ≠
    set_abbrev("jneq", "≠")
    -- Less Than or Equal: ≤
    set_abbrev("jleq", "≤")
    -- Greater Than or Equal: ≥
    set_abbrev("jgeq", "≥")
    -- Less Than: <
    set_abbrev("jlt", "<")
    -- Less Than: <
    set_abbrev("jlessthan", "<")
    -- Greater Than: >
    set_abbrev("jgt", ">")
    -- Greater Than: >
    set_abbrev("jgreaterthan", ">")
    -- Equivalent: ≡
    set_abbrev("jequiv", "≡")
    -- Equivalent: ≡
    set_abbrev("jequivalent", "≡")
    -- Not Equivalent: ≢
    set_abbrev("jnotequiv", "≢")
    -- Approximately: ≈
    set_abbrev("japprox", "≈")
    -- Approximately: ≈
    set_abbrev("japproximately", "≈")
    -- Similar: ∼
    set_abbrev("jsimilar", "∼")
    -- Similar: ∼
    set_abbrev("jsim", "∼")
    -- Element Of: ∈
    set_abbrev("jin", "∈")
    -- Element Of: ∈
    set_abbrev("jisin", "∈")
    -- Not Element Of: ∉
    set_abbrev("jnotin", "∉")
    -- Not Element Of: ∉
    set_abbrev("jisnotin", "∉")
    -- Bold Lowercase a: 𝐚
    set_abbrev("jbolda", "𝐚")
    -- Bold Lowercase a: 𝐚
    set_abbrev("jboldlowera", "𝐚")
    -- Bold Lowercase a: 𝐚
    set_abbrev("jboldlowa", "𝐚")
    -- Bold Lowercase a: 𝐚
    set_abbrev("jboldla", "𝐚")
    -- Bold Lowercase b: 𝐛
    set_abbrev("jboldb", "𝐛")
    -- Bold Lowercase b: 𝐛
    set_abbrev("jboldlowerb", "𝐛")
    -- Bold Lowercase b: 𝐛
    set_abbrev("jboldlowb", "𝐛")
    -- Bold Lowercase b: 𝐛
    set_abbrev("jboldlb", "𝐛")
    -- Bold Lowercase c: 𝐜
    set_abbrev("jboldc", "𝐜")
    -- Bold Lowercase c: 𝐜
    set_abbrev("jboldlowerc", "𝐜")
    -- Bold Lowercase c: 𝐜
    set_abbrev("jboldlowc", "𝐜")
    -- Bold Lowercase c: 𝐜
    set_abbrev("jboldlc", "𝐜")
    -- Bold Lowercase d: 𝐝
    set_abbrev("jboldd", "𝐝")
    -- Bold Lowercase d: 𝐝
    set_abbrev("jboldlowerd", "𝐝")
    -- Bold Lowercase d: 𝐝
    set_abbrev("jboldlowd", "𝐝")
    -- Bold Lowercase d: 𝐝
    set_abbrev("jboldld", "𝐝")
    -- Bold Lowercase e: 𝐞
    set_abbrev("jbolde", "𝐞")
    -- Bold Lowercase e: 𝐞
    set_abbrev("jboldlowere", "𝐞")
    -- Bold Lowercase e: 𝐞
    set_abbrev("jboldlowe", "𝐞")
    -- Bold Lowercase e: 𝐞
    set_abbrev("jboldle", "𝐞")
    -- Bold Lowercase f: 𝐟
    set_abbrev("jboldf", "𝐟")
    -- Bold Lowercase f: 𝐟
    set_abbrev("jboldlowerf", "𝐟")
    -- Bold Lowercase f: 𝐟
    set_abbrev("jboldlowf", "𝐟")
    -- Bold Lowercase f: 𝐟
    set_abbrev("jboldlf", "𝐟")
    -- Bold Lowercase g: 𝐠
    set_abbrev("jboldg", "𝐠")
    -- Bold Lowercase g: 𝐠
    set_abbrev("jboldlowerg", "𝐠")
    -- Bold Lowercase g: 𝐠
    set_abbrev("jboldlowg", "𝐠")
    -- Bold Lowercase g: 𝐠
    set_abbrev("jboldlg", "𝐠")
    -- Bold Lowercase h: 𝐡
    set_abbrev("jboldh", "𝐡")
    -- Bold Lowercase h: 𝐡
    set_abbrev("jboldlowerh", "𝐡")
    -- Bold Lowercase h: 𝐡
    set_abbrev("jboldlowh", "𝐡")
    -- Bold Lowercase h: 𝐡
    set_abbrev("jboldlh", "𝐡")
    -- Bold Lowercase i: 𝐢
    set_abbrev("jboldi", "𝐢")
    -- Bold Lowercase i: 𝐢
    set_abbrev("jboldloweri", "𝐢")
    -- Bold Lowercase i: 𝐢
    set_abbrev("jboldlowi", "𝐢")
    -- Bold Lowercase i: 𝐢
    set_abbrev("jboldli", "𝐢")
    -- Bold Lowercase j: 𝐣
    set_abbrev("jboldj", "𝐣")
    -- Bold Lowercase j: 𝐣
    set_abbrev("jboldlowerj", "𝐣")
    -- Bold Lowercase j: 𝐣
    set_abbrev("jboldlowj", "𝐣")
    -- Bold Lowercase j: 𝐣
    set_abbrev("jboldlj", "𝐣")
    -- Bold Lowercase k: 𝐤
    set_abbrev("jboldk", "𝐤")
    -- Bold Lowercase k: 𝐤
    set_abbrev("jboldlowerk", "𝐤")
    -- Bold Lowercase k: 𝐤
    set_abbrev("jboldlowk", "𝐤")
    -- Bold Lowercase k: 𝐤
    set_abbrev("jboldlk", "𝐤")
    -- Bold Lowercase l: 𝐥
    set_abbrev("jboldl", "𝐥")
    -- Bold Lowercase l: 𝐥
    set_abbrev("jboldlowerl", "𝐥")
    -- Bold Lowercase l: 𝐥
    set_abbrev("jboldlowl", "𝐥")
    -- Bold Lowercase l: 𝐥
    set_abbrev("jboldll", "𝐥")
    -- Bold Lowercase m: 𝐦
    set_abbrev("jboldm", "𝐦")
    -- Bold Lowercase m: 𝐦
    set_abbrev("jboldlowerm", "𝐦")
    -- Bold Lowercase m: 𝐦
    set_abbrev("jboldlowm", "𝐦")
    -- Bold Lowercase m: 𝐦
    set_abbrev("jboldlm", "𝐦")
    -- Bold Lowercase n: 𝐧
    set_abbrev("jboldn", "𝐧")
    -- Bold Lowercase n: 𝐧
    set_abbrev("jboldlowern", "𝐧")
    -- Bold Lowercase n: 𝐧
    set_abbrev("jboldlown", "𝐧")
    -- Bold Lowercase n: 𝐧
    set_abbrev("jboldln", "𝐧")
    -- Bold Lowercase o: 𝐨
    set_abbrev("jboldo", "𝐨")
    -- Bold Lowercase o: 𝐨
    set_abbrev("jboldlowero", "𝐨")
    -- Bold Lowercase o: 𝐨
    set_abbrev("jboldlowo", "𝐨")
    -- Bold Lowercase o: 𝐨
    set_abbrev("jboldlo", "𝐨")
    -- Bold Lowercase p: 𝐩
    set_abbrev("jboldp", "𝐩")
    -- Bold Lowercase p: 𝐩
    set_abbrev("jboldlowerp", "𝐩")
    -- Bold Lowercase p: 𝐩
    set_abbrev("jboldlowp", "𝐩")
    -- Bold Lowercase p: 𝐩
    set_abbrev("jboldlp", "𝐩")
    -- Bold Lowercase q: 𝐪
    set_abbrev("jboldq", "𝐪")
    -- Bold Lowercase q: 𝐪
    set_abbrev("jboldlowerq", "𝐪")
    -- Bold Lowercase q: 𝐪
    set_abbrev("jboldlowq", "𝐪")
    -- Bold Lowercase q: 𝐪
    set_abbrev("jboldlq", "𝐪")
    -- Bold Lowercase r: 𝐫
    set_abbrev("jboldr", "𝐫")
    -- Bold Lowercase r: 𝐫
    set_abbrev("jboldlowerr", "𝐫")
    -- Bold Lowercase r: 𝐫
    set_abbrev("jboldlowr", "𝐫")
    -- Bold Lowercase r: 𝐫
    set_abbrev("jboldlr", "𝐫")
    -- Bold Lowercase s: 𝐬
    set_abbrev("jbolds", "𝐬")
    -- Bold Lowercase s: 𝐬
    set_abbrev("jboldlowers", "𝐬")
    -- Bold Lowercase s: 𝐬
    set_abbrev("jboldlows", "𝐬")
    -- Bold Lowercase s: 𝐬
    set_abbrev("jboldls", "𝐬")
    -- Bold Lowercase t: 𝐭
    set_abbrev("jboldt", "𝐭")
    -- Bold Lowercase t: 𝐭
    set_abbrev("jboldlowert", "𝐭")
    -- Bold Lowercase t: 𝐭
    set_abbrev("jboldlowt", "𝐭")
    -- Bold Lowercase t: 𝐭
    set_abbrev("jboldlt", "𝐭")
    -- Bold Lowercase u: 𝐮
    set_abbrev("jboldu", "𝐮")
    -- Bold Lowercase u: 𝐮
    set_abbrev("jboldloweru", "𝐮")
    -- Bold Lowercase u: 𝐮
    set_abbrev("jboldlowu", "𝐮")
    -- Bold Lowercase u: 𝐮
    set_abbrev("jboldlu", "𝐮")
    -- Bold Lowercase v: 𝐯
    set_abbrev("jboldv", "𝐯")
    -- Bold Lowercase v: 𝐯
    set_abbrev("jboldlowerv", "𝐯")
    -- Bold Lowercase v: 𝐯
    set_abbrev("jboldlowv", "𝐯")
    -- Bold Lowercase v: 𝐯
    set_abbrev("jboldlv", "𝐯")
    -- Bold Lowercase w: 𝐰
    set_abbrev("jboldw", "𝐰")
    -- Bold Lowercase w: 𝐰
    set_abbrev("jboldlowerw", "𝐰")
    -- Bold Lowercase w: 𝐰
    set_abbrev("jboldloww", "𝐰")
    -- Bold Lowercase w: 𝐰
    set_abbrev("jboldlw", "𝐰")
    -- Bold Lowercase x: 𝐱
    set_abbrev("jboldx", "𝐱")
    -- Bold Lowercase x: 𝐱
    set_abbrev("jboldlowerx", "𝐱")
    -- Bold Lowercase x: 𝐱
    set_abbrev("jboldlowx", "𝐱")
    -- Bold Lowercase x: 𝐱
    set_abbrev("jboldlx", "𝐱")
    -- Bold Lowercase y: 𝐲
    set_abbrev("jboldy", "𝐲")
    -- Bold Lowercase y: 𝐲
    set_abbrev("jboldlowery", "𝐲")
    -- Bold Lowercase y: 𝐲
    set_abbrev("jboldlowy", "𝐲")
    -- Bold Lowercase y: 𝐲
    set_abbrev("jboldly", "𝐲")
    -- Bold Lowercase z: 𝐳
    set_abbrev("jboldz", "𝐳")
    -- Bold Lowercase z: 𝐳
    set_abbrev("jboldlowerz", "𝐳")
    -- Bold Lowercase z: 𝐳
    set_abbrev("jboldlowz", "𝐳")
    -- Bold Lowercase z: 𝐳
    set_abbrev("jboldlz", "𝐳")
    -- Plus: +
    set_abbrev("jplus", "+")
    -- Minus: -
    set_abbrev("jminus", "-")
    -- Minus: -
    set_abbrev("jhyphen", "-")
    -- Cross Product: ×
    set_abbrev("jcross", "×")
    -- Cross Product: ×
    set_abbrev("jtimes", "×")
    -- Center Dot: ·
    set_abbrev("jcdot", "·")
    -- Circle: ∘
    set_abbrev("jcirc", "∘")
    -- Circle: ∘
    set_abbrev("jcompose", "∘")
    -- Plus Minus: ±
    set_abbrev("jpm", "±")
    -- Circled Plus: ⊕
    set_abbrev("joplus", "⊕")
    -- Circled Dot: ⊙
    set_abbrev("jodot", "⊙")
    -- Circled Cross: ⊗
    set_abbrev("jocross", "⊗")
    -- Circled Cross: ⊗
    set_abbrev("jotimes", "⊗")
    -- Script A: 𝒜
    set_abbrev("jcala", "𝒜")
    -- Script B: ℬ
    set_abbrev("jcalb", "ℬ")
    -- Script C: 𝒞
    set_abbrev("jcalc", "𝒞")
    -- Script D: 𝒟
    set_abbrev("jcald", "𝒟")
    -- Script E: ℰ
    set_abbrev("jcale", "ℰ")
    -- Script F: ℱ
    set_abbrev("jcalf", "ℱ")
    -- Script G: 𝒢
    set_abbrev("jcalg", "𝒢")
    -- Script H: ℋ
    set_abbrev("jcalh", "ℋ")
    -- Script I: ℐ
    set_abbrev("jcali", "ℐ")
    -- Script J: 𝒥
    set_abbrev("jcalj", "𝒥")
    -- Script K: 𝒦
    set_abbrev("jcalk", "𝒦")
    -- Script L: ℒ
    set_abbrev("jcall", "ℒ")
    -- Script M: ℳ
    set_abbrev("jcalm", "ℳ")
    -- Script N: 𝒩
    set_abbrev("jcaln", "𝒩")
    -- Script O: 𝒪
    set_abbrev("jcalo", "𝒪")
    -- Script P: 𝒫
    set_abbrev("jcalp", "𝒫")
    -- Script Q: 𝒬
    set_abbrev("jcalq", "𝒬")
    -- Script R: ℛ
    set_abbrev("jcalr", "ℛ")
    -- Script S: 𝒮
    set_abbrev("jcals", "𝒮")
    -- Script T: 𝒯
    set_abbrev("jcalt", "𝒯")
    -- Script U: 𝒰
    set_abbrev("jcalu", "𝒰")
    -- Script V: 𝒱
    set_abbrev("jcalv", "𝒱")
    -- Script W: 𝒲
    set_abbrev("jcalw", "𝒲")
    -- Script X: 𝒳
    set_abbrev("jcalx", "𝒳")
    -- Script Y: 𝒴
    set_abbrev("jcaly", "𝒴")
    -- Script Z: 𝒵
    set_abbrev("jcalz", "𝒵")
    -- Infinity: ∞
    set_abbrev("jinfinity", "∞")
    -- Empty Set: ∅
    set_abbrev("jemptyset", "∅")
    -- Maps To: ↦
    set_abbrev("jmapsto", "↦")
    -- Right Arrow: →
    set_abbrev("jarrow", "→")
    -- Right Arrow: →
    set_abbrev("jrightarrow", "→")
    -- Right Arrow: →
    set_abbrev("jrarrow", "→")
    -- Left Arrow: ←
    set_abbrev("jleftarrow", "←")
    -- Left Arrow: ←
    set_abbrev("jlarrow", "←")
    -- Bidirectional Arrow: ↔
    set_abbrev("jbiarrow", "↔")
    -- Logical AND: ∧
    set_abbrev("jand", "∧")
    -- Logical AND: ∧
    set_abbrev("jland", "∧")
    -- Logical OR: ∨
    set_abbrev("jor", "∨")
    -- Logical OR: ∨
    set_abbrev("jlor", "∨")
    -- Logical NOT: ¬
    set_abbrev("jnot", "¬")
    -- Implies: ⇒
    set_abbrev("jimplies", "⇒")
    -- If and Only If: ⇔
    set_abbrev("jiff", "⇔")
    -- If and Only If: ⇔
    set_abbrev("jifandonlyif", "⇔")
    -- For All: ∀
    set_abbrev("jforall", "∀")
    -- For All: ∀
    set_abbrev("jall", "∀")
    -- Exists: ∃
    set_abbrev("jexists", "∃")
    -- Exists: ∃
    set_abbrev("jthereexists", "∃")
    -- Not Exists: ∄
    set_abbrev("jnotexists", "∄")
    -- Entails: ⊨
    set_abbrev("jentails", "⊨")
    -- Judges: ⊢
    set_abbrev("jjudges", "⊢")
    -- True: ⊤
    set_abbrev("jtrue", "⊤")
    -- False: ⊥
    set_abbrev("jfalse", "⊥")
    -- Therefore: ∴
    set_abbrev("jtherefore", "∴")
    -- Thumbs Up: 👍
    set_abbrev("jthumbsup", "👍")
    -- Thumbs Up: 👍
    set_abbrev("jthumbup", "👍")
    -- Heart: ❤️
    set_abbrev("jheart", "❤️")
    -- Laughing: 😂
    set_abbrev("jlaugh", "😂")
    -- Smile: 😊
    set_abbrev("jrosysmile", "😊")
    -- Wink: 😉
    set_abbrev("jwink", "😉")
    -- Fire: 🔥
    set_abbrev("jfire", "🔥")
    -- Thinking: 🤔
    set_abbrev("jthink", "🤔")
    -- Thinking: 🤔
    set_abbrev("jhmm", "🤔")
    -- Check Mark: ✅
    set_abbrev("jcheck", "✅")
    -- Check Mark: ✅
    set_abbrev("jdone", "✅")
    -- Party: 🎉
    set_abbrev("jparty", "🎉")
    -- Party: 🎉
    set_abbrev("jcelebrate", "🎉")
    -- Bold Uppercase A: 𝐀
    set_abbrev("jboldupa", "𝐀")
    -- Bold Uppercase A: 𝐀
    set_abbrev("jbolduppera", "𝐀")
    -- Bold Uppercase A: 𝐀
    set_abbrev("jboldua", "𝐀")
    -- Bold Uppercase B: 𝐁
    set_abbrev("jboldupb", "𝐁")
    -- Bold Uppercase B: 𝐁
    set_abbrev("jboldupperb", "𝐁")
    -- Bold Uppercase B: 𝐁
    set_abbrev("jboldub", "𝐁")
    -- Bold Uppercase C: 𝐂
    set_abbrev("jboldupc", "𝐂")
    -- Bold Uppercase C: 𝐂
    set_abbrev("jboldupperc", "𝐂")
    -- Bold Uppercase C: 𝐂
    set_abbrev("jbolduc", "𝐂")
    -- Bold Uppercase D: 𝐃
    set_abbrev("jboldupd", "𝐃")
    -- Bold Uppercase D: 𝐃
    set_abbrev("jboldupperd", "𝐃")
    -- Bold Uppercase D: 𝐃
    set_abbrev("jboldud", "𝐃")
    -- Bold Uppercase E: 𝐄
    set_abbrev("jboldupe", "𝐄")
    -- Bold Uppercase E: 𝐄
    set_abbrev("jbolduppere", "𝐄")
    -- Bold Uppercase E: 𝐄
    set_abbrev("jboldue", "𝐄")
    -- Bold Uppercase F: 𝐅
    set_abbrev("jboldupf", "𝐅")
    -- Bold Uppercase F: 𝐅
    set_abbrev("jboldupperf", "𝐅")
    -- Bold Uppercase F: 𝐅
    set_abbrev("jbolduf", "𝐅")
    -- Bold Uppercase G: 𝐆
    set_abbrev("jboldupg", "𝐆")
    -- Bold Uppercase G: 𝐆
    set_abbrev("jboldupperg", "𝐆")
    -- Bold Uppercase G: 𝐆
    set_abbrev("jboldug", "𝐆")
    -- Bold Uppercase H: 𝐇
    set_abbrev("jbolduph", "𝐇")
    -- Bold Uppercase H: 𝐇
    set_abbrev("jboldupperh", "𝐇")
    -- Bold Uppercase H: 𝐇
    set_abbrev("jbolduh", "𝐇")
    -- Bold Uppercase I: 𝐈
    set_abbrev("jboldupi", "𝐈")
    -- Bold Uppercase I: 𝐈
    set_abbrev("jboldupperi", "𝐈")
    -- Bold Uppercase I: 𝐈
    set_abbrev("jboldui", "𝐈")
    -- Bold Uppercase J: 𝐉
    set_abbrev("jboldupj", "𝐉")
    -- Bold Uppercase J: 𝐉
    set_abbrev("jboldupperj", "𝐉")
    -- Bold Uppercase J: 𝐉
    set_abbrev("jbolduj", "𝐉")
    -- Bold Uppercase K: 𝐊
    set_abbrev("jboldupk", "𝐊")
    -- Bold Uppercase K: 𝐊
    set_abbrev("jboldupperk", "𝐊")
    -- Bold Uppercase K: 𝐊
    set_abbrev("jbolduk", "𝐊")
    -- Bold Uppercase L: 𝐋
    set_abbrev("jboldupl", "𝐋")
    -- Bold Uppercase L: 𝐋
    set_abbrev("jboldupperl", "𝐋")
    -- Bold Uppercase L: 𝐋
    set_abbrev("jboldul", "𝐋")
    -- Bold Uppercase M: 𝐌
    set_abbrev("jboldupm", "𝐌")
    -- Bold Uppercase M: 𝐌
    set_abbrev("jboldupperm", "𝐌")
    -- Bold Uppercase M: 𝐌
    set_abbrev("jboldum", "𝐌")
    -- Bold Uppercase N: 𝐍
    set_abbrev("jboldupn", "𝐍")
    -- Bold Uppercase N: 𝐍
    set_abbrev("jbolduppern", "𝐍")
    -- Bold Uppercase N: 𝐍
    set_abbrev("jboldun", "𝐍")
    -- Bold Uppercase O: 𝐎
    set_abbrev("jboldupo", "𝐎")
    -- Bold Uppercase O: 𝐎
    set_abbrev("jbolduppero", "𝐎")
    -- Bold Uppercase O: 𝐎
    set_abbrev("jbolduo", "𝐎")
    -- Bold Uppercase P: 𝐏
    set_abbrev("jboldupp", "𝐏")
    -- Bold Uppercase P: 𝐏
    set_abbrev("jboldupperp", "𝐏")
    -- Bold Uppercase P: 𝐏
    set_abbrev("jboldup", "𝐏")
    -- Bold Uppercase Q: 𝐐
    set_abbrev("jboldupq", "𝐐")
    -- Bold Uppercase Q: 𝐐
    set_abbrev("jboldupperq", "𝐐")
    -- Bold Uppercase Q: 𝐐
    set_abbrev("jbolduq", "𝐐")
    -- Bold Uppercase R: 𝐑
    set_abbrev("jboldupr", "𝐑")
    -- Bold Uppercase R: 𝐑
    set_abbrev("jboldupperr", "𝐑")
    -- Bold Uppercase R: 𝐑
    set_abbrev("jboldur", "𝐑")
    -- Bold Uppercase S: 𝐒
    set_abbrev("jboldups", "𝐒")
    -- Bold Uppercase S: 𝐒
    set_abbrev("jbolduppers", "𝐒")
    -- Bold Uppercase S: 𝐒
    set_abbrev("jboldus", "𝐒")
    -- Bold Uppercase T: 𝐓
    set_abbrev("jboldupt", "𝐓")
    -- Bold Uppercase T: 𝐓
    set_abbrev("jbolduppert", "𝐓")
    -- Bold Uppercase T: 𝐓
    set_abbrev("jboldut", "𝐓")
    -- Bold Uppercase U: 𝐔
    set_abbrev("jboldupu", "𝐔")
    -- Bold Uppercase U: 𝐔
    set_abbrev("jboldupperu", "𝐔")
    -- Bold Uppercase U: 𝐔
    set_abbrev("jbolduu", "𝐔")
    -- Bold Uppercase V: 𝐕
    set_abbrev("jboldupv", "𝐕")
    -- Bold Uppercase V: 𝐕
    set_abbrev("jboldupperv", "𝐕")
    -- Bold Uppercase V: 𝐕
    set_abbrev("jbolduv", "𝐕")
    -- Bold Uppercase W: 𝐖
    set_abbrev("jboldupw", "𝐖")
    -- Bold Uppercase W: 𝐖
    set_abbrev("jboldupperw", "𝐖")
    -- Bold Uppercase W: 𝐖
    set_abbrev("jbolduw", "𝐖")
    -- Bold Uppercase X: 𝐗
    set_abbrev("jboldupx", "𝐗")
    -- Bold Uppercase X: 𝐗
    set_abbrev("jboldupperx", "𝐗")
    -- Bold Uppercase X: 𝐗
    set_abbrev("jboldux", "𝐗")
    -- Bold Uppercase Y: 𝐘
    set_abbrev("jboldupy", "𝐘")
    -- Bold Uppercase Y: 𝐘
    set_abbrev("jbolduppery", "𝐘")
    -- Bold Uppercase Y: 𝐘
    set_abbrev("jbolduy", "𝐘")
    -- Bold Uppercase Z: 𝐙
    set_abbrev("jboldupz", "𝐙")
    -- Bold Uppercase Z: 𝐙
    set_abbrev("jboldupperz", "𝐙")
    -- Bold Uppercase Z: 𝐙
    set_abbrev("jbolduz", "𝐙")
    -- Blackboard Bold A: 𝔸
    set_abbrev("jbba", "𝔸")
    -- Blackboard Bold B: 𝔹
    set_abbrev("jbbb", "𝔹")
    -- Blackboard Bold C: ℂ
    set_abbrev("jbbc", "ℂ")
    -- Blackboard Bold D: 𝔻
    set_abbrev("jbbd", "𝔻")
    -- Blackboard Bold E: 𝔼
    set_abbrev("jbbe", "𝔼")
    -- Blackboard Bold F: 𝔽
    set_abbrev("jbbf", "𝔽")
    -- Blackboard Bold G: 𝔾
    set_abbrev("jbbg", "𝔾")
    -- Blackboard Bold H: ℍ
    set_abbrev("jbbh", "ℍ")
    -- Blackboard Bold I: 𝕀
    set_abbrev("jbbi", "𝕀")
    -- Blackboard Bold J: 𝕁
    set_abbrev("jbbj", "𝕁")
    -- Blackboard Bold K: 𝕂
    set_abbrev("jbbk", "𝕂")
    -- Blackboard Bold L: 𝕃
    set_abbrev("jbbl", "𝕃")
    -- Blackboard Bold M: 𝕄
    set_abbrev("jbbm", "𝕄")
    -- Blackboard Bold N: ℕ
    set_abbrev("jbbn", "ℕ")
    -- Blackboard Bold O: 𝕆
    set_abbrev("jbbo", "𝕆")
    -- Blackboard Bold P: ℙ
    set_abbrev("jbbp", "ℙ")
    -- Blackboard Bold Q: ℚ
    set_abbrev("jbbq", "ℚ")
    -- Blackboard Bold R: ℝ
    set_abbrev("jbbr", "ℝ")
    -- Blackboard Bold S: 𝕊
    set_abbrev("jbbs", "𝕊")
    -- Blackboard Bold T: 𝕋
    set_abbrev("jbbt", "𝕋")
    -- Blackboard Bold U: 𝕌
    set_abbrev("jbbu", "𝕌")
    -- Blackboard Bold V: 𝕍
    set_abbrev("jbbv", "𝕍")
    -- Blackboard Bold W: 𝕎
    set_abbrev("jbbw", "𝕎")
    -- Blackboard Bold X: 𝕏
    set_abbrev("jbbx", "𝕏")
    -- Blackboard Bold Y: 𝕐
    set_abbrev("jbby", "𝕐")
    -- Blackboard Bold Z: ℤ
    set_abbrev("jbbz", "ℤ")
    -- Underscore: _
    set_abbrev("junderscore", "_")
    -- Forward Slash: /
    set_abbrev("jslash", "/")
    -- Forward Slash: /
    set_abbrev("jforwardslash", "/")
    -- Backslash: \
    set_abbrev("jbackslash", "\\")
    -- Asterisk: *
    set_abbrev("jasterisk", "*")
    -- Period: .
    set_abbrev("jperiod", ".")
    -- Comma: ,
    set_abbrev("jcomma", ",")
    -- Colon: :
    set_abbrev("jcolon", ":")
    -- Semicolon: ;
    set_abbrev("jsemicolon", ";")
    -- Apostrophe: '
    set_abbrev("japostrophe", "'")
    -- Apostrophe: '
    set_abbrev("jquote", "'")
    -- Left Quote: "
    set_abbrev("jlquote", "\"")
    -- Left Quote: "
    set_abbrev("jleftquote", "\"")
    -- Right Quote: "
    set_abbrev("jrquote", "\"")
    -- Right Quote: "
    set_abbrev("jrightquote", "\"")
    -- Backtick: `
    set_abbrev("jbacktick", "`")
    -- Ampersand: &
    set_abbrev("jampersand", "&")
    -- Pipe: |
    set_abbrev("jpipe", "|")
    -- Pipe: |
    set_abbrev("jbar", "|")
    -- Tilde: ~
    set_abbrev("jtilde", "~")
    -- Percent: %
    set_abbrev("jpercent", "%")
    -- Caret: ^
    set_abbrev("jcaret", "^")
    -- Caret: ^
    set_abbrev("jhat", "^")
    -- Dollar: $
    set_abbrev("jdollar", "$")
    -- Hash: #
    set_abbrev("jhash", "#")
    -- Question Mark: ?
    set_abbrev("jquestion", "?")
    -- Exclamation Mark: !
    set_abbrev("jexclamation", "!")
end

return M