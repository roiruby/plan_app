# 甲信越
koshinetu_child_array = ['山梨','長野','新潟']
koshinetu_grandchild_array = [['甲府・湯村・昇仙峡','石和・勝沼・塩山','大月・都留','山中湖・忍野','河口湖・西湖・富士吉田・精進湖・本栖湖','下部・身延・早川','南アルプス','八ヶ岳・小淵沢・清里・大泉','その他'],
                              ['南信州','上田・小諸・蓼科・諏訪','松本・美ヶ原・上高地','長野・志賀高原・北信濃','木曽路','軽井沢・佐久','安曇野・白馬','その他'],
                              ['長岡・柏崎','魚沼・十日町・湯沢','五泉・新発田・村上','上越・糸魚川・妙高','新潟・三条・佐渡','その他']]

parent = Prefecture.create(name: '甲信越')
koshinetu_child_array.each do |child, i|
 child = parent.cities.create(name: child)
 koshinetu_grandchild_array[i].each do |grandchild|
   child.spots.create(name: grandchild)
 end
end

# # 東北
# tohoku_child_array = ['青森','岩手','宮城','秋田','山形','福島']
# tohoku_grandchild_array = [
#                             ['むつ・下北半島','青森・東津軽・八甲田山','弘前・黒石・中津軽・南津軽','八戸・三沢・十和田','西津軽・北津軽・五所川原','その他'],
#                             ['盛岡・雫石','八幡平・二戸','一関・平泉・奥州','花巻・北上・遠野','三陸海岸沿岸','その他'],
#                             ['仙台市','大崎・栗原・登米','蔵王・白石・名取','松島・塩釜・南三陸','その他'],
#                             ['秋田市','能代・男鹿半島・八郎潟','田沢湖・角館・大曲','大館・鹿角','横手・湯沢','由利本荘・象潟','その他'],
#                             ['天童・寒河江・尾花沢','米沢・白布・南陽','山形・上山','庄内平野・出羽三山・鳥海山','新庄・最上','その他'],
#                             ['会津若松周辺','福島・二本松','郡山・三春','"白河','南会津','いわき・相馬','喜多方・西会津・只見','その他']
#                           ]
                          
# parent = Prefecture.create(name: '東北')
# tohoku_child_array.each do |child|
#  child = parent.cities.create(name: child)
#  tohoku_grandchild_array.each do |grandchild|
#    child.spots.create(name: grandchild)
#  end
# end
