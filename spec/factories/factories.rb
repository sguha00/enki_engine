FactoryGirl.define do

  factory :tag, :class => Enki::Tag do |a|
    a.name 'Tag'
  end

  factory :post, :class => Enki::Post do |a|
    a.title     'A post'
    a.slug      'a-post'
    a.body      'This is a post'

    a.published_at 1.day.ago
    a.created_at   1.day.ago
    a.updated_at   1.day.ago
  end

  factory :comment, :class => Enki::Comment do |a|
    a.author       'Don Alias'
    a.author_email 'enki@enkiblog.com'
    a.author_url   'http://enkiblog.com'
    a.body         'I find this article thought provoking'
    
    post
  end

end