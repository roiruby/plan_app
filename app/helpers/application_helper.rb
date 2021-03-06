module ApplicationHelper
  require "uri"

  def text_url_to_link text

  URI.extract(text, ['http','https']).uniq.each do |url|
    sub_text = ""
    sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"

    text.gsub!(url, sub_text)
  end

  return text
  end
  
  
  def default_meta_tags
    {
      site: 'Pladuce【プラデュース】',
      title: 'Pladuce【プラデュース】┃毎日をもっと楽しく♪みんなのプランでプロデュース(遊び・お出かけ情報プラン共有サイト)',
      reverse: true,
      separator: '|',
      description: '女子会・デート・お出かけ・旅行など様々なプランを投稿・共有！旅行のしおりにもなる、ソーシャルメディアPladuce【プラデュース】',
      keywords: '旅行,デート,お出かけ,女子会,ドライブ,グルメ,カフェ,観光,サプライズ,ダイエット,トレーニング,勉強法,カップル,ファミリー,学生',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('favicon.ico') },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@Pladuce_jp',
      }
    }
  end
  
end
