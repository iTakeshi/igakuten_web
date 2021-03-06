# coding: utf-8

class BlogAuthor < ActiveRecord::Base
  attr_accessible :name

  has_many :blog_entries

  validates :name,
    presence: {message: '名前を入力してください。'},
    uniqueness: {message: '入力された名前はすでに使用されています。'}
end
