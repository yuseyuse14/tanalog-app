//
//  YomiganaUtils.swift
//  YomiganaSample
//
//  Created by Takenori Kabeya on 2024/12/21.
//

import Foundation



class YomiganaUtils {
    static let latinToHiraganaList: [(latin: String, hiragana: String)] = [
        // MARK: - か行
        
      ("ka", "か"),
      ("ki", "き"),
      ("ku", "く"),
      ("ke", "け"),
      ("ko", "こ"),
        
      ("kā", "かー"),
      ("kī", "きー"),
      ("kū", "くー"),
      ("kē", "けー"),
      ("kō", "こー"),
        
      ("kka", "っか"),
      ("kki", "っき"),
      ("kku", "っく"),
      ("kke", "っけ"),
      ("kko", "っこ"),
        
      ("kkā", "っかー"),
      ("kkī", "っきー"),
      ("kkū", "っくー"),
      ("kkē", "っけー"),
      ("kkō", "っこー"),
    
      ("kya", "きゃ"),
      ("kyi", "きぃ"),
      ("kyu", "きゅ"),
      ("kye", "きぇ"),
      ("kyo", "きょ"),
        
      ("kkya", "っきゃ"),
      ("kkyi", "っきぃ"),
      ("kkyu", "っきゅ"),
      ("kkye", "っきぇ"),
      ("kkyo", "っきょ"),
        
      ("kyā", "きゃー"),
      ("kyī", "きぃー"),
      ("kyū", "きゅー"),
      ("kyē", "きぇー"),
      ("kyō", "きょー"),
        
      ("kkyā", "っきゃー"),
      ("kkyī", "っきぃー"),
      ("kkyū", "っきゅー"),
      ("kkyē", "っきぇー"),
      ("kkyō", "っきょー"),
        
      // MARK: - さ行
      
      ("sa", "さ"),
      ("si", "し"),
      ("shi", "し"),
      ("su", "す"),
      ("se", "せ"),
      ("so", "そ"),
        
      ("ssa", "っさ"),
      ("ssi", "っし"),
      ("sshi", "っし"),
      ("ssu", "っす"),
      ("sse", "っせ"),
      ("sso", "っそ"),
        
      ("sā", "さー"),
      ("sī", "しー"),
      ("shī", "しー"),
      ("sū", "すー"),
      ("sē", "せー"),
      ("sō", "そー"),
        
      ("ssā", "っさー"),
      ("ssī", "っしー"),
      ("sshī", "っしー"),
      ("ssū", "っすー"),
      ("ssē", "っせー"),
      ("ssō", "っそー"),
        
      ("sha", "しゃ"),
      ("sya", "しゃ"),
      ("syi", "しぃ"),
      ("shu", "しゅ"),
      ("syu", "しゅ"),
      ("she", "しぇ"),
      ("sye", "しぇ"),
      ("sho", "しょ"),
      ("syo", "しょ"),
        
      ("ssha", "っしゃ"),
      ("ssya", "っしゃ"),
      ("ssyi", "っしぃ"),
      ("sshu", "っしゅ"),
      ("ssyu", "っしゅ"),
      ("sshe", "っしぇ"),
      ("ssye", "っしぇ"),
      ("ssho", "っしょ"),
      ("ssyo", "っしょ"),
        
      ("shā", "しゃー"),
      ("syā", "しゃー"),
      ("syī", "しぃー"),
      ("shū", "しゅー"),
      ("syū", "しゅー"),
      ("shē", "しぇー"),
      ("syē", "しぇー"),
      ("shō", "しょー"),
      ("syō", "しょー"),
        
      ("sshā", "っしゃー"),
      ("ssyā", "っしゃー"),
      ("ssyī", "っしぃー"),
      ("sshū", "っしゅー"),
      ("ssyū", "っしゅー"),
      ("sshē", "っしぇー"),
      ("ssyē", "っしぇー"),
      ("sshō", "っしょー"),
      ("ssyō", "っしょー"),
        
      // MARK: - た行
      
      ("ta", "た"),
      ("ti", "てぃ"),
      ("chi", "ち"),
      ("tu", "つ"),
      ("tsu", "つ"),
      ("te", "て"),
      ("to", "と"),
        
      ("tta", "った"),
      ("tti", "ってぃ"),
      ("cchi", "っち"),
      ("tchi", "っち"),
      ("ttu", "っつ"),
      ("ttsu", "っつ"),
      ("tte", "って"),
      ("tto", "っと"),
        
      ("tā", "たー"),
      ("tī", "てぃー"),
      ("chī", "ちー"),
      ("tū", "つー"),
      ("tsū", "つー"),
      ("tē", "てー"),
      ("tō", "とー"),
        
      ("ttā", "ったー"),
      ("ttī", "ってぃー"),
      ("cchī", "っちー"),
      ("tchī", "っちー"),
      ("ttū", "っつー"),
      ("ttsū", "っつー"),
      ("ttē", "ってー"),
      ("ttō", "っとー"),
        
      ("cha", "ちゃ"),
      ("tya", "ちゃ"),
      ("tyi", "ちぃ"),
      ("chu", "ちゅ"),
      ("tyu", "ちゅ"),
      ("che", "ちぇ"),
      ("tye", "ちぇ"),
      ("cho", "ちょ"),
      ("tyo", "ちょ"),
        
      ("ccha", "っちゃ"),
      ("ttya", "っちゃ"),
      ("ttyi", "っちぃ"),
      ("cchu", "っちゅ"),
      ("tchu", "っちゅ"),
      ("ttyu", "っちゅ"),
      ("cche", "っちぇ"),
      ("ttye", "っちぇ"),
      ("ccho", "っちょ"),
      ("ttyo", "っちょ"),
        
      ("chā", "ちゃー"),
      ("tyā", "ちゃー"),
      ("tyī", "ちぃー"),
      ("chū", "ちゅー"),
      ("tyū", "ちゅー"),
      ("chē", "ちぇー"),
      ("tyē", "ちぇー"),
      ("chō", "ちょー"),
      ("tyō", "ちょー"),
        
      ("cchā", "っちゃー"),
      ("ttyā", "っちゃー"),
      ("ttyī", "っちぃー"),
      ("cchū", "っちゅー"),
      ("tchū", "っちゅー"),
      ("ttyū", "っちゅー"),
      ("cchē", "っちぇー"),
      ("ttyē", "っちぇー"),
      ("cchō", "っちょー"),
      ("ttyō", "っちょー"),
      
      // MARK: - な行
      
      ("na", "な"),
      ("ni", "に"),
      ("nu", "ぬ"),
      ("ne", "ね"),
      ("no", "の"),
        
      ("nna", "っな"),
      ("nni", "っに"),
      ("nnu", "っぬ"),
      ("nne", "っね"),
      ("nno", "っの"),
        
      ("nā", "なー"),
      ("nī", "にー"),
      ("nū", "ぬー"),
      ("nē", "ねー"),
      ("nō", "のー"),
        
      ("nnā", "っなー"),
      ("nnī", "っにー"),
      ("nnū", "っぬー"),
      ("nnē", "っねー"),
      ("nnō", "っのー"),
      
      ("nya", "にゃ"),
      ("nyi", "にぃ"),
      ("nyu", "にゅ"),
      ("nye", "にぇ"),
      ("nyo", "にょ"),
        
      ("nnya", "っにゃ"),
      ("nnyi", "っにぃ"),
      ("nnyu", "っにゅ"),
      ("nnye", "っにぇ"),
      ("nnyo", "っにょ"),
        
      ("nyā", "にゃー"),
      ("nyī", "にぃー"),
      ("nyū", "にゅー"),
      ("nyē", "にぇー"),
      ("nyō", "にょー"),
        
      ("nnyā", "っにゃー"),
      ("nnyī", "っにぃー"),
      ("nnyū", "っにゅー"),
      ("nnyē", "っにぇー"),
      ("nnyō", "っにょー"),
      
      // MARK: - は行
      
      ("ha", "は"),
      ("fa", "ふぁ"),
      ("hi", "ひ"),
      ("fi", "ふぃ"),
      ("hu", "ふ"),
      ("fu", "ふ"),
      ("he", "へ"),
      ("fe", "ふぇ"),
      ("ho", "ほ"),
      ("fo", "ふぉ"),
      
      ("hha", "っは"),
      ("ffa", "っふぁ"),
      ("hhi", "っひ"),
      ("ffi", "っふぃ"),
      ("hhu", "っふ"),
      ("ffu", "っふ"),
      ("hhe", "っへ"),
      ("ffe", "っふぇ"),
      ("hho", "っほ"),
      ("ffo", "っふぉ"),
      
      ("hā", "はー"),
      ("fā", "ふぁー"),
      ("hī", "ひー"),
      ("fī", "ふぃー"),
      ("hū", "ふー"),
      ("fū", "ふー"),
      ("hē", "へー"),
      ("fē", "ふぇー"),
      ("hō", "ほー"),
      ("fō", "ふぉー"),
      
      ("hhā", "っはー"),
      ("ffā", "っふぁー"),
      ("hhī", "っひー"),
      ("ffī", "っふぃー"),
      ("hhū", "っふー"),
      ("ffū", "っふー"),
      ("hhē", "っへー"),
      ("ffē", "っふぇー"),
      ("hhō", "っほー"),
      ("ffō", "っふぉー"),
      
      ("hya", "ひゃ"),
      ("hyi", "ひぃ"),
      ("hyu", "ひゅ"),
      ("hye", "ひぇ"),
      ("hyo", "ひょ"),
        
      ("hhya", "っひゃ"),
      ("hhyi", "っひぃ"),
      ("hhyu", "っひゅ"),
      ("hhye", "っひぇ"),
      ("hhyo", "っひょ"),
        
      ("hyā", "ひゃー"),
      ("hyī", "ひぃー"),
      ("hyū", "ひゅー"),
      ("hyē", "ひぇー"),
      ("hyō", "ひょー"),
        
      ("hhyā", "っひゃー"),
      ("hhyī", "っひぃー"),
      ("hhyū", "っひゅー"),
      ("hhyē", "っひぇー"),
      ("hhyō", "っひょー"),
      
      // MARK: - ま行
      
      ("ma", "ま"),
      ("mi", "み"),
      ("mu", "む"),
      ("me", "め"),
      ("mo", "も"),
        
      ("mma", "っま"),
      ("mmi", "っみ"),
      ("mmu", "っむ"),
      ("mme", "っめ"),
      ("mmo", "っも"),
        
      ("mā", "まー"),
      ("mī", "みー"),
      ("mū", "むー"),
      ("mē", "めー"),
      ("mō", "もー"),
        
      ("mmā", "っまー"),
      ("mmī", "っみー"),
      ("mmū", "っむー"),
      ("mmē", "っめー"),
      ("mmō", "っもー"),
      
      ("mya", "みゃ"),
      ("myi", "みぃ"),
      ("myu", "みゅ"),
      ("mye", "みぇ"),
      ("myo", "みょ"),
        
      ("mmya", "っみゃ"),
      ("mmyi", "っみぃ"),
      ("mmyu", "っみゅ"),
      ("mmye", "っみぇ"),
      ("mmyo", "っみょ"),
        
      ("myā", "みゃー"),
      ("myī", "みぃー"),
      ("myū", "みゅー"),
      ("myē", "みぇー"),
      ("myō", "みょー"),
        
      ("mmyā", "っみゃー"),
      ("mmyī", "っみぃー"),
      ("mmyū", "っみゅー"),
      ("mmyē", "っみぇー"),
      ("mmyō", "っみょー"),
        
      // MARK: - や行
      
      ("ya", "や"),
      ("yi", "い"),
      ("yu", "ゆ"),
      ("ye", "え"),
      ("yo", "よ"),
        
      ("yya", "っや"),
      ("yyi", "っい"),
      ("yyu", "っゆ"),
      ("yye", "っえ"),
      ("yyo", "っよ"),
        
      ("yā", "やー"),
      ("yī", "いー"),
      ("yū", "ゆー"),
      ("yē", "えー"),
      ("yō", "よー"),
        
      ("yyā", "っやー"),
      ("yyī", "っいー"),
      ("yyū", "っゆー"),
      ("yyē", "っえー"),
      ("yyō", "っよー"),
        
      // MARK: - ら行
      
      ("ra", "ら"),
      ("ri", "り"),
      ("ru", "る"),
      ("re", "れ"),
      ("ro", "ろ"),
        
      ("rra", "っら"),
      ("rri", "っり"),
      ("rru", "っる"),
      ("rre", "っれ"),
      ("rro", "っろ"),
        
      ("rā", "らー"),
      ("rī", "りー"),
      ("rū", "るー"),
      ("rē", "れー"),
      ("rō", "ろー"),
        
      ("rrā", "っらー"),
      ("rrī", "っりー"),
      ("rrū", "っるー"),
      ("rrē", "っれー"),
      ("rrō", "っろー"),
      
      ("rya", "りゃ"),
      ("ryi", "りぃ"),
      ("ryu", "りゅ"),
      ("rye", "りぇ"),
      ("ryo", "りょ"),
        
      ("rrya", "っりゃ"),
      ("rryi", "っりぃ"),
      ("rryu", "っりゅ"),
      ("rrye", "っりぇ"),
      ("rryo", "っりょ"),
        
      ("ryā", "りゃー"),
      ("ryī", "りぃー"),
      ("ryū", "りゅー"),
      ("ryē", "りぇー"),
      ("ryō", "りょー"),
        
      ("rryā", "っりゃー"),
      ("rryī", "っりぃー"),
      ("rryū", "っりゅー"),
      ("rryē", "っりぇー"),
      ("rryō", "っりょー"),
        
      // MARK: - わ行
      
      ("wa", "わ"),
      ("wi", "ゐ"),
      ("wu", "う"),
      ("we", "ゑ"),
      ("wo", "を"),
        
      ("wwa", "っわ"),
      ("wwi", "っゐ"),
      ("wwu", "っう"),
      ("wwe", "っゑ"),
      ("wwo", "っを"),
        
      ("wā", "わー"),
      ("wī", "ゐー"),
      ("wū", "うー"),
      ("wē", "ゑー"),
      ("wō", "をー"),
        
      ("wwā", "っわー"),
      ("wwī", "っゐー"),
      ("wwū", "っうー"),
      ("wwē", "っゑー"),
      ("wwō", "っをー"),
        
      // MARK: - ゔぁ行
      
      ("va", "ゔぁ"),
      ("vi", "ゔぃ"),
      ("vu", "ゔ"),
      ("ve", "ゔぇ"),
      ("vo", "ゔぉ"),
        
      ("vva", "っゔぁ"),
      ("vvi", "っゔぃ"),
      ("vvu", "っゔ"),
      ("vve", "っゔぇ"),
      ("vvo", "っゔぉ"),
        
      ("vā", "ゔぁー"),
      ("vī", "ゔぃー"),
      ("vū", "ゔー"),
      ("vē", "ゔぇー"),
      ("vō", "ゔぉー"),
        
      ("vvā", "っゔぁー"),
      ("vvī", "っゔぃー"),
      ("vvū", "っゔー"),
      ("vvē", "っゔぇー"),
      ("vvō", "っゔぉー"),
        
      // MARK: - が行
      
      ("ga", "が"),
      ("gi", "ぎ"),
      ("gu", "ぐ"),
      ("ge", "げ"),
      ("go", "ご"),
        
      ("gga", "っが"),
      ("ggi", "っぎ"),
      ("ggu", "っぐ"),
      ("gge", "っげ"),
      ("ggo", "っご"),
        
      ("gā", "がー"),
      ("gī", "ぎー"),
      ("gū", "ぐー"),
      ("gē", "げー"),
      ("gō", "ごー"),
        
      ("ggā", "っがー"),
      ("ggī", "っぎー"),
      ("ggū", "っぐー"),
      ("ggē", "っげー"),
      ("ggō", "っごー"),
      
      ("gya", "ぎゃ"),
      ("gyi", "ぎぃ"),
      ("gyu", "ぎゅ"),
      ("gye", "ぎぇ"),
      ("gyo", "ぎょ"),
        
      ("ggya", "っぎゃ"),
      ("ggyi", "っぎぃ"),
      ("ggyu", "っぎゅ"),
      ("ggye", "っぎぇ"),
      ("ggyo", "っぎょ"),
        
      ("gyā", "ぎゃー"),
      ("gyī", "ぎぃー"),
      ("gyū", "ぎゅー"),
      ("gyē", "ぎぇー"),
      ("gyō", "ぎょー"),
        
      ("ggyā", "っぎゃー"),
      ("ggyī", "っぎぃー"),
      ("ggyū", "っぎゅー"),
      ("ggyē", "っぎぇー"),
      ("ggyō", "っぎょー"),
        
      // MARK: - ざ行
      
      ("za", "ざ"),
      ("zi", "じ"),
      ("ji", "じ"),
      ("zu", "ず"),
      ("ze", "ぜ"),
      ("zo", "ぞ"),
        
      ("zza", "っざ"),
      ("zzi", "っじ"),
      ("jji", "っじ"),
      ("zzu", "っず"),
      ("zze", "っぜ"),
      ("zzo", "っぞ"),
        
      ("zā", "ざー"),
      ("zī", "じー"),
      ("jī", "じー"),
      ("zū", "ずー"),
      ("zē", "ぜー"),
      ("zō", "ぞー"),
        
      ("zzā", "っざー"),
      ("zzī", "っじー"),
      ("jjī", "っじー"),
      ("zzū", "っずー"),
      ("zzē", "っぜー"),
      ("zzō", "っぞー"),
      
      ("zya", "じゃ"),
      ("ja", "じゃ"),
      ("zyi", "じぃ"),
      ("zyu", "じゅ"),
      ("ju", "じゅ"),
      ("zye", "じぇ"),
      ("je", "じぇ"),
      ("zyo", "じょ"),
      ("jo", "じょ"),
      
      ("zyā", "じゃー"),
      ("jā", "じゃー"),
      ("zyī", "じぃー"),
      ("zyū", "じゅー"),
      ("jū", "じゅー"),
      ("zyē", "じぇー"),
      ("jē", "じぇー"),
      ("zyō", "じょー"),
      ("jō", "じょー"),
      
      ("zzya", "っじゃ"),
      ("jja", "っじゃ"),
      ("zzyi", "っじぃ"),
      ("zzyu", "っじゅ"),
      ("jju", "っじゅ"),
      ("zzye", "っじぇ"),
      ("jje", "っじぇ"),
      ("zzyo", "っじょ"),
      ("jjo", "っじょ"),
      
      ("zzyā", "っじゃー"),
      ("jjā", "っじゃー"),
      ("zzyī", "っじぃー"),
      ("zzyū", "っじゅー"),
      ("jjū", "っじゅー"),
      ("zzyē", "っじぇー"),
      ("jjē", "っじぇー"),
      ("zzyō", "っじょー"),
      ("jjō", "っじょー"),
        
      // MARK: - だ行
      
      ("da", "だ"),
      ("di", "でぃ"),
      ("dji", "ぢ"),
      ("du", "でゅ"),
      ("dzu", "づ"),
      ("de", "で"),
      ("do", "ど"),
        
      ("dda", "っだ"),
      ("ddi", "っでぃ"),
      ("ddji", "っぢ"),
      ("ddu", "っでゅ"),
      ("ddzu", "っづ"),
      ("dde", "っで"),
      ("ddo", "っど"),
        
      ("dā", "だー"),
      ("dī", "でぃー"),
      ("djī", "ぢー"),
      ("dū", "でゅー"),
      ("dzū", "づー"),
      ("dē", "でー"),
      ("dō", "どー"),
        
      ("ddā", "っだー"),
      ("ddī", "っでぃー"),
      ("ddjī", "っぢー"),
      ("ddū", "っでゅー"),
      ("ddzū", "っづー"),
      ("ddē", "っでー"),
      ("ddō", "っどー"),
      
      ("dya", "ぢゃ"),
      ("dyi", "ぢぃ"),
      ("dyu", "ぢゅ"),
      ("dye", "ぢぇ"),
      ("dyo", "ぢょ"),
        
      ("ddya", "っぢゃ"),
      ("ddyi", "っぢぃ"),
      ("ddyu", "っぢゅ"),
      ("ddye", "っぢぇ"),
      ("ddyo", "っぢょ"),
        
      ("dyā", "ぢゃ"),
      ("dyī", "ぢぃ"),
      ("dyū", "ぢゅ"),
      ("dyē", "ぢぇ"),
      ("dyō", "ぢょ"),
        
      ("ddyā", "っぢゃ"),
      ("ddyī", "っぢぃ"),
      ("ddyū", "っぢゅ"),
      ("ddyē", "っぢぇ"),
      ("ddyō", "っぢょ"),
        
      // MARK: - ば行
      
      ("ba", "ば"),
      ("bi", "び"),
      ("bu", "ぶ"),
      ("be", "べ"),
      ("bo", "ぼ"),
        
      ("bba", "っば"),
      ("bbi", "っび"),
      ("bbu", "っぶ"),
      ("bbe", "っべ"),
      ("bbo", "っぼ"),
        
      ("bā", "ばー"),
      ("bī", "びー"),
      ("bū", "ぶー"),
      ("bē", "べー"),
      ("bō", "ぼー"),
        
      ("bbā", "っばー"),
      ("bbī", "っびー"),
      ("bbū", "っぶー"),
      ("bbē", "っべー"),
      ("bbō", "っぼー"),
      
      ("bya", "びゃ"),
      ("byi", "びぃ"),
      ("byu", "びゅ"),
      ("bye", "びぇ"),
      ("byo", "びょ"),
        
      ("bbya", "っびゃ"),
      ("bbyi", "っびぃ"),
      ("bbyu", "っびゅ"),
      ("bbye", "っびぇ"),
      ("bbyo", "っびょ"),
        
      ("byā", "びゃ"),
      ("byī", "びぃ"),
      ("byū", "びゅ"),
      ("byē", "びぇ"),
      ("byō", "びょ"),
        
      ("bbyā", "っびゃ"),
      ("bbyī", "っびぃ"),
      ("bbyū", "っびゅ"),
      ("bbyē", "っびぇ"),
      ("bbyō", "っびょ"),
        
      // MARK: - ぱ行
      
      ("pa", "ぱ"),
      ("pi", "ぴ"),
      ("pu", "ぷ"),
      ("pe", "ぺ"),
      ("po", "ぽ"),
        
      ("ppa", "っぱ"),
      ("ppi", "っぴ"),
      ("ppu", "っぷ"),
      ("ppe", "っぺ"),
      ("ppo", "っぽ"),
        
      ("pā", "ぱー"),
      ("pī", "ぴー"),
      ("pū", "ぷー"),
      ("pē", "ぺー"),
      ("pō", "ぽー"),
        
      ("ppā", "っぱー"),
      ("ppī", "っぴー"),
      ("ppū", "っぷー"),
      ("ppē", "っぺー"),
      ("ppō", "っぽー"),
      
      ("pya", "ぴゃ"),
      ("pyi", "ぴぃ"),
      ("pyu", "ぴゅ"),
      ("pye", "ぴぇ"),
      ("pyo", "ぴょ"),
        
      ("ppya", "っぴゃ"),
      ("ppyi", "っぴぃ"),
      ("ppyu", "っぴゅ"),
      ("ppye", "っぴぇ"),
      ("ppyo", "っぴょ"),
        
      ("pyā", "ぴゃ"),
      ("pyī", "ぴぃ"),
      ("pyū", "ぴゅ"),
      ("pyē", "ぴぇ"),
      ("pyō", "ぴょ"),
        
      ("ppyā", "っぴゃ"),
      ("ppyī", "っぴぃ"),
      ("ppyū", "っぴゅ"),
      ("ppyē", "っぴぇ"),
      ("ppyō", "っぴょ"),
        
      // MARK: - ん
       
      ("n'", "ん"),
      ("n", "ん"),
      
      // MARK: - 促音・拗音
      
      ("~tsu", "っ"),
      
      ("~ya", "ゃ"),
      ("~yu", "ゅ"),
      ("~yo", "ょ"),
      
      ("~wa", "ゎ"),
      
      ("~yā", "ゃー"),
      ("~yū", "ゅー"),
      ("~yō", "ょー"),
      
      ("~a", "ぁ"),
      ("~i", "ぃ"),
      ("~u", "ぅ"),
      ("~e", "ぇ"),
      ("~o", "ぉ"),
      
      ("~ā", "ぁー"),
      ("~ī", "ぃー"),
      ("~ū", "ぅー"),
      ("~ē", "ぇー"),
      ("~ō", "ぉー"),
      
      // MARK: - 母音
      
      ("a", "あ"),
      ("i", "い"),
      ("u", "う"),
      ("e", "え"),
      ("o", "お"),
      
      ("ā", "あー"),
      ("ī", "いー"),
      ("ū", "うー"),
      ("ē", "えー"),
      ("ō", "おー"),
    ]
    
