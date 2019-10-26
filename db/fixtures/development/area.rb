# 北海道
hokkaido = Area.create(name: "北海道")
# 東北
tohoku = Area.create(name: "東北")
# 関東
kanto = Area.create(name: "関東")
# 甲信越
koshinetu = Area.create(name: "甲信越")
# 北陸
hokuriku = Area.create(name: "北陸")
# 東海
tokai = Area.create(name: "東海")
# 関西
kansai = Area.create(name: "関西")
# 中国地方
cyugoku = Area.create(name: "中国")
# 四国
shikoku = Area.create(name: "四国")
# 九州
kyusyu = Area.create(name: "九州")
# 沖縄
okinawa = Area.create(name: "沖縄")
# 海外
overseas = Area.create(name: "海外")

hokkaido_hokkaido = hokkaido.children.create(name: "北海道")
hokkaido_hokkaido.children.create([{name: "札幌市"},{name: "小樽・ニセコ・積丹"},{name: "釧路・根室・阿寒・摩周・知床羅臼"},{name: "網走・知床斜里・北見・紋別"},{name: "函館・大沼・松前"},{name: "千歳・石狩・夕張・深川"},{name: "旭川・富良野・士別"},{name: "洞爺・苫小牧・室蘭・えりも"},{name: "稚内・留萌・音威子府"},{name: "離島 (利尻・礼文・天売・焼尻)"}])


tohoku_aomori = tohoku.children.create(name: "青森")
tohoku_aomori.children.create([{name: "むつ・下北半島"},{name: "青森・東津軽・八甲田山"},{name: "弘前・黒石・中津軽・南津軽"},{name: "八戸・三沢・十和田"},{name: "西津軽・北津軽・五所川原"},{name: "その他"}])

tohoku_iwate = tohoku.children.create(name: "岩手")
tohoku_iwate.children.create([{name: "盛岡・雫石"},{name: "八幡平・二戸"},{name: "一関・平泉・奥州"},{name: "花巻・北上・遠野"},{name: "三陸海岸沿岸"},{name: "その他"}])

tohoku_miyagi = tohoku.children.create(name: "宮城")
tohoku_miyagi.children.create([{name: "仙台市"},{name: "大崎・栗原・登米"},{name: "蔵王・白石・名取"},{name: "松島・塩釜・南三陸"},{name: "その他"}])

tohoku_akita = tohoku.children.create(name: "秋田")
tohoku_akita.children.create([{name: "秋田市"},{name: "能代・男鹿半島・八郎潟"},{name: "田沢湖・角館・大曲"},{name: "大館・鹿角"},{name: "横手・湯沢"},{name: "由利本荘・象潟"},{name: "その他"}])

tohoku_yamagata = tohoku.children.create(name: "山形")
tohoku_yamagata.children.create([{name: "天童・寒河江・尾花沢"},{name: "米沢・白布・南陽"},{name: "山形・上山"},{name: "庄内平野・出羽三山・鳥海山"},{name: "新庄・最上"},{name: "その他"}])

tohoku_fukushima = tohoku.children.create(name: "福島")
tohoku_fukushima.children.create([{name: "会津若松周辺"},{name: "福島・二本松"},{name: "郡山・三春"},{name: "白河"},{name: "南会津"},{name: "いわき・相馬"},{name: "喜多方・西会津・只見"},{name: "その他"}])


kanto_ibaraki = kanto.children.create(name: "茨城")
kanto_ibaraki.children.create([{name: "北茨城・奥久慈・日立"},{name: "水戸・笠間"},{name: "常総・結城・桜川"},{name: "つくば・牛久"},{name: "霞ヶ浦・土浦・鹿島・潮来"},{name: "大洗・ひたちなか"},{name: "その他"}])

kanto_tochigi = kanto.children.create(name: "栃木")
kanto_tochigi.children.create([{name: "日光・鬼怒川"},{name: "宇都宮・鹿沼"},{name: "真岡・益子・烏山"},{name: "那須・塩原"},{name: "小山・足利・佐野・栃木"},{name: "その他"}])

