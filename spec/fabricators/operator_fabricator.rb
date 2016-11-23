Fabricator(:operator) do
  identifier      'unasuke'
  position        1
  name            'うなすけ'
  password_digest BCrypt::Password.create('password')
  icon            'icon.png'
  school_id       1
  github          'https://github.com/unasuke'
  bitbucket       'https://bitbucket.org/unasuke'
  slideshare      'http://www.slideshare.net/yusukenakamura1994'
  twitter         'https://twitter.com/yu_suke1994'
  facebook        'https://www.facebook.com/yusuke.nakamura1994'
  site            'https://unasuke.com'
  description     'description'
  email           'yusuke1994525@gmail.com'
end
