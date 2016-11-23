Fabricator(:article) do
  url           'article'
  title         'テスト記事'
  body          'テスト記事本文'
  operator
  thumbnail_url 'test.png'
  published_at  Time.zone.parse('2016-10-23')
end