kanto_gunma = kanto.children.create(name: "群馬")
kanto_gunma.children.create([{name: "桐生・伊勢崎・太田・館林"},{name: "富岡・藤岡・安中"},{name: "渋川・伊香保・草津・吾妻"},{name: "前橋・高崎"},{name: "沼田・みなかみ・尾瀬・赤城"},{name: "その他"}])

kanto_saitama = kanto.children.create(name: "埼玉")
kanto_saitama.children.create([{name: "秩父・長瀞・小川"},{name: "熊谷・深谷・本庄・行田"},{name: "春日部・越谷・草加"},{name: "川口・蕨・戸田"},{name: "川越・ふじみ野・東松山"},{name: "上尾・久喜・鴻巣"},{name: "所沢・飯能"},{name: "さいたま市"},{name: "その他"}])

kanto_chiba = kanto.children.create(name: "千葉")
kanto_chiba.children.create([{name: "浦安・舞浜"},{name: "市原・木更津・館山"},{name: "柏・松戸"},{name: "千葉・幕張"},{name: "成田・佐倉"},{name: "東金・茂原・勝浦"},{name: "船橋・市川・津田沼"},{name: "銚子・九十九里"},{name: "その他"}])

kanto_tokyo = kanto.children.create(name: "東京")
kanto_tokyo.children.create([{name: "銀座・日本橋・東京駅周辺"},{name: "お茶の水・湯島・九段"},{name: "六本木・麻布・赤坂・青山"},{name: "上野・浅草・両国・秋葉原"},{name: "池袋・目白・板橋・赤羽"},{name: "新宿・中野・杉並・吉祥寺"},{name: "渋谷・原宿・表参道・青山"},{name: "恵比寿・代官山・中目黒"},{name: "下北沢・三軒茶屋・自由が丘・二子玉川"},{name: "広尾・白金・目黒"},{name: "新橋・汐留・品川"},{name: "大井町・蒲田・大森・羽田周辺"},{name: "お台場・豊洲"},{name: "後楽園・神楽坂・飯田橋"},{name: "吉祥寺・三鷹"},{name: "赤坂・永田町・溜池"},{name: "築地・月島"},{name: "四ツ谷・市ヶ谷"},{name: "中野・高円寺・阿佐ヶ谷"},{name: "代々木・大久保"},{name: "千住・綾瀬・葛飾"},{name: "五反田・大崎"},{name: "日暮里・巣鴨"},{name: "小金井・国分寺・国立"},{name: "豊島園・練馬"},{name: "荻窪・西荻窪・武蔵境"},{name: "府中・狛江・稲城"},{name: "根津・千駄木・谷中"},{name: "八王子・立川・町田・府中・調布"},{name: "青梅・奥多摩"},{name: "伊豆諸島・小笠原諸島"},{name: "その他"}])

kanto_kanagawa = kanto.children.create(name: "神奈川")
kanto_kanagawa.children.create([{name: "横浜"},{name: "鎌倉・逗子"},{name: "藤沢・茅ケ崎・湘南"},{name: "箱根・小田原"},{name: "川崎・溝の口・武蔵小杉"},{name: "横須賀・三浦海岸・三崎"},{name: "厚木・相模原"},{name: "その他"}])


koshinetu_yamanashi = koshinetu.children.create(name: "山梨")
koshinetu_yamanashi.children.create([{name: "甲府・湯村・昇仙峡"},{name: "石和・勝沼・塩山"},{name: "大月・都留"},{name: "山中湖・忍野"},{name: "河口湖・西湖・富士吉田・精進湖・本栖湖"},{name: "下部・身延・早川"},{name: "南アルプス"},{name: "八ヶ岳・小淵沢・清里・大泉"},{name: "その他"}])

koshinetu_nagano = koshinetu.children.create(name: "長野")
koshinetu_nagano.children.create([{name: "南信州"},{name: "上田・小諸・蓼科・諏訪"},{name: "松本・美ヶ原・上高地"},{name: "長野・志賀高原・北信濃"},{name: "木曽路"},{name: "軽井沢・佐久"},{name: "安曇野・白馬"},{name: "その他"}])