    static func latinToHiragana(_ text: String) -> String {
        if text.isEmpty {
            return ""
        }
        var hiraganaText: String = ""
        var pos: String.Index = text.startIndex
        let end = text.endIndex
        repeat {
            let substring = text.suffix(from: pos)
            var found = false
            for entry in latinToHiraganaList {
                if substring.starts(with: entry.latin) {
                    hiraganaText += entry.hiragana
                    pos = text.index(pos, offsetBy: entry.latin.count)
                    found = true
                    break
                }
            }
            if !found {
                hiraganaText += String(substring.first!)
                pos = text.index(pos, offsetBy: 1)
            }
            
            if end <= pos {
                break
            }
        } while true
        return hiraganaText
    }
    
    static func zenkakuAlnumToHankaku(_ text: String) -> String {
        let result = text.unicodeScalars.map { scalar -> UnicodeScalar in
            if (0xFF10 <= scalar.value && scalar.value <= 0xFF19) ||
               (0xFF21 <= scalar.value && scalar.value <= 0xFF3A) ||
               (0xFF40 <= scalar.value && scalar.value <= 0xFF5A) {
                return UnicodeScalar(scalar.value-0xFF10+0x30)!
            } else {
                return scalar
            }
        }
        return String(String.UnicodeScalarView(result))
    }
    
