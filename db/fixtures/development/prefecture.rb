# 北海道
city_names = ['北海道のエリアを選択']
spot_names = ['札幌市','小樽・ニセコ・積丹','釧路・根室・阿寒・摩周・知床羅臼','網走・知床斜里・北見・紋別','函館・大沼・松前','千歳・石狩・夕張・深川','旭川・富良野・士別','洞爺・苫小牧・室蘭・えりも','稚内・留萌・音威子府','離島 (利尻・礼文・天売・焼尻)']

prefecture = Prefecture.create(name: '北海道')
  city_names.each do |city_name|
    city_name = prefecture.cities.create(name: city_name)
    spot_names.each do |spot_name|
      city_name.spots.create(name: spot_name)
 end
end