koshinetu_niigata = koshinetu.children.create(name: "新潟")
koshinetu_niigata.children.create([{name: "長岡・柏崎"},{name: "魚沼・十日町・湯沢"},{name: "五泉・新発田・村上"},{name: "上越・糸魚川・妙高"},{name: "新潟・三条・佐渡"},{name: "その他"}])


hokuriku_toyama = hokuriku.children.create(name: "富山")
hokuriku_toyama.children.create([{name: "砺波"},{name: "中新川"},{name: "黒部・魚津周辺・下新川"},{name: "高岡・氷見"},{name: "その他"}])

hokuriku_ishikawa = hokuriku.children.create(name: "石川")
hokuriku_ishikawa.children.create([{name: "能登南部"},{name: "金沢"},{name: "加賀・白山"},{name: "能登北部"},{name: "その他"}])

hokuriku_fukui = hokuriku.children.create(name: "福井")
hokuriku_fukui.children.create([{name: "福井・芦原・永平寺"},{name: "敦賀・若狭周辺"},{name: "武生・鯖江周辺"},{name: "大野・勝山"},{name: "その他"}])


tokai_shizuoka = tokai.children.create(name: "静岡")
tokai_shizuoka.children.create([{name: "沼津・伊豆半島"},{name: "富士山周辺"},{name: "焼津・藤枝・御前崎"},{name: "静岡市（静岡・清水）"},{name: "浜松・掛川・磐田"},{name: "その他"}])

tokai_gifu = tokai.children.create(name: "岐阜")
tokai_gifu.children.create([{name: "高山・飛騨・下呂・白川"},{name: "岐阜・大垣・揖斐川"},{name: "美濃加茂・郡上"},{name: "多治見・恵那・中津川"},{name: "その他"}])

tokai_aichi = tokai.children.create(name: "愛知")
tokai_aichi.children.create([{name: "名古屋市"},{name: "一宮・稲沢・愛西"},{name: "田原・豊橋・新城"},{name: "犬山・瀬戸・愛知郡"},{name: "大府・常滑・知多"},{name: "豊田・岡崎・西尾"},{name: "その他"}])

tokai_mie = tokai.children.create(name: "三重")
tokai_mie.children.create([{name: "津・松阪"},{name: "四日市・鈴鹿・亀山"},{name: "伊勢・志摩・鳥羽"},{name: "熊野・尾鷲"},{name: "伊賀"},{name: "その他"}])


kansai_shiga = kansai.children.create(name: "滋賀")
kansai_shiga.children.create([{name: "甲賀・湖南"},{name: "湖東"},{name: "大津市"},{name: "湖西"},{name: "湖北"},{name: "その他"}])

kansai_kyoto = kansai.children.create(name: "京都")
kansai_kyoto.children.create([{name: "御所・二条城・河原町"},{name: "京都駅周辺"},{name: "祇園・東福寺・銀閣寺・一乗寺"},{name: "西院・太秦・嵐山・京都市西部"},{name: "金閣寺・宝ヶ池・鞍馬・京都市北部"},{name: "宇治・南山城"},{name: "鳥羽・伏見・京都市南部"},{name: "亀岡・丹波・福知山"},{name: "天橋立・丹後半島"},{name: "その他"}])

kansai_osaka = kansai.children.create(name: "大阪")
kansai_osaka.children.create([{name: "大阪北部（茨木・高槻・箕面・伊丹空港）"},{name: "新大阪・江坂・十三・塚本"},{name: "大阪駅・梅田駅・福島・淀屋橋・本町"},{name: "大阪ベイエリア"},{name: "大阪城・京橋・市内東部"},{name: "心斎橋・なんば・四ツ橋"},{name: "上本町・天王寺・市内南部"},{name: "大阪東部（寝屋川・守口・門真・東大阪）"},{name: "大阪南部（堺・岸和田・関西空港）"},{name: "その他"}])