    static func containsBothLatinAndHiragana(_ text: String) -> Bool {
        let latinRegex = /[A-Za-z]/
        if !text.contains(latinRegex) {
            return false
        }
        let hiraganaRegex = /[ぁ-ゖ]/
        return text.contains(hiraganaRegex)
    }
    
    static func getYomiganaOf(_ text: String) -> String {
        guard let preferredLanguage = Locale.preferredLanguages.first else {
            return text
        }
        guard preferredLanguage.hasPrefix("ja") else {
            return text
        }
        
        // 全角の英数は半角にする
        let hankakuAlpha = zenkakuAlnumToHankaku(text)
        var nsText: NSString = hankakuAlpha as NSString
        var yomigana: String = ""
        
        let range: CFRange = CFRangeMake(0, nsText.length)
        let locale: CFLocale = Locale(identifier: "ja") as CFLocale
        var tokenizer: CFStringTokenizer = CFStringTokenizerCreate(kCFAllocatorDefault, nsText as CFString, range, kCFStringTokenizerUnitWordBoundary, locale)
        
        var tokenType: CFStringTokenizerTokenType = CFStringTokenizerGoToTokenAtIndex(tokenizer, 0)
        var prevTokenFailPos: CFIndex = -1
        
        while tokenType != CFStringTokenizerTokenType(rawValue: 0) {
            defer {
                tokenType = CFStringTokenizerAdvanceToNextToken(tokenizer)
            }
            
            // 漢字文字列を単語（というかトークン）に切り出してローマ字化する
            if let latin = CFStringTokenizerCopyCurrentTokenAttribute(tokenizer, kCFStringTokenizerAttributeLatinTranscription) as? String {
                // ローマ字化できない場合（＝読めない漢字がある場合）、その漢字を飛ばす。次のトークンの開始位置にトークナイザを進める
                if latin.isEmpty {
                    let cfRange = CFStringTokenizerGetCurrentTokenRange(tokenizer)
                    let nsRange = NSRange(location: cfRange.location + 1, length: nsText.length - (cfRange.location + 1))
                    nsText = nsText.substring(with: nsRange) as NSString
                    let newRange = CFRangeMake(0, nsText.length)
                    tokenizer = CFStringTokenizerCreate(kCFAllocatorDefault, nsText as CFString, newRange, kCFStringTokenizerUnitWordBoundary, locale)
                    prevTokenFailPos = -1
                    continue
                }
                
                // ローマ字をひらがなにする。OSのAPIだとうまくいかないケースが多かったので自前で変換する
                let hiragana = YomiganaUtils.latinToHiragana(latin)
                // 部分的にひらがなに直らないケースがあるパターン（例：es→えs）は、
                // トークンの範囲の文字列（例えばes）がローマ字の文字列（es）と一致すれば、ローマ字をそのまま読みとする。
                if YomiganaUtils.containsBothLatinAndHiragana(hiragana) {
                    //print(hiragana)
                    let cfRange = CFStringTokenizerGetCurrentTokenRange(tokenizer)
                    let nsRange = NSRange(location: cfRange.location, length: cfRange.length)
                    let substring = nsText.substring(with: nsRange)
                    if substring == latin {
                        yomigana += latin
                        prevTokenFailPos = -1
                        continue
                    }
                    // 一致しないケースというのが思いつかないけども、一致しなければ一部ひらがな・一部ローマ字になったものをそのまま読みがなにする
                    print("unknown case")
                }
                yomigana += hiragana
                prevTokenFailPos = -1
                continue
            }
            else {
                // トークンの切り出しができない場合（スペースとか）、かたかな→ひらがなに変換して変換できればそれを読みがなにする
                // ひらがなに変換できなければ、元の漢字をそのまま読みがなにする
                let cfRange = CFStringTokenizerGetCurrentTokenRange(tokenizer)
                if cfRange.location == prevTokenFailPos {
                    continue
                }
                let nsRange = NSRange(location: cfRange.location, length: cfRange.length)
                let substring = nsText.substring(with: nsRange)
                if let hiragana = substring.applyingTransform(.hiraganaToKatakana, reverse: true) {
                    yomigana += hiragana
                }
                else {
                    yomigana += substring
                }
                prevTokenFailPos = cfRange.location
            }
            
        }
        return yomigana
    }
}