kansai_hyogo = kansai.children.create(name: "兵庫")
kansai_hyogo.children.create([{name: "城崎・山陰海岸・但馬山地"},{name: "宝塚・西宮・尼崎"},{name: "丹波篠山"},{name: "淡路島"},{name: "明石・東播磨・北播磨"},{name: "姫路・中播磨・西播磨"},{name: "神戸市"},{name: "その他"}])

kansai_nara = kansai.children.create(name: "奈良")
kansai_nara.children.create([{name: "五條・吉野山・大峰"},{name: "橿原・御所・飛鳥"},{name: "生駒・大和郡山"},{name: "天理・宇陀・山の辺"},{name: "奈良市"},{name: "その他"}])

kansai_wakayama = kansai.children.create(name: "和歌山")
kansai_wakayama.children.create([{name: "御坊・みなべ"},{name: "海南・有田路"},{name: "白浜・田辺"},{name: "新宮・串本・勝浦"},{name: "和歌山・高野山下"},{name: "その他"}])


cyugoku_tottori = cyugoku.children.create(name: "鳥取")
cyugoku_tottori.children.create([{name: "鳥取市・鳥取県東部"},{name: "米子・境港・大山周辺"},{name: "倉吉・三朝周辺"},{name: "その他"}])

cyugoku_shimane = cyugoku.children.create(name: "島根")
cyugoku_shimane.children.create([{name: "隠岐の島々"},{name: "出雲周辺・奥出雲"},{name: "浜田・江津・大田周辺"},{name: "松江・安来周辺"},{name: "益田・津和野周辺"},{name: "その他"}])

cyugoku_okayama = cyugoku.children.create(name: "岡山")
cyugoku_okayama.children.create([{name: "岡山・吉備"},{name: "牛窓・備前"},{name: "倉敷・笠岡・井原"},{name: "高梁・蒜山高原"},{name: "津山・奥津・美作"},{name: "その他"}])

cyugoku_hiroshima = cyugoku.children.create(name: "広島")
cyugoku_hiroshima.children.create([{name: "廿日市・宮島・芸北"},{name: "福山・尾道・三原"},{name: "三次・庄原"},{name: "広島市"},{name: "呉・竹原・東広島"},{name: "その他"}])

cyugoku_yamaguchi = cyugoku.children.create(name: "山口")
cyugoku_yamaguchi.children.create([{name: "宇部・小野田"},{name: "萩・長門"},{name: "周南"},{name: "岩国・柳井"},{name: "山口・防府"},{name: "下関"},{name: "その他"}])


shikoku_tokushima = shikoku.children.create(name: "徳島")
shikoku_tokushima.children.create([{name: "阿波・美馬"},{name: "三好"},{name: "阿南・日和佐"},{name: "徳島・鳴門"},{name: "その他"}])

shikoku_kagawa = shikoku.children.create(name: "香川")
shikoku_kagawa.children.create([{name: "さぬき・東かがわ"},{name: "坂出・丸亀・塩飽諸島"},{name: "小豆島"},{name: "観音寺・琴平周辺"},{name: "高松"},{name: "その他"}])

shikoku_ehime = shikoku.children.create(name: "愛媛")
shikoku_ehime.children.create([{name: "大洲・内子・久万"},{name: "宇和島・愛南"},{name: "今治・新居浜・しまなみ海道"},{name: "松山・伊予"},{name: "その他"}])

shikoku_kochi = shikoku.children.create(name: "高知")
shikoku_kochi.children.create([{name: "安芸・室戸岬"},{name: "土佐・横浪"},{name: "四万十川流域・足摺岬"},{name: "高知・南国・嶺北"},{name: "その他"}])


kyusyu_fukuoka = kyusyu.children.create(name: "福岡")
kyusyu_fukuoka.children.create([{name: "福岡市"},{name: "北九州市周辺"},{name: "太宰府・宗像・糟屋郡"},{name: "筑豊"},{name: "久留米・筑後"},{name: "糸島"},{name: "北九州市"},{name: "その他"}])

kyusyu_saga = kyusyu.children.create(name: "佐賀")
kyusyu_saga.children.create([{name: "佐賀・鳥栖"},{name: "武雄・多久・小城"},{name: "嬉野・鹿島"},{name: "唐津・伊万里・有田"},{name: "その他"}])

kyusyu_nagasaki = kyusyu.children.create(name: "長崎")
kyusyu_nagasaki.children.create([{name: "雲仙・島原"},{name: "長崎・西彼杵"},{name: "五島・壱岐・対馬"},{name: "諫早・大村"},{name: "佐世保・平戸"},{name: "その他"}])

kyusyu_kumamoto = kyusyu.children.create(name: "熊本")
kyusyu_kumamoto.children.create([{name: "菊池・山鹿・玉名"},{name: "天草"},{name: "熊本周辺・宇土・山都"},{name: "八代・水俣・人吉"},{name: "阿蘇"},{name: "その他"}])

kyusyu_oita = kyusyu.children.create(name: "大分")
kyusyu_oita.children.create([{name: "大分・竹田・臼杵"},{name: "国東半島"},{name: "中津・宇佐・日田"},{name: "湯布院・別府"},{name: "その他"}])

kyusyu_miyazaki = kyusyu.children.create(name: "宮崎")
kyusyu_miyazaki.children.create([{name: "西都・日向・椎葉"},{name: "宮崎市周辺"},{name: "日南・串間"},{name: "都城・えびの"},{name: "延岡・高千穂"},{name: "その他"}])

kyusyu_kagoshima = kyusyu.children.create(name: "鹿児島")
kyusyu_kagoshima.children.create([{name: "薩摩川内・出水・北薩摩"},{name: "鹿児島・南薩摩"},{name: "諸島・列島"},{name: "伊佐・霧島"},{name: "大隅半島"},{name: "その他"}])


okinawa_okinawa = okinawa.children.create(name: "沖縄")
okinawa_okinawa.children.create([{name: "沖縄本島北部"},{name: "那覇市"},{name: "久米島・慶良間群島"},{name: "沖縄本島南部"},{name: "石垣島・宮古島・先島諸島"},{name: "沖縄本島中部"},{name: "その他"}])


overseas_africa = overseas.children.create(name: "アフリカ")
overseas_africa.children.create([{name: "モロッコ"},{name: "南アフリカ"},{name: "エジプト"},{name: "アラブ首長国連邦"},{name: "その他"}])

overseas_middle_east = overseas.children.create(name: "中東")
overseas_middle_east.children.create([{name: "トルコ"},{name: "その他"}])

overseas_oceania = overseas.children.create(name: "オセアニア")
overseas_oceania.children.create([{name: "オーストラリア"},{name: "ニュージーランド"},{name: "その他"}])

overseas_asia = overseas.children.create(name: "アジア")
overseas_asia.children.create([{name: "中国"},{name: "韓国"},{name: "台湾"},{name: "タイ"},{name: "香港"},{name: "マカオ"},{name: "シンガポール"},{name: "ベトナム"},{name: "インドネシア"},{name: "フィリピン"},{name: "カンボジア"},{name: "インド"},{name: "その他"}])

overseas_latin_america = overseas.children.create(name: "中南米")
overseas_latin_america.children.create([{name: "ブラジル"},{name: "メキシコ"},{name: "その他"}])

overseas_europe = overseas.children.create(name: "ヨーロッパ")
overseas_europe.children.create([{name: "フランス"},{name: "イタリア"},{name: "ドイツ"},{name: "イギリス"},{name: "スペイン"},{name: "スイス"},{name: "ベルギー"},{name: "ロシア"},{name: "バチカン"},{name: "ポルトガル"},{name: "その他"}])

overseas_north_america = overseas.children.create(name: "北米")
overseas_north_america.children.create([{name: "アメリカ"},{name: "カナダ"},{name: "ハワイ"},{name: "グアム"},{name: "サイパン"},{name: "その他"}])

overseas_other = overseas.children.create(name: "その他")
overseas_other.children.create([{name: "その他"}